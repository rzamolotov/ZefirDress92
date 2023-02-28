//
//  FilterView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 28.02.2023.
//

import SwiftUI

struct FilterView: View {
    //MARK: - Body
    var body: some View {
        VStack {
            HStack{
                Text("Найди свое платье")
                    .font(.title)
            }
            .padding([.top, .leading, .trailing])
            
            
            
            TextFieldsFilerView()
                .padding(.top)
            
            Spacer()
            
            Button( action: {
              
            }, label: {
                ZStack {
                    Rectangle()
                        .frame(height: screen.height / 20)
                        .cornerRadius(10)
                        .foregroundColor(.pink)
                        .opacity(0.7)
                        .padding([.trailing, .leading, .trailing])
                    Text("Поиск")
                        .foregroundColor(.white)
                        .font(Font.custom("MarkProHeavy", size: 18))
                        
                }
            })
        }
        .background(colorBackground)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
