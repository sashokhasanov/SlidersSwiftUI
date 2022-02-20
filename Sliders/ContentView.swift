//
//  ContentView.swift
//  Sliders
//
//  Created by Сашок on 18.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue: Double = 125
    @State private var redText: String = "125"
    
    @State private var greenValue: Double = 125
    @State private var greenText: String = "125"
    
    @State private var blueValue: Double = 125
    @State private var blueText: String = "125"
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 200)
                .padding()
                .foregroundColor(Color(red: redValue / 255,
                                       green: greenValue / 255,
                                       blue: blueValue / 255))
            
            ColorComponentView(value: $redValue, text: $redText, color: .red)
            ColorComponentView(value: $greenValue, text: $greenText, color: .green)
            ColorComponentView(value: $blueValue, text: $blueText, color: .blue)
            
            Spacer()
        }
    }
}

struct ColorComponentView: View {
    
    @Binding var value: Double
    @Binding var text: String
    var color: Color
    
    var body: some View {
        HStack {
            Text(String(lround(value))).frame(width: 50, alignment: .leading)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
                .onChange(of: self.value) { newValue in
                    text = String(lround(newValue))
                }
            ColorTextField(value: $value, text: $text)
        }.padding()
    }
}

struct ColorTextField: View {
    
    @Binding var value: Double
    @Binding var text: String
    
    @State private var alertPresented: Bool = false
    
    var body: some View {
        TextField("", text: $text)
            .frame(width: 50)
            .padding([.top, .leading, .bottom], 5.0)
            .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 3)
                        .foregroundColor(.gray))
            .keyboardType(.numbersAndPunctuation)
            .onSubmit(of: .text, checkInput)
            .alert("Wrong value", isPresented: $alertPresented, actions: {})
    }
    
    func checkInput() {
        guard let value = Double(self.text) else {
            alertPresented = true
            text = String(lround(value))
            return
        }
        
        guard value >= 0 else {
            alertPresented = true
            self.value = 0
            return
        }
        
        guard value <= 255 else {
            alertPresented = true
            self.value = 255
            return
        }
        
        self.value = value
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
