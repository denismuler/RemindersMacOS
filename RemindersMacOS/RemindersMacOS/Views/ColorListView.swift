//
//  ColorListView.swift
//  RemindersMacOS
//
//  Created by MAC on 26.08.2024.
//

import SwiftUI

struct ColorListView: View {
    
    let colors = [Color.red, Color.orange, Color.green, Color.blue, Color.purple]
    @Binding var selectedColor: Color
    
    var body: some View {
        ForEach(colors, id: \.self) { color in
            
            Image(systemName: selectedColor == color ? Constants.Icons.recordCircleFill : Constants.Icons.circleFill)
                .foregroundColor(color)
                .font(.system(size: 16))
                .clipShape(Circle())
                .onTapGesture {
                    selectedColor = color
                }
        }
    }
}

#Preview {
    ColorListView(selectedColor: .constant(.blue))
}
