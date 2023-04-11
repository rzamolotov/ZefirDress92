//
//  Send.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 10.04.2023.
//

import SwiftUI

struct Send: View {
    var body: some View {
        Button(action: {
            let message = Message(subject: "Hello,_this_is_a_test_message_from_My_App!", body: "New_message_from_My_App", toEmail: "rzamolotov@gmail.com")
            let apiKey = "64ct6en5ijiipgpbbfwkya9nddf5ucfbh3t1we5a"
            sendUniSenderMessage(message: message, apiKey: apiKey)
        }) {
            Text("Send message")
        }
    }
    func sendUniSenderMessage(message: Message, apiKey: String) {
        
   
        let urlString = "https://api.unisender.com/ru/api/sendEmail?format=json&api_key=64ct6en5ijiipgpbbfwkya9nddf5ucfbh3t1we5a"
        guard let url = URL(string: urlString) else {
            print("Error: invalid URL")
            return
        }
        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "&sender_name=" : "Zefir Dress",
            "&sender_email=" : message.toEmail,
            "&subject=": message.subject,
            "&body=": message.body,
        ]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            request.httpBody = jsonData
        } catch {
            print("Error: failed to serialize parameters")
            return
        }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("Error: no data received")
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                // Добавьте обработку успешной отправки сообщения здесь
            } catch {
                print("Error: failed to parse JSON")
                return
            }
        }
        task.resume()
    }
}


struct Send_Previews: PreviewProvider {
    static var previews: some View {
        Send()
    }
}
