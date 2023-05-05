//
//  HeaderAccountView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 15.04.2023.
//

import SwiftUI

struct HeaderAccountView: View {
    @StateObject var userDataVM = UserDataViewModel()
    @State var goToProfile: Bool = false
    
    var body: some View {
        VStack(spacing: 5){
                Text("Данные о пользователе")
                .font(.custom(mediumFont, size: fontSizeMedium))
            VStack {
                Text(userDataVM.editUserName)
                Text(userDataVM.editUserSurname)
                Text(userDataVM.editUserPhone)
                Text(userDataVM.editUserAdress)
            }
            .font(.custom(lightFont, size: fontSizeMedium))
    
            Button{
                goToProfile.toggle()
            } label: {
                Text("Редактировать")
                    .font(.custom(mediumFont, size: fontSizeMedium))
                    .padding(10)
            }
            .sheet(isPresented: $goToProfile) {
                ProfileView()
            }
        }
    }
}



struct HeaderAccountView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAccountView()
    }
}
