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


