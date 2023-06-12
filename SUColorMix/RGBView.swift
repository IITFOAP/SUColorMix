//
//  RGBView.swift
//  SUColorMix
//
//  Created by Рома Баранов on 12.06.2023.
//

import SwiftUI

struct RGBView: View {
    let meaningRed: Double
    let meaningGreen: Double
    let meaningBlue: Double
    
    
    var body: some View {
        ZStack {
            Color(red: meaningRed / 255, green: meaningGreen / 255, blue: meaningBlue / 255)
                .frame(width: 350, height: 150)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 4)
                        .foregroundColor(.white)
                )
        }
    }
}
