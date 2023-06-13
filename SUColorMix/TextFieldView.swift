//
//  TextFieldView.swift
//  SUColorMix
//
//  Created by Рома Баранов on 12.06.2023.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var userMeaning: String

    var body: some View {
        TextField("", text: $userMeaning )
            .textFieldStyle(.roundedBorder)
            .frame(width: 45)
            .keyboardType(.decimalPad)
            .preferredColorScheme(.light)
            .onChange(of: userMeaning) { _ in
                numberCheck()
            }
    }
    
    private func numberCheck() {
        guard let number = Double(userMeaning) else { return }
        if number > 255 {
            userMeaning = "255"
        } else if number < 1 {
            userMeaning = "1"
        }
    }
}

    
