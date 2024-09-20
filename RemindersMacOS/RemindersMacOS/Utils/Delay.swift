//
//  Delay.swift
//  RemindersMacOS
//
//  Created by MAC on 20.09.2024.
//

import Foundation

class Delay {
    
    private var seconds: Double
    
    init(seconds: Double = 2) {
        self.seconds = seconds
    }
    
    var workItem: DispatchWorkItem?
    
    func performWork(_ work: @escaping () -> Void) {
        workItem = DispatchWorkItem(block: {
            work()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: workItem!)
    }
    
    func cancel() {
        workItem?.cancel()
    }
    
    
}
