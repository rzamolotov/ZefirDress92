//
//  FavoritesGrid.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 30.03.2023.
//

import SwiftUI

struct FavoritesGrid: View {
    @EnvironmentObject var network: Network
    var product: Product
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(buttonGray)
            HStack{
                   
                //: Image
                VStack {
                    HStack{
                        Text(product.title)
                            .foregroundColor(.black)
                            .font(.headline)
                            .padding(.top, 5)
                        
                        
                    }
                    HStack(spacing: 3) {
                        Text("Доступные размеры")
                            .font(.caption)
                            .fontWeight(.light)
                        ForEach(product.size, id: \.self) { size in
                            ZStack{
                                Rectangle()
                                    .frame(width: screen.width / 17, height: screen.width / 17, alignment: .center)
                                    .foregroundColor(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.pink.opacity(0.7), lineWidth: 3)
                                    )
                                    .cornerRadius(10)
                                
                                Text(size.rawValue)
                                    .font(.footnote)
                                    .foregroundColor(.pink)
                                    .opacity(0.7)
                            }
                        }
                    }//: Sizes
                }
            Spacer()
            }
        }
        .frame(width: screen.width / 1.1, height: screen.height / 5)
        .cornerRadius(10)
    }
}

struct FavoritesGrid_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesGrid(product: Product.example)
            .environmentObject(Network())
    }
}
