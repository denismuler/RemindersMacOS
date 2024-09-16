//
//  MyListItemsView.swift
//  RemindersMacOS
//
//  Created by MAC on 09.09.2024.
//

import SwiftUI

struct MyListItemsView: View {
    
    var items: [MyListItemViewModel]
    typealias ItemAdded = ((String, Date?) -> Void)?
    
    var onItemAdded: ItemAdded
    
    init(items: [MyListItemViewModel], onItemAdded: ItemAdded = nil) {
        self.onItemAdded = onItemAdded
        self.items = items
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {

            List {
                
                ForEach(items, id: \.listItemid) { item in
                    Text(item.title)
                }
                
                AddNewListItemView { title, dueDate in
                    onItemAdded?(title, dueDate)
                }
            }
        }
    }
}

#Preview {
    MyListItemsView(items: [])
}
