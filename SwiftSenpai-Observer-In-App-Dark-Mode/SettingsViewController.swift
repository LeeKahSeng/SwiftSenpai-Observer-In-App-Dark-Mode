//
//  SettingsViewController.swift
//  SwiftSenpai-Observer-In-App-Dark-Mode
//
//  Created by Lee Kah Seng on 08/12/2019.
//  Copyright © 2019 Lee Kah Seng. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set switch status
        darkModeSwitch.isOn = UserInterfaceStyleManager.shared.currentStyle == .dark
        
        // Start observing style change
        startObserving(&UserInterfaceStyleManager.shared)
    }

    @IBAction func darkModeSwitchValueChanged(_ sender: UISwitch) {
        
        let darkModeOn = sender.isOn
        
        // Store in UserDefaults
        UserDefaults.standard.set(darkModeOn, forKey: UserInterfaceStyleManager.userInterfaceStyleDarkModeOn)
        
        // Update interface style
        UserInterfaceStyleManager.shared.updateUserInterfaceStyle(darkModeOn)
    }
    
}
