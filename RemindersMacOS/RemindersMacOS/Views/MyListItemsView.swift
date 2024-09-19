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
    typealias ItemDeleted = ((MyListItemViewModel) -> Void)?
    
    var onItemAdded: ItemAdded
    var onItemDeleted: ItemDeleted
    
    init(items: [MyListItemViewModel], onItemAdded: ItemAdded = nil,
         onItemDeleted: ItemDeleted = nil
    ) {
        self.onItemAdded = onItemAdded
        self.items = items
        self.onItemDeleted = onItemDeleted
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {

            List {
                
                ForEach(items, id: \.listItemid) { item in
                    ListItemCell(item: item, onListItemDeleted: { item in
                        onItemDeleted?(item)
                        
                    })
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
