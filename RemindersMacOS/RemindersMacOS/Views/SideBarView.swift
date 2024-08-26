//
//  SideBarView.swift
//  RemindersMacOS
//
//  Created by MAC on 26.08.2024.
//

import SwiftUI

struct SideBarView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Items Count 10")
            
            List(1...5, id: \.self) { index in
                Text("List: \(index)")
            }
          
            Spacer()
            Button("Add List") {
                
            }
        }
    }
}

#Preview {
    SideBarView()
}
