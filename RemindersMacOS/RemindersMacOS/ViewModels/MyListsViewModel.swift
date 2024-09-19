//
//  MyListsViewModel.swift
//  RemindersMacOS
//
//  Created by MAC on 26.08.2024.
//

import Foundation
import SwiftUI
import CoreData

class MyListsViewModel: NSObject, ObservableObject {
    
    @Published var myLists = [MyListViewModel]()
    private let fetchedResultsController: NSFetchedResultsController<MyList>
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchedResultsController = NSFetchedResultsController(fetchRequest: MyList.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchedResultsController.delegate = self
        
        fetchAll()
        
        
    }
    
    private func fetchAll() {
        do {
           try fetchedResultsController.performFetch()
            guard let myLists = fetchedResultsController.fetchedObjects else {
                return
            }
            
            self.myLists = myLists.map(MyListViewModel.init)

        } catch {
            print(error)
        }
    }
    
    func saveTo(list: MyListViewModel, title: String, dueDate: Date?) {
        let myListItem = MyListItem(context: context)
        myListItem.title = title
        myListItem.dueDate = dueDate
        myListItem.myList = MyList.byId(id: list.id)
        do {
            try myListItem.save()
        } catch {
            print(error)
        }
    }
    
    func deleteItem(_ item: MyListItemViewModel) {
        
        let myListItem: MyListItem? = MyListItem.byId(id: item.listItemid)
        if let myListItem = myListItem {
            try? myListItem.delete()
        }
    }
    
    func delete(_ myList: MyListViewModel) {
        let myList: MyList? = MyList.byId(id: myList.id)
        if let myList = myList {
            try? myList.delete()
        }
    }
    
    func updateItem() {
        
    }
}

extension MyListsViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<any NSFetchRequestResult>) {
        guard let myLists = controller.fetchedObjects as? [MyList] else {
            return
        }
        
        self.myLists = myLists.map(MyListViewModel.init)
    }
}
    
