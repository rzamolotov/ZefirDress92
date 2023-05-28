//
//  ItemDetailView.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

struct ItemDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var product: Product
    var id: String
    var title: String
    var size: [String]
    var price_photo: Int
    var price_rent: Int?
    var deposit: Int
    var description: String
    var link: String
    var image_link: [String]
    var availability: String
    var price: String
    var condition: String
    var isAddToFavorite: Bool
    var category: [String]
    
    init(id: String, title: String, size: [String], price_photo: Int, price_rent: Int, deposit: Int, description: String, link: String, image_link: [String], availability: String, price: String, condition: String, isAddToFavorite: Bool, category: [String]) {
        self.id = id
        self.title = title
        self.size = size
        self.price_photo = price_photo
        self.price_rent = price_rent
        self.deposit = deposit
        self.description = description
        self.link = link
        self.image_link = image_link
        self.availability = availability
        self.price = price
        self.condition = condition
        self.isAddToFavorite = isAddToFavorite
        self.category = category
        
        self.product = Product(id: id, title: title, size: size, price_photo: price_photo, price_rent: price_rent, deposit: deposit, description: description, link: link, image_link: image_link, availability: availability, price: price, condition: condition, isAddToFavorite: isAddToFavorite, category: category)
    }
    
    var body: some View {
        HStack{
            ItemBackButton()
                .padding([.leading, .trailing, .top])
        }
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                ZStack{
                    TabView{
                        ForEach(product.image_link ?? ["https://i.ibb.co/wyBwfHG/IMG-7167.jpg"], id: \.self) { image in
                            AsyncImage(url: URL(string: image) ?? URL(string: "https://i.ibb.co/wyBwfHG/IMG-7167.jpg")!, placeholder: { ProgressView() }, image: { Image(uiImage: $0) .resizable() } )
                                .aspectRatio(contentMode: .fill)
                                .frame(width: screen.width, height: screen.height / 1.5)
                                .cornerRadius(5)
                        }
                    }
                    .frame(width: screen.width, height: screen.height / 1.5)
                    .tabViewStyle(.page(indexDisplayMode: .always))
                }
                
                ItemDescriptionView(product: product)
            }
        }
        .navigationBarBackButtonHidden(true)
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.width > 0 {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
        )
        
    }
}


struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetailView(id: example.id,
                           title: example.title,
                           size: example.size,
                           price_photo: example.price_photo,
                           price_rent: example.price_rent ?? 0,
                           deposit: example.deposit,
                           description: example.description,
                           link: example.link,
                           image_link: example.image_link ?? ["https://i.ibb.co/wyBwfHG/IMG-7167.jpg"],
                           availability: example.availability,
                           price: example.price,
                           condition: example.condition,
                           isAddToFavorite: example.isAddToFavorite,
                           category: example.category)
        }
    }
}
