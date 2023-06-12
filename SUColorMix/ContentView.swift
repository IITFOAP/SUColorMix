//
//  ContentView.swift
//  SUColorMix
//
//  Created by Рома Баранов on 11.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var meaningRed = Double.random(in: 1...255)
    @State private var meaningGreen = Double.random(in: 1...255)
    @State private var meaningBlue = Double.random(in: 1...255)
    
    var body: some View {
        ZStack {
            Color(.blue)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                RGBView(
                    meaningRed: meaningRed,
                    meaningGreen: meaningGreen,
                    meaningBlue: meaningBlue
                )
                
                HStack {
                    TextView(meaning: meaningRed)
                    SliderView(meaning: $meaningRed, tint: .red)
                }
                
                HStack {
                    TextView(meaning: meaningGreen)
                    SliderView(meaning: $meaningGreen, tint: .green)
                }
                
                HStack {
                    TextView(meaning: meaningBlue)
                    SliderView(meaning: $meaningBlue, tint: .blue)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


