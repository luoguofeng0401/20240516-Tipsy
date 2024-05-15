//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Guo-Feng Luo on 2024/5/16.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var settingsLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    
    var result = "0.0"
    var tip = 10
    var split = 2
    override func viewDidLoad() {
        super.viewDidLoad()
    totalLabel.text = result
    settingsLabel.text = "Split between \(split) people, with \(tip)% tip."

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
