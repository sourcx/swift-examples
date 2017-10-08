//
//  PreferencesViewController.swift
//  hoots-timer
//
//  Created by frank on 08/10/2017.
//  Copyright © 2017 gloryhammer. All rights reserved.
//

import Cocoa

class PreferencesViewController: NSViewController {

    @IBOutlet weak var presetsPopup: NSPopUpButton!
    @IBOutlet weak var customSlider: NSSlider!
    @IBOutlet weak var customTextField: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }

    @IBAction func popupValueChanged(_ sender: NSPopUpButton) {
    }

    @IBAction func sliderValueChanged(_ sender: NSSlider) {
    }

    @IBAction func cancelButtonClicked(_ sender: Any) {
    }

    @IBAction func okButtonClicked(_ sender: Any) {
    }
}
