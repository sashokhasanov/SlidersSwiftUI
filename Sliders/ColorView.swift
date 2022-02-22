//
//  ColorView.swift
//  Sliders
//
//  Created by Сашок on 22.02.2022.
//

import SwiftUI

struct ColorView: View {
    
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(height: 200)
            .padding()
            .foregroundColor(Color(red: red / 255,
                                   green: green / 255,
                                   blue: blue / 255))
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 125, green: 125, blue: 125)
    }
}
