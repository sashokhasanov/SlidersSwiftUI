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
            ColorView(red: redValue, green: greenValue, blue: blueValue)
            
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
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
