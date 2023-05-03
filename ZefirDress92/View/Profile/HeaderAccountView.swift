//
//  HeaderAccountView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 15.04.2023.
//

import SwiftUI

struct HeaderAccountView: View {
    @ObservedObject var userDataVM = UserDataViewModel()
    @State var goToProfile: Bool = false
    
    var body: some View {
        VStack(spacing: 5){
            Text(userDataVM.editUserAdress)
            Text(userDataVM.editUserSurname)
            Text(userDataVM.editUserPhone)
            Text(userDataVM.editUserAdress)
    
            Button{
                goToProfile.toggle()
            } label: {
                Text("Редактировать")
                    .font(.caption)
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
            .environmentObject(UserDataViewModel())
    }
}
