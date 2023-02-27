//
//  EditButton.swift
//  ZefirDress92
//
//  Created by Роман Замолотов on 26.02.2023.
//

import SwiftUI

struct EditButton: View {
    
    @Binding var editMode: EditMode
    
    var body: some View {
        Button(action: {
            switch editMode {
            case .active:
                editMode = .inactive
            case .inactive:
                editMode = .active
            default:
                break
            }
        }, label: {
            if let isEditing = editMode.isEditing, isEditing {
                Text("Готово")
            } else {
                Text("Редактировать")
            }
        })
    }
}

