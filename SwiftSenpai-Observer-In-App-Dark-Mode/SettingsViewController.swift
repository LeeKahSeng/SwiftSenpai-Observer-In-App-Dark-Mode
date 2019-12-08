//
//  SettingsViewController.swift
//  SwiftSenpai-Observer-In-App-Dark-Mode
//
//  Created by Lee Kah Seng on 08/12/2019.
//  Copyright © 2019 Lee Kah Seng. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        startObserving(&UserInterfaceStyleManager.shared)
    }

    @IBAction func darkModeSwitchValueChanged(_ sender: UISwitch) {
        UserInterfaceStyleManager.shared.updateUserInterfaceStyle(sender.isOn)
    }
    
}
