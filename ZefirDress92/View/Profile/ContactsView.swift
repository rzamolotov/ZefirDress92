//
//  ContactsView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 05.05.2023.
//

import SwiftUI

struct ContactsView: View {
    var body: some View {
        VStack{
            HeaderViewHomeScreen()
            Text("Наши контакты")
                .padding(.top, 20)
                .font(.custom(boldFont, size: fontSizeLarge))
                .foregroundColor(colorBrightPink)
            Spacer()
            
            VStack(alignment: .leading) {
                Button(action: {
                    if let phoneCallURL = URL(string: "tel://+79786273356") {
                        if UIApplication.shared.canOpenURL(phoneCallURL) {
                            UIApplication.shared.open(phoneCallURL, options: [:], completionHandler: nil)
                        }
                    }
                }) {
                    Text("тел. +7 978 627 33 56")
                }
                .foregroundColor(colorFont)
                .font(.custom(lightFont, size: fontSizeMedium))
                .padding(.bottom)
                
                Button(action: {
                    if let instagramURL = URL(string: "https://www.instagram.com/zefirdress/") {
                        if UIApplication.shared.canOpenURL(instagramURL) {
                            UIApplication.shared.open(instagramURL, options: [:], completionHandler: nil)
                        }
                    }
                }) {
                    Text("Instagram @zefirdress")
                }
                .foregroundColor(colorFont)
                .font(.custom(lightFont, size: fontSizeMedium))
                .padding(.bottom)
                
                Button(action: {
                    if let vkURL = URL(string: "https://vk.com/zefirdress") {
                        if UIApplication.shared.canOpenURL(vkURL) {
                            UIApplication.shared.open(vkURL, options: [:], completionHandler: nil)
                        }
                    }
                }) {
                    Text("www.vk.com/zefirdress")
                }
                .foregroundColor(colorFont)
                .font(.custom(lightFont, size: fontSizeMedium))
                .padding(.bottom)
                
                Button(action: {
                    if let websiteURL = URL(string: "https://zefirdress.ru") {
                        if UIApplication.shared.canOpenURL(websiteURL) {
                            UIApplication.shared.open(websiteURL, options: [:], completionHandler: nil)
                        }
                    }
                }) {
                    Text("www.zefirdress.ru")
                }
                .foregroundColor(colorFont)
                .font(.custom(lightFont, size: fontSizeMedium))
                .padding(.bottom)
            }
            Spacer()
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
