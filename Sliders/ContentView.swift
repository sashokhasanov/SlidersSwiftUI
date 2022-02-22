//
//  ContentView.swift
//  Sliders
//
//  Created by Сашок on 18.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue: Double = 125
    @State private var greenValue: Double = 125
    @State private var blueValue: Double = 125
    
    @FocusState private var focusedField: Bool
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 200)
                .padding()
                .foregroundColor(Color(red: redValue / 255,
                                       green: greenValue / 255,
                                       blue: blueValue / 255))
            
            VStack {
                ColorComponentView(value: $redValue, color: .red)
                ColorComponentView(value: $greenValue, color: .green)
                ColorComponentView(value: $blueValue, color: .blue)
            }
            .focused($focusedField)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        focusedField = false
                    }
                }
            }
            
            Spacer()
        }
    }
}

struct ColorComponentView: View {
    
    @Binding var value: Double
    @State var text: String = ""
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
        }
        .padding()
        .onAppear {
            text = String(lround(value))
        }
    }
}

struct ColorTextField: View {
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
