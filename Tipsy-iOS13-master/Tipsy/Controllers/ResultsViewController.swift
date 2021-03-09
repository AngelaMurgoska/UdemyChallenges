//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Angela Murgoska on 2/23/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var toPayByPerson = "0.0"
    var numberOfPerople = 2
    var tip = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = toPayByPerson
        settingsLabel.text = "Split between \(numberOfPerople) people, with \(tip)% tip."
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
