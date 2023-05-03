//
//  ItemShareButton.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 03.05.2023.
//

import SwiftUI

struct ItemShareButton: View {
    var product: Product
    var body: some View {
        Button {
            presentShareSheet(url: (URL(string: product.link) ?? URL(string:"https://zefirdress.ru/"))!)
        } label: {
            Image(systemName: "square.and.arrow.up")
                .foregroundColor(colorBrightPink)
                .font(.custom(mediumFont, size: fontSizeMedium))
                .frame(width: screen.height / 22, height: screen.height / 22, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 5).stroke(colorBrightPink, lineWidth:1))
        }

    }
}

extension ItemShareButton {
    func presentShareSheet(url: URL) {
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        // Get the relevant window scene
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            // Get the window from the window scene
            if let window = windowScene.windows.first {
                // Present the view controller on the root view controller of the window
                window.rootViewController?.present(activityVC, animated: true, completion: nil)
            }
        }
    }
}

struct ItemShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ItemShareButton(product: example)
    }
}
