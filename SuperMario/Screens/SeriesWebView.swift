//
//  SeriesWebView.swift
//  SuperMario
//
//  Created by King Copones on 10/25/21.
//

import SwiftUI

struct SeriesWebView: View {
    @Binding var searchQuery:String
    var body: some View {
        VStack(alignment: .leading,spacing: 0){
            BackButton(title: "Series Description")
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
            WebView(url: URL(string: "https://www.google.com/search?q=\(searchQuery)")!)
        }
          .navigationBarTitle("")
          .navigationBarHidden(true)
    }
}

struct SeriesWebView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesWebView(searchQuery: .constant(""))
    }
}
