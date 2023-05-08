//
//  WorkConditionsView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 05.05.2023.
//

import SwiftUI

struct WorkConditionsView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack() {
           ItemBackButton()
                .padding([.top, .leading, .trailing])
            ScrollView {
                    Text("Условия доставки")
                        .font(.custom(boldFont, size: fontSizeLarge))
                        .foregroundColor(colorBrightPink)
                        .padding([.top, .bottom])
                VStack(alignment: .leading) {
                    Text("Мы рады приветствовать вас в нашем прокате платьев! Чтобы сделать процесс аренды максимально удобным для вас, мы разработали несколько правил работы.")
                        .padding(.bottom)
                    
                    Text("**Во-первых**, мы работаем каждый день с 10:00 до 20:00. Вы можете сделать заказ в любой удобный для вас день и время.")
                        .padding(.bottom)
                    
                    Text("**Во-вторых**, для того чтобы сделать заказ, вам нужно добавить выбранное платье в корзину на нашем сайте или в приложении. После оформления заказа наш менеджер свяжется с вами для уточнения деталей по доставке.")
                        .padding(.bottom)
                    
                    Text("**В-третьих**, мы предоставляем бесплатную доставку по указанному вами адресу. Доставка осуществляется в удобное для вас время.")
                        .padding(.bottom)
                    
                    Text("**В-четвертых**, время на примерку платья составляет 30 минут. Если вам нужно продлить время примерки, пожалуйста, свяжитесь с нашим менеджером.")
                        .padding(.bottom)
                    
                    Text("**В-пятых**, максимальное количество платьев, которое может выбрать клиент, составляет 10 штук. Мы стараемся сделать наши услуги доступными и удобными для всех, поэтому у нас есть широкий ассортимент платьев на любой вкус и размер.")
                        .padding(.bottom)
                    
                    Text("**В-шестых**, возврат товара осуществляется в течение 24 часов после получения заказа. Пожалуйста, убедитесь, что платье находится в идеальном состоянии, без повреждений и следов использования.")
                        .padding(.bottom)
                    
                    Text("**В-седьмых**, мы принимаем оплату наличными или картой. Выбирайте удобный для вас способ оплаты.")
                        .padding(.bottom)
                        
                    Text("Спасибо за выбор нашего проката платьев! Если у вас есть какие-либо вопросы, пожалуйста, не стесняйтесь связаться с нашим менеджером. Мы всегда готовы помочь вам с выбором платья и сделать процесс аренды приятным и безопасным.")
                        .padding(.bottom)
                }
                .font(.custom(mediumFont, size: fontSizeMedium))
                .foregroundColor(colorFont)

                
                .padding([.top, .bottom])
            }
            .padding([.leading, .trailing])
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
    }
}

struct WorkConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkConditionsView()
    }
}
