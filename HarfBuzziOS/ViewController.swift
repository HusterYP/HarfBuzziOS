//
//  ViewController.swift
//  HarfBuzziOS
//
//  Created by 袁平 on 10/28/25.
//

import UIKit
import HarfBuzz

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let hbVer = String(cString: hb_version_string())
        print("HarfBuzz version: \(hbVer)")
    }
}
