//
//  ColorComponentView.swift
//  Sliders
//
//  Created by Сашок on 22.02.2022.
//

import SwiftUI

struct ColorComponentView: View {
    
    @Binding var value: Double
    @State private var text: String = ""
    
    var color: Color
    
    var body: some View {
        HStack {
            Text(String(lround(value))).frame(width: 50, alignment: .leading)
            
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
                .onChange(of: self.value) { newValue in
                    text = String(lround(newValue))
                }
            
            ColorTextFieldView(value: $value, text: $text)
        }
        .onAppear {
            text = String(lround(value))
        }
    }
}

struct ColorComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ColorComponentView(value: .constant(100), color: .red)
    }
}
