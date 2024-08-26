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
                Text("My Lists")
                ForEach(viewModel.myLists) { myList in
                    HStack {
                        Image(systemName: Constants.Icons.line3HorizontalCircleFill)
                            .font(.title)
                            .foregroundColor(myList.color)
                        Text(myList.name)
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
