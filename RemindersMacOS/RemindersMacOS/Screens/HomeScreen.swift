//
//  HomeScreen.swift
//  RemindersMacOS
//
//  Created by MAC on 26.08.2024.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            SideBarView()
            Text("MyListViews")
        }
    }
}

#Preview {
    HomeScreen()
}
