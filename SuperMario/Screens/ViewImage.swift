//
//  ViewImage.swift
//  SuperMario
//
//  Created by King Copones on 10/19/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct ViewImage: View {
    @Binding var imageURL: String
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: imageURL)){ phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 300)
                    
                }else {
                    ShimmerCardView()
                        .frame(width: 200, height: 300)
                }
            }
            
        }
    }
}
@available(iOS 15.0, *)
struct ViewImage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ViewImage(imageURL: .constant(""))
        }
    }
}
