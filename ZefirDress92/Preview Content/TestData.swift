//
//  TestData.swift
//  ZefirDress92Tests
//
//  Created by Роман Замолотов on 31.03.2023.
//

import Foundation

let testFeature_nc73649170: Data = """
        {
            "id": "21747874",
            "title": "Детские туфельки",
            "size": ["40", "42"],
            "price_photo": 1500,
            "price_rent": 3000,
            "deposit": 1000,
            "description": "Стоимость аренды Фотосессия 300 ₽ (1 сутки) ⠀ Залог 500 ₽ (возвратный) Описание Детские туфельки в пайетках, подходят на возраст 1 годик",
            "link": "https://zefirdress.ru/vseplatya/dettufel",
            "image_link": "http://shop-cdn1.vigbo.tech/shops/195624/products/21747874/images/preview-d9277535cc9e40561560de12d186bf15.JPG",
            "availability": "in_stock",
            "price": "300 RUB",
            "condition": "new",
            "isAddToFavorite": false,
            "category": ["Платья для бала"]
    }
    """.data(using: .utf8)!

let testProductData: Data = """
{
    "products": [{
            "item": {
                "id": "21551666",
                "title": "Платье Alexa",
                "size": [
                    "40",
                    "42"
                ],
                "price_photo": 1500,
                "price_rent": 3000,
                "deposit": 1000,
                "description": "Элегантное черное сияющее платье, облегает фигуру, расшито пайетками, низ шифон.",
                "link": "https://zefirdress.ru/vseplatya/plate-alexa",
                "image_link": "http://shop-cdn1.vigbo.tech/shops/195624/products/21551666/images/preview-357ee131241ba092806ccdd8db92dcb2.jpg",
                "availability": "in_stock",
                "price": "1500 RUB",
                "condition": "new",
                "isAddToFavorite": false,
                "category": [
                    "Платья для бала"
                ]
            }
        },
        {
            "item": {
                "id": "21556590",
                "title": "Платье Adele",
                "size": [
                    "40",
                    "42",
                    "44",
                    "46",
                    "48",
                    "50"
                ],
                "price_photo": 1200,
                "deposit": 1000,
                "description": "Будуарное платье для фотосессии беременности и не только. Воздушное, летящее, состоит из прозрачных шлейфов и лифа на резинке.",
                "link": "https://zefirdress.ru/vseplatya/plate-adele",
                "image_link": "http://shop-cdn1.vigbo.tech/shops/195624/products/21556590/images/preview-9ea74d3df626ddce9a7d022ef6c774d4.JPG",
                "availability": "in_stock",
                "price": "1200 RUB",
                "condition": "new",
                "isAddToFavorite": false,
                "category": [
                    "Платья для бала"
                ]
            }
        }
    ]
}

""".data(using: .utf8)!
