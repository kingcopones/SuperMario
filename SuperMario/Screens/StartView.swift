//
//  StartView.swift
//  SuperMario
//
//  Created by King Copones on 10/19/21.
//

import SwiftUI

//Start View for Character List
@available(iOS 15.0, *)
struct StartView: View {
    @StateObject var vm = StartViewModel()
    @State var isPresented = false
    @State var imageURL = ""
    @State var searchQuery = ""
    @State var isActive = false
    var body: some View {
        NavigationView{
        ZStack{
            NavigationLink(
                destination: ViewImage(imageURL: $imageURL), isActive: $isActive){
              EmptyView()
            }
        VStack{
            header
            Divider()
            List(vm.character, id: \.self){ i in
                // itemList
                HStack(spacing: 30){
                    AsyncImage(url: URL(string: i.image), scale: 1.0){ phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 100)
                                
                        }else {
                            ShimmerCardView()
                                .frame(width: 70, height: 100)
                        }
                    }.onTapGesture {
                        imageURL = i.image
                        self.isActive = true
                    }
                    HStack{
                    VStack(alignment: .leading, spacing: 5){
                        Text("Name: \(i.character)")
                            .fontWeight(.semibold)
                        Text("Series: \(i.gameSeries)")
                            .font(.caption2)
                    }
                    Spacer()
                }
                }.onTapGesture {
                    searchQuery = i.gameSeries.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                    print (searchQuery)
                    self.isPresented.toggle()
                }
            }
            Spacer()
        }
        } .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .fullScreenCover(isPresented: $isPresented){
            SeriesWebView(searchQuery: $searchQuery)
        }
        }.onAppear{
            vm.fetch()
        }
    }
}

@available(iOS 15.0, *)
extension StartView {
    var header: some View{
        HStack{
            Spacer()
            Text("Character List")
                .font(.system(size:20, weight: .bold))
                .padding(5)
            Spacer()
        }
    }
}

@available(iOS 15.0, *)
struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .navigationBarHidden(true)
            .environmentObject(StartViewModel())
    }
    
}
