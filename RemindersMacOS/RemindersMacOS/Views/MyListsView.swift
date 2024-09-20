//
//  MyListsView.swift
//  RemindersMacOS
//
//  Created by MAC on 26.08.2024.
//

import SwiftUI

struct MyListsView: View {
    
    @StateObject var viewModel: MyListsViewModel
    
    init(viewModel: MyListsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            List {
                AllCountView(count: viewModel.allListItemsCount)
                
                Text("My Lists")
                ForEach(viewModel.myLists) { myList in
                    
                    
                    NavigationLink {
                        MyListItemsHeaderView(name: myList.name, count: myList.itemsCount, color: myList.color)
                        
                        MyListItemsView(items: myList.items, onItemAdded: { title, dueDate in
                            viewModel.saveTo(list: myList, title: title, dueDate: dueDate)
                        }, onItemDeleted: viewModel.deleteItem, onItemCompleted: viewModel.markAsCompleted)
                    } label: {
                        HStack {
                            Image(systemName: Constants.Icons.line3HorizontalCircleFill)
                                .font(.title)
                                .foregroundColor(myList.color)
                            Text(myList.name)
                            Spacer()
                            Text("\(myList.itemsCount)")
                        }.contextMenu {
                            Button {
                                viewModel.delete(myList)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct MyListsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        MyListsView(viewModel: MyListsViewModel(context: context))
    }
}
