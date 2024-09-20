//
//  SideBarView.swift
//  RemindersMacOS
//
//  Created by MAC on 26.08.2024.
//

import SwiftUI

struct SideBarView: View {
    
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {

            MyListsView(viewModel: MyListsViewModel(context: context))
            
            Spacer()
            Button {
                // action
                isPresented = true

            } label: {
                HStack {
                    Image(systemName: Constants.Icons.plusCircle)
                    Text("Add List")
                }
            }.buttonStyle(.plain)
                .padding()
        }.sheet(isPresented: $isPresented) {
            //dismiss
        } content: {
            AddNewListView(viewModel: AddNewListViewModel(context: context))
        }
    }
}

#Preview {
    SideBarView()
}
