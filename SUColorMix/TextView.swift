//
//  TextView.swift
//  SUColorMix
//
//  Created by Рома Баранов on 12.06.2023.
//

import SwiftUI

struct TextView: View {
    let meaning: Double
    
    var body: some View {
        Text("\(lround(meaning))")
            .frame(width: 35)
            .foregroundColor(.white)
    }
}

