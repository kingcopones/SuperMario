//
//  BackButton.swift
//  SuperMario
//
//  Created by King Copones on 10/19/21.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var title: String
    var body: some View {
        HStack{
            Image(systemName: "chevron.backward")
                .font(.system(size: 17, weight: .bold))
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
            Text(title)
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
            Spacer()
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(title: "Back").previewLayout(.sizeThatFits)
    }
}
