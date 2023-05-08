//
//  AboutUsView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 15.04.2023.
//

import SwiftUI

struct AboutUsView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack{
            ItemBackButton()
                .padding([.top, .leading, .trailing])
        ScrollView {
            Image("Olivia")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .clipped()
                .cornerRadius(150)
                .padding([.top, .bottom])
            VStack(alignment: .leading){
                Text("**Zefir Dress** - сервис проката вечерних платьев в Севастополе для фотосессий и мероприятий. Вы можете арендовать у нас платье для любого повода - выпускной, бал, свадьба подруги, свидание, фотосессия, вечеринка, корпоратив, фотосессия беременности и день рождение.")
                    .foregroundColor(colorFont)
                    .font(.custom(mediumFont, size: fontSizeMedium))
                    .padding([.leading, .trailing, .bottom])
                
                Text("Доступные цены")
                    .foregroundColor(colorBrightPink)
                    .font(.custom(boldFont, size: fontSizeMedium))
                    .padding([.leading, .trailing, .bottom])
                
                Text("Мы следим за стоимостью наших платьев и стараемся, чтобы она была доступна для вас!")
                    .foregroundColor(colorFont)
                    .font(.custom(mediumFont, size: fontSizeMedium))
                    .padding([.leading, .trailing, .bottom])
                
                Text("Доставка платьев")
                    .foregroundColor(colorBrightPink)
                    .font(.custom(boldFont, size: fontSizeMedium))
                    .padding([.leading, .trailing, .bottom])
                
                Text("Мы являемся сервисом по аренде платьев и работаем в режиме доставки платьев [💞] Вы можете выбрать до 10 платьев и мы привезём Вам их на примерку домой. Вы их самостоятельно меряете и затем выносите (время до 30 минут на примерку), услуга бесплатная по Севастополю.")
                    .foregroundColor(colorFont)
                    .font(.custom(mediumFont, size: fontSizeMedium))
                    .padding([.leading, .trailing, .bottom])
                
                Text("Любые вопросы по размеру и наличию подскажем онлайн!")
                    .foregroundColor(colorFont)
                    .font(.custom(mediumFont, size: fontSizeMedium))
                    .padding([.leading, .trailing, .bottom])
                
                Text("Состояние платьев")
                    .foregroundColor(colorBrightPink)
                    .font(.custom(boldFont, size: fontSizeMedium))
                    .padding([.leading, .trailing, .bottom])
                
                Text(" Наши платья в идеальном состоянии и проходят чистку после каждого проката, а часто еще и между примерками!")
                    .foregroundColor(colorFont)
                    .font(.custom(mediumFont, size: fontSizeMedium))
                    .padding([.leading, .trailing, .bottom])
            }
            VStack(alignment: .leading){
                Text("Аксессуары")
                    .foregroundColor(colorBrightPink)
                    .font(.custom(boldFont, size: fontSizeMedium))
                    .padding([.leading, .trailing, .bottom])
                
                Text("Вы можете дополнить образ сережками и колье, которые идут бесплатно к платью!")
                    .foregroundColor(colorFont)
                    .font(.custom(mediumFont, size: fontSizeMedium))
                    .padding([.leading, .trailing, .bottom])
                
                Text("Выбор платьев")
                    .foregroundColor(colorBrightPink)
                    .font(.custom(boldFont, size: fontSizeMedium))
                    .padding([.leading, .trailing, .bottom])
                
                Text("В наличии более 150 платьев для ваших мероприятий, фотосессий, корпоративов и других поводов!")
                    .foregroundColor(colorFont)
                    .font(.custom(mediumFont, size: fontSizeMedium))
                    .padding([.leading, .trailing, .bottom])
                
                Text("Сервис")
                    .foregroundColor(colorBrightPink)
                    .font(.custom(boldFont, size: fontSizeMedium))
                    .padding([.leading, .trailing, .bottom])
                
                Text("Мы с вами ежедневно без выходных и праздников!")
                    .foregroundColor(colorFont)
                    .font(.custom(mediumFont, size: fontSizeMedium))
                    .padding([.leading, .trailing, .bottom])
            }

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
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
