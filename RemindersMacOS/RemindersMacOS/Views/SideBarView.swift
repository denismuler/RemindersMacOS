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
            Text("All Items Count 10")
            
            List(1...5, id: \.self) { index in
                Text("List: \(index)")
            }
            
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
