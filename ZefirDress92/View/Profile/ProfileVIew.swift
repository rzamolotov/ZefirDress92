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
    @Binding var editUserName: String
    @Binding var editUserSurname: String
    @Binding var editUserPhone: String
    @Binding var editUserEmail: String
    @Binding var editUserAdress: String

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
                    TextField("Имя", text: $editUserName)
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
                    TextField("Фамилия", text: $editUserSurname)
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
                    TextField("Номер телефона", text: $editUserPhone)
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
                    TextField("Email", text: $editUserEmail)
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
                    TextField("Адрес", text: $editUserAdress)
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
                UserDefaults.standard.set(editUserName, forKey: userName)
                UserDefaults.standard.set(editUserSurname, forKey: userSurname)
                UserDefaults.standard.set(editUserPhone, forKey: userPhone)
                UserDefaults.standard.set(editUserEmail, forKey: userEmail)
                UserDefaults.standard.set(editUserAdress, forKey: userSurname)

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
                UserDefaults.standard.set(editUserName, forKey: userName)
                UserDefaults.standard.set(editUserSurname, forKey: userSurname)
                UserDefaults.standard.set(editUserPhone, forKey: userPhone)
                UserDefaults.standard.set(editUserEmail, forKey: userEmail)
                UserDefaults.standard.set(editUserAdress, forKey: userSurname)
            }
        }
    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(editUserName: .constant("Юля"), editUserSurname: .constant("Замолотова"), editUserPhone: .constant("+79787242551"), editUserEmail: .constant("ulya_nel@mail.ru"), editUserAdress: .constant("Севастополь, Спуск Шестакова 1"))
    }
}
