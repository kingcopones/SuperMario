//
//  WebView.swift
//  SuperMario
//
//  Created by King Copones on 10/25/21.
//


import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
  var url: URL
  func makeUIView(context: UIViewRepresentableContext<WebView>) -> UIView {
    let view = WKWebView()
    view.configuration.defaultWebpagePreferences.allowsContentJavaScript = true
    view.isOpaque = true;
    view.backgroundColor = .clear;
    view.load(URLRequest(url: url))
    
    
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<WebView>) {
  }
}
