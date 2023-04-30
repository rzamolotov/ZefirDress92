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

let columnSpacing: CGFloat = 5
let screen = UIScreen.main.bounds
let rowSpacing: CGFloat = 5
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

//fontSize

let fontSizeVerySmall = screen.height / 60
let fontSizeSmall = screen.height / 50
let fontSizeMedium = screen.height / 40
let fontSizeMediuPlus = screen.height / 30
let fontSizeLarge = screen.height / 20
let fontSizeHuge = screen.height / 15

// Product example
let example = Product(id: "124312", title: "Платье Amabel", size: ["42"], price_photo: 1500, price_rent: 2500, deposit: 1000, description: "Белое платье, состоящее из юбки с 3х метровым шлейфом и двумя вариантами топов ('американка' и вариант с рукавами).", link: "https://zefirdress.ru/vseplatya/accessuars", image_link: ["https://i.ibb.co/ZVV0T0H/IMG-3445.jpg", "https://i.ibb.co/nD300vq/IMG-3450.jpg", "https://i.ibb.co/khHxhKc/IMG-3451.jpg", "https://i.ibb.co/Rzw3b1W/IMG-3608.jpg", "https://i.ibb.co/LtjHDQJ/IMG-3609.jpg", "https://i.ibb.co/4168GTG/IMG-3610.jpg", "https://i.ibb.co/34bmM8X/IMG-3612.jpg", "https://i.ibb.co/CbCYTCs/photo-2020-04-28-08-09-57.jpg", "https://i.ibb.co/nRW4chc/photo-2020-04-28-08-10-00.jpg", "https://i.ibb.co/vD2ZSq0/photo-2020-04-28-08-10-02.jpg", "https://i.ibb.co/Zg4596V/photo-2020-04-28-08-10-03.jpg", "https://i.ibb.co/xLG2Ltj/photo-2020-04-28-08-10-07.jpg", "https://i.ibb.co/591dWMv/photo-2020-04-28-08-10-16.jpg", "https://i.ibb.co/qpcGV8m/photo-2020-04-28-12-31-34.jpg", "https://i.ibb.co/vJpYyG1/photo-2020-04-28-12-31-36.jpg", "https://i.ibb.co/BnZk7DL/photo-2020-04-28-12-31-38.jpg", "https://i.ibb.co/6P8skwk/photo-2020-04-28-12-31-40.jpg"], availability: "in_stock", price: "1500 RUB", condition: "new", isAddToFavorite: true, category: ["детское"]
    )
