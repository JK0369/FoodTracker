//
//  ViewController.swift
//  FoodTracker
//
//  Created by A10152 on 2020/06/18.
//  Copyright © 2020 A10152. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    @IBAction func setText(_ sender: Any) {
        nameLbl.text = "default text"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.delegate = self
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTF.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameLbl.text = nameTF.text
    }
}
