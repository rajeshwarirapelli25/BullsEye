//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Anand  on 09/12/18.
//  Copyright © 2018 Anand . All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
}
