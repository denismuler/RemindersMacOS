//
//  MyListViewModel.swift
//  RemindersMacOS
//
//  Created by MAC on 26.08.2024.
//

import Foundation
import CoreData
import SwiftUI

struct MyListViewModel: Identifiable {
    private let myList: MyList
    
    init(myList: MyList) {
        self.myList = myList
    }
    
    var id: NSManagedObjectID {
        myList.objectID
    }
    
    var name: String {
        myList.name ?? ""
    }
    
    var color: Color {
        Color(myList.color ?? .clear)
    }
    
}
