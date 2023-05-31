//
//  ProfileVIew.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 14.03.2023.
//

import SwiftUI

struct ProfileView: View {
    enum Field {
        case name, surname, phoneNumber, adress, eventType, event, delivery
    }
    enum EventType: String {
        case photosession, event
    }
    
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var userDataVM = UserDataViewModel.shared
    @State private var isDiliveryPickerVisible = false
    @State private var isEventPickerVisible = false
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack {
            ItemBackButton()
                .padding([.top, .leading, .trailing])
            Spacer()
            ScrollView {
                Text("Введите ваши даные для доставки")
                    .font(.custom(boldFont, size: fontSizeMedium))
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                
                ZStack{
                    Rectangle()
                        .foregroundColor(colorPink)
                        .opacity(0.5)
                    HStack{
                        TextField("Имя", text: $userDataVM.editUserName)
                            .focused($focusedField, equals: .name)
                            .textInputAutocapitalization(.words)
                            .keyboardType(.default)
                            .padding(.leading)
                    }
                } //поле для имени
                .frame(width: screen.width / 1.1, height: screen.height / 18)
                .cornerRadius(20)
                ZStack{
                    Rectangle()
                        .foregroundColor(colorPink)
                        .opacity(0.5)
                    HStack{
                        TextField("Фамилия", text: $userDataVM.editUserSurname)
                            .focused($focusedField, equals: .surname)
                            .textInputAutocapitalization(.words)
                            .disableAutocorrection(true)
                            .keyboardType(.default)
                            .padding(.leading)
                    }
                } //поле для фамили
                .frame(width: screen.width / 1.1, height: screen.height / 18)
                .cornerRadius(20)
                ZStack{
                    Rectangle()
                        .foregroundColor(colorPink)
                        .opacity(0.5)
                    HStack{
                        TextField("Номер телефона", text: $userDataVM.editUserPhone)
                            .focused($focusedField, equals: .phoneNumber)
                            .keyboardType(.phonePad)
                            .padding(.leading)
                    }
                } //поле для номера телефона
                .frame(width: screen.width / 1.1, height: screen.height / 18)
                .cornerRadius(20)
                ZStack{
                    Rectangle()
                        .foregroundColor(colorPink)
                        .opacity(0.5)
                    HStack{
                        TextField("Адрес", text: $userDataVM.editUserAdress)
                            .focused($focusedField, equals: .adress)
                            .textInputAutocapitalization(.words)
                            .disableAutocorrection(true)
                            .keyboardType(.default)
                            .padding(.leading)
                    }
                } //поле для адрес
                .frame(width: screen.width / 1.1, height: screen.height / 18)
                .cornerRadius(20)
                ZStack{
                    Rectangle()
                        .foregroundColor(colorPink)
                        .opacity(0.5)
                    HStack{
                        TextField("Какая цель аренды фотосессия или мероприятие", text: $userDataVM.editEventType)
                            .focused($focusedField, equals: .adress)
                            .textInputAutocapitalization(.words)
                            .disableAutocorrection(true)
                            .keyboardType(.default)
                            .padding(.leading)
                    }
                } //поле тип примерки
                .frame(width: screen.width / 1.1, height: screen.height / 18)
                .cornerRadius(20)
                
                ZStack{
                    Rectangle()
                        .foregroundColor(colorPink)
                        .opacity(0.5)
                    HStack{
                        DatePicker("Дата примерки",
                                   selection: $userDataVM.editDeliveryDate,
                                   in: Date()...(Calendar.current.date(byAdding: .day, value: 50, to: Date()) ?? Date()),
                                   displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .padding(.leading)
                        .onChange(of: userDataVM.editDeliveryDate) { _ in
                            isDiliveryPickerVisible = false
                            
                        }
                    }
                } //поле дата доставки
                .frame(width: screen.width / 1.1, height: screen.height / 18)
                .cornerRadius(20)
                
                ZStack{
                    Rectangle()
                        .foregroundColor(colorPink)
                        .opacity(0.5)
                    HStack{
                        DatePicker("Дата аренды",
                                   selection: $userDataVM.editEventDate,
                                   in: Date()...(Calendar.current.date(byAdding: .day, value: 120, to: Date()) ?? Date()),
                                   displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .padding(.leading)
                        
                    }
                } //поле дата мероприятия
                .frame(width: screen.width / 1.1, height: screen.height / 18)
                .cornerRadius(20)
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss() //go back
                }) {
                    Text("Сохранить")
                        .font(.custom(mediumFont, size: fontSizeMedium))
                        .foregroundColor(colorBege)
                        .padding()
                        .frame(width: screen.width / 3, height: screen.height / 18)
                        .background(colorBrightPink)
                        .cornerRadius(15.0)
                        .padding(.top, 20)
                } //кнопка сохранить
            }
            
            .onSubmit {
                switch focusedField {
                case .name:
                    focusedField = .surname
                case .surname:
                    focusedField = .phoneNumber
                case .phoneNumber:
                    focusedField = .adress
                case .adress:
                    focusedField = .eventType
                default:
                    break
                    
                }
            }
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width > 0 {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
            )
            .navigationBarHidden(true)
            Spacer()
        }
    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(UserDataViewModel())
    }
}
