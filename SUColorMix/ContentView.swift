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
    @State private var userMeaningRed = ""
    @State private var userMeaningGreen = ""
    @State private var userMeaningBlue = ""
    
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
                        .onChange(of: meaningRed) { _ in
                            valueCheck()
                        }
                    TextFieldView(userMeaning: $userMeaningRed)
                }
                
                HStack {
                    TextView(meaning: meaningGreen)
                    SliderView(meaning: $meaningGreen, tint: .green)
                        .onChange(of: meaningGreen) { _ in
                            valueCheck()
                        }
                    TextFieldView(userMeaning: $userMeaningGreen)
                }
                
                HStack {
                    TextView(meaning: meaningBlue)
                    SliderView(meaning: $meaningBlue, tint: .blue)
                        .onChange(of: meaningBlue) { _ in
                            valueCheck()
                        }
                    TextFieldView(userMeaning: $userMeaningBlue)
                }
                
                Spacer()
            }
            
            .padding()
        }
        
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                            to: nil,
                                            from: nil,
                                            for: nil
            )
            
            meaningRed = Double(userMeaningRed) ?? 0.0
            meaningGreen = Double(userMeaningGreen) ?? 0.0
            meaningBlue = Double(userMeaningBlue) ?? 0.0
        }
        
        .button {
            meaningRed = Double(userMeaningRed) ?? 0.0
            meaningGreen = Double(userMeaningGreen) ?? 0.0
            meaningBlue = Double(userMeaningBlue) ?? 0.0
        }
        
        .onAppear {
            valueCheck()
        }
    }
    
    private func valueCheck() {
        userMeaningRed = String(lround(meaningRed))
        userMeaningGreen = String(lround(meaningGreen))
        userMeaningBlue = String(lround(meaningBlue))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct ButtonModifier: ViewModifier {
    var action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        action()
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                                        to: nil,
                                                        from: nil,
                                                        for: nil
                        )
                    }
                }
            }
    }
}
    
extension View {
    func button(action: @escaping () -> Void) -> some View{
        modifier(ButtonModifier(action: action))
    }
}


