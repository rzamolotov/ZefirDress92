//
//  Profile.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 15.04.2023.
//

import SwiftUI

struct Profile: View {
    enum Field {
        case name
        case surname
        case phoneNumber
        case email
        case adress
    }
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    var newProfile: PersonalData
    
    @State var name = ""
    @State var surname = ""
    @State var phoneNumber = ""
    @State var email = ""
    @State var adress = ""
    
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
                    TextField("Имя", text: $name)
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
                    TextField("Фамилия", text: $surname)
                        .focused($focusedField, equals: .surname)
                        .textInputAutocapitalization(.words)
                        .disableAutocorrection(true)
                        .keyboardType(.default)
                        .padding(.leading)
                }
            } //поле для фамилии
            .frame(width: screen.width / 1.1, height: screen.height / 18)
            .cornerRadius(20)
            ZStack{
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.1)
                HStack{
                    TextField("Email", text: $email)
                        .focused($focusedField, equals: .email)
                        .textInputAutocapitalization(.words)
                        .disableAutocorrection(true)
                        .keyboardType(.emailAddress)
                        .padding(.leading)
                }
            } // поле емаил
            .frame(width: screen.width / 1.1, height: screen.height / 18)
            .cornerRadius(20)
            ZStack{
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.1)
                HStack{
                    TextField("Номер телефона", text: $phoneNumber)
                        .focused($focusedField, equals: .phoneNumber)
                        .textInputAutocapitalization(.words)
                        .disableAutocorrection(true)
                        .keyboardType(.phonePad)
                        .padding(.leading)
                }
            } // поле номер телефона
            .frame(width: screen.width / 1.1, height: screen.height / 18)
            .cornerRadius(20)
            ZStack{
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.1)
                HStack{
                    TextField("Адрес доставки", text: $adress)
                        .focused($focusedField, equals: .adress)
                        .textInputAutocapitalization(.words)
                        .disableAutocorrection(true)
                        .keyboardType(.default)
                        .padding(.leading)
                }
            } // поле адреса доставки
            .frame(width: screen.width / 1.1, height: screen.height / 18)
            .cornerRadius(20)
            
            Button(action: {
                
                presentationMode.wrappedValue.dismiss() //go back
                
                // Update the fields of the single PersonalData object
                newProfile.name = name
                newProfile.surname = surname
                newProfile.phoneNumber = phoneNumber
                newProfile.email = email
                newProfile.adress = adress
                //                presentationMode.wrappedValue.dismiss()//go back
                //                let newUser = PersonalData(context: viewContext)
                //                newUser.adress = adress
                //                newUser.name = name
                //                newUser.surname = surname
                //                newUser.phoneNumber = phoneNumber
                //                newUser.email = email
                do {
                    try viewContext.save()
                    print("profile saved")
                } catch {
                    print("cant`t save profile data \(error)")
                }
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
                print("success")
                //                let newUser = PersonalData(context: viewContext)
                //                myProfile.updateValue(newUser, forKey: "newUser")
                //                newUser.adress = newProfile.adress
                //                newUser.name = newProfile.name
                //                newUser.surname = newProfile.surname
                //                newUser.phoneNumber = newProfile.phoneNumber
                //                newUser.email = newProfile.email
                //                do {
                //                    try viewContext.save()
                //                    print("profile saved")
                //                } catch {
                //                    print("cant`t save profile data \(error)")
                //                }
            }
        }
    }
}



struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(newProfile: PersonalData())
    }
}
