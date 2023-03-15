//
//  EmptyFavoritesView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 15.03.2023.
//

import SwiftUI

struct EmptyFavoritesView: View {
    var body: some View {
        VStack{
            Image("Olivia")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .clipped()
                .cornerRadius(150)
                .padding(.bottom, 75)
                .padding(.top, 25)
            Text("-Zefir Dess-")
                .foregroundColor(.pink)
                .opacity(0.7)
                .padding(.bottom)
                .font(.largeTitle)
            Text("Тут пока ничего нет, но скоро будут платья, которые ты решишь отложить на потом")
                .foregroundColor(.pink)
                .opacity(0.9)
                .font(.subheadline)
                .padding([.leading, .trailing])
        }
    }
}

struct EmptyFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyFavoritesView()
    }
}
