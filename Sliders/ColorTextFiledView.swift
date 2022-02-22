//
//  ColorTextFiledView.swift
//  Sliders
//
//  Created by Сашок on 22.02.2022.
//

import SwiftUI

struct ColorTextFieldView: View {
    
    @Binding var value: Double
    @Binding var text: String
    
    @State private var alertPresented: Bool = false
    
    var body: some View {
        TextField("", text: $text) { _ in
            withAnimation {
                checkInput()
            }
        }
        .frame(width: 50)
        .padding([.top, .leading, .bottom], 5.0)
        .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.gray))
        .keyboardType(.decimalPad)
        .onSubmit(of: .text, checkInput)
        .alert("Wrong value", isPresented: $alertPresented, actions: {})
    }
    
    func checkInput() {
        guard let value = Int(self.text), (0...255).contains(value) else {
            alertPresented = true
            text = String(lround(value))
            return
        }
        
        self.value = Double(value)
    }
}

struct ColorTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ColorTextFieldView(value: .constant(100), text: .constant("100"))
    }
}
