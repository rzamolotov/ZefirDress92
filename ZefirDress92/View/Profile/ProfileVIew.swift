//
//  ProfileVIew.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 14.03.2023.
//

import SwiftUI

struct ProfileView: View {
    @Binding var user_name: String
    @Binding var user_phone_number: String
    @Binding var user_email: String
    @Binding var user_address: String
    
    var body: some View {
        VStack{
            UserInfoForm(name: $user_name, phoneNumber: $user_phone_number, email: $user_email, address: $user_address)
            
            SaveButton()
                .padding()
            
            Spacer()
        }
        .background(Color("LightGrayBackground"))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
            user_name: Binding.constant("John Doe"),
            user_phone_number: Binding.constant("123-456-7890"),
            user_email: Binding.constant("abc@abc.com"),
            user_address: Binding.constant("123 Apple Way, NY 12345"))
    }
}

struct SaveButton: View {
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()//go back
        }) {
            Text("Сохранить")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: screen.width / 3, height: screen.height / 18)
                .background(Color.pink)
                .opacity(0.7)
                .cornerRadius(15.0)
        }
    }
}

struct UserInfoForm: View {
    @Binding var name: String
    @Binding var phoneNumber: String
    @Binding var email: String
    @Binding var address: String
    
    var body: some View {
        Form {
            Section(header: Text("Личные данные")) {
                TextField("Имя", text: $name)
                    .textInputAutocapitalization(.words)
                    .disableAutocorrection(true)
                    .keyboardType(.default)
                TextField("Фамилия", text: $name)
                    .textInputAutocapitalization(.words)
                    .disableAutocorrection(true)
                    .keyboardType(.default)
                TextField("Номер телефона", text: $phoneNumber)
                    .keyboardType(.phonePad)
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .keyboardType(.emailAddress)
            }
            
            Section(header: Text("Введите адрес доставки")){
                TextField("Адрес", text: $address)
                    .textInputAutocapitalization(.words)
                    .disableAutocorrection(true)
                    .keyboardType(.default)
            }
        }
        .navigationTitle("Мои данные")
    }
}
