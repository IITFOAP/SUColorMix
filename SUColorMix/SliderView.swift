//
//  SliderView.swift
//  SUColorMix
//
//  Created by Рома Баранов on 12.06.2023.
//

import SwiftUI

struct SliderView: View {
    @Binding var meaning: Double
    let tint: Color
    
    var body: some View {
        Slider(value: $meaning, in: 1...255, step: 1)
            .tint(tint)
    }
}

