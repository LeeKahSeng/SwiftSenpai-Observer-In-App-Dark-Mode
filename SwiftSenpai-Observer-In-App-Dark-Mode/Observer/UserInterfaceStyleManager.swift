//
//  UserInterfaceStyleManager.swift
//  SwiftSenpai-Observer-In-App-Dark-Mode
//
//  Created by Lee Kah Seng on 30/11/2019.
//  Copyright © 2019 Lee Kah Seng. All rights reserved.
//

import Foundation
import UIKit

struct UserInterfaceStyleManager {
    
    static let userInterfaceStyleDarkModeOn = "userInterfaceStyleDarkModeOn";
    
    static var shared = UserInterfaceStyleManager()
    private var observers = [ObjectIdentifier : WeakStyleObserver]()
    
    private init() { }
    
    private(set) var currentStyle: UIUserInterfaceStyle = UserDefaults.standard.bool(forKey: UserInterfaceStyleManager.userInterfaceStyleDarkModeOn) ? .dark : .light {
        // Property observer to trigger every time value is set to currentStyle
        didSet {
            if currentStyle != oldValue {
                // Trigger notification when currentStyle value changed
                styleDidChanged()
            }
        }
    }
}

// MARK:- Public functions
extension UserInterfaceStyleManager {
    
    mutating func addObserver(_ observer: UserInterfaceStyleObserver) {
        let id = ObjectIdentifier(observer)
        // Create a weak reference observer and add to dictionary
        observers[id] = WeakStyleObserver(observer: observer)
    }
    
    mutating func removeObserver(_ observer: UserInterfaceStyleObserver) {
        let id = ObjectIdentifier(observer)
        observers.removeValue(forKey: id)
    }
    
    mutating func updateUserInterfaceStyle(_ isDarkMode: Bool) {
        currentStyle = isDarkMode ? .dark : .light
    }
}

// MARK:- Private functions
private extension UserInterfaceStyleManager {
    mutating func styleDidChanged() {
        for (id, weakObserver) in observers {
            // Clean up observer that no longer in memory
            guard let observer = weakObserver.observer else {
                observers.removeValue(forKey: id)
                continue
            }
            
            // Notify observer by triggering userInterfaceStyleManager(_:didChangeStyle:)
            observer.userInterfaceStyleManager(self, didChangeStyle: currentStyle)
        }
    }
}
