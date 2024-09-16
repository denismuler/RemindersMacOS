//
//  MyListItemsView.swift
//  RemindersMacOS
//
//  Created by MAC on 09.09.2024.
//

import SwiftUI

struct MyListItemsView: View {
    
    typealias ItemAdded = ((String, Date?) -> Void)?
    
    var onItemAdded: ItemAdded
    
    init(onItemAdded: ItemAdded = nil) {
        self.onItemAdded = onItemAdded
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            List(1...10, id: \.self) { index in
                Text("Item \(index)")
            }
            
            AddNewListItemView { title, dueDate in
                onItemAdded?(title, dueDate)
            }
        }
    }
}

#Preview {
    MyListItemsView()
}
