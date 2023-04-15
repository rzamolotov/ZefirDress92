//
//  ProfileVIew.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 14.03.2023.
//

import SwiftUI

struct ProfileView: View {
    enum Field {
        case name
        case surname
        case phoneNumber
        case email
        case adress
    }
    @Environment(\.presentationMode) private var presentationMode
    @Binding var userName: String
    @Binding var userSurname: String
    @Binding var userPhone: String
    @Binding var userEmail: String
    @Binding var userAdress: String

    @FocusState private var focusedField: Field?

    var body: some View {
        VStack{
            Text("Введите ваши даные для доставки")
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.bottom, 20)

            ZStack{
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.1)
                HStack{
                    TextField("Имя", text: $userName)
                        .focused($focusedField, equals: .name)
                        .textInputAutocapitalization(.words)
                        .disableAutocorrection(true)
                        .keyboardType(.default)
                        .padding(.leading)
                }
            } //поле для имени
            .frame(width: screen.width / 1.1, height: screen.height / 18)
            .cornerRadius(20)
            ZStack{
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.1)
                HStack{
                    TextField("Фамилия", text: $userSurname)
                        .focused($focusedField, equals: .surname)
                        .textInputAutocapitalization(.words)
                        .disableAutocorrection(true)
                        .keyboardType(.default)
                        .padding(.leading)
                }
            } //поле для имени
            .frame(width: screen.width / 1.1, height: screen.height / 18)
            .cornerRadius(20)
            ZStack{
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.1)
                HStack{
                    TextField("Номер телефона", text: $userPhone)
                        .focused($focusedField, equals: .phoneNumber)
                      
                        .disableAutocorrection(true)
                        .keyboardType(.phonePad)
                        .padding(.leading)
                }
            } //поле для имени
            .frame(width: screen.width / 1.1, height: screen.height / 18)
            .cornerRadius(20)
            ZStack{
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.1)
                HStack{
                    TextField("Email", text: $userEmail)
                        .focused($focusedField, equals: .email)
                        .disableAutocorrection(true)
                        .keyboardType(.emailAddress)
                        .padding(.leading)
                }
            } //поле для имени
            .frame(width: screen.width / 1.1, height: screen.height / 18)
            .cornerRadius(20)
            ZStack{
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.1)
                HStack{
                    TextField("Адрес", text: $userAdress)
                        .focused($focusedField, equals: .adress)
                        .textInputAutocapitalization(.words)
                        .disableAutocorrection(true)
                        .keyboardType(.default)
                        .padding(.leading)
                }
            } //поле для имени
            .frame(width: screen.width / 1.1, height: screen.height / 18)
            .cornerRadius(20)

            Button(action: {
                presentationMode.wrappedValue.dismiss() //go back
                UserDefaults.standard.set(userName, forKey: "UserName")
                UserDefaults.standard.set(userSurname, forKey: "UseSurname")
                UserDefaults.standard.set(userPhone, forKey: "UserPhone")
                UserDefaults.standard.set(userEmail, forKey: "UserName")
                UserDefaults.standard.set(userAdress, forKey: "UserAdress")

            }) {
                Text("Сохранить")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: screen.width / 3, height: screen.height / 18)
                    .background(Color.pink)
                    .opacity(0.7)
                    .cornerRadius(15.0)
                    .padding(.top, 20)
            }
        }

        .onSubmit {
            switch focusedField {
            case .name:
                focusedField = .surname
            case .surname:
                focusedField = .email
            case .email:
                focusedField = .phoneNumber
            case .phoneNumber:
                focusedField = .adress
            default:
                UserDefaults.standard.set(userName, forKey: "UserName")
                UserDefaults.standard.set(userSurname, forKey: "UseSurname")
                UserDefaults.standard.set(userPhone, forKey: "UserPhone")
                UserDefaults.standard.set(userEmail, forKey: "UserName")
                UserDefaults.standard.set(userAdress, forKey: "UserAdress")
            }
        }
    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userName: .constant("Юля"), userSurname: .constant("Замолотова"), userPhone: .constant("+79787242551"), userEmail: .constant("ulya_nel@mail.ru"), userAdress: .constant("Севастополь, Спуск Шестакова 1"))
    }
}
