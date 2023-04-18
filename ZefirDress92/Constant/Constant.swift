//
//  Constant.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI


// DATA

// COLOR

let colorBackground: Color = Color("gray")
let colorOrange: Color = Color("orange")
let colorBlue: Color = Color("blue")
let buttonGray: Color = Color("buttonGray")
let counterGray: Color = Color("counter")
let brownTelephone: Color = Color("brownTelephone")

// UX

let feedback = UIImpactFeedbackGenerator(style: .medium)

// LAYOUT

let columnSpacing: CGFloat = 10
let screen = UIScreen.main.bounds
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

//User Deafaults
let userEmail = "USEREMAIL"
let userAdress = "USERADRESS"
let userName = "USERNAME"
let userSurname = "USERSURNAME"
let userPhone = "USERPHONE"

//Fonts
let blackFont = "Montserrat-Black"
let boldFont = "Montserrat-Bold"
let extraBoldFont = "Montserrat-ExtraBold"
let extraLightFont = "Montserrat-ExtraLight"
let italicFont = "Montserrat-Italic"
let lightFont = "Montserrat-Light"
let mediumFont = "Montserrat-Medium"
let mediumItalicFont = "Montserrat-MediumItalic"
let regularFont = "Montserrat-Regular"
let thinFont = "Montserrat-Thin"
let thinItalicFont = "Montserrat-ThinItalic"

// Product example
let example = Product(id: "124312", title: "Платье Amabel", size: ["42"], price_photo: 1500, price_rent: 2500, deposit: 1000, description: "Белое платье, состоящее из юбки с 3х метровым шлейфом и двумя вариантами топов ('американка' и вариант с рукавами).", link: "https://zefirdress.ru/vseplatya/accessuars", image_link: "http://shop-cdn1.vigbo.tech/shops/195624/products/21750271/images/preview-54001b28d11190b216a1f972ba2e5c91.JPG", availability: "in_stock", price: "1500 RUB", condition: "new", isAddToFavorite: true, category: ["детское"]
    )
