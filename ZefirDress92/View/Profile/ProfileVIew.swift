//
//  ProfileVIew.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 14.03.2023.
//

import SwiftUI

struct ProfileView: View {
    @State private var name = ""
    @State private var surname = ""
    @State private var phoneNumber = ""
    @State private var email: String = ""
    @State private var address: String = ""
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: PersonalData.entity(), sortDescriptors: [])
    var newProfiles: FetchedResults<PersonalData>
    
    var body: some View {
        VStack{
            ForEach(newProfiles, id: \.self) { newProfile in
                UserInfoForm()
                
                SaveButton(newProfile: newProfile)
                    .padding()
                
                Spacer()
            }
        }
        .background(Color("LightGrayBackground"))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct SaveButton: View {
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    var newProfile: PersonalData
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()//go back
            let newUser = PersonalData(context: viewContext)
            newUser.adress = newProfile.adress
            newUser.name = newProfile.name
            newUser.surname = newProfile.surname
            newUser.phoneNumber = newProfile.phoneNumber
            newUser.email = newProfile.email
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
        }
    }
}

struct UserInfoForm: View {
    @State private var name = ""
    @State private var surname = ""
    @State private var phoneNumber = ""
    @State private var email: String = ""
    @State private var address: String = ""
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        Form {
            Section(header: Text("Личные данные")) {
                TextField("Имя", text: $name)
                    .textInputAutocapitalization(.words)
                    .disableAutocorrection(true)
                    .keyboardType(.default)
                TextField("Фамилия", text: $name)
                TextField("Фамилия", text: $surname)
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
