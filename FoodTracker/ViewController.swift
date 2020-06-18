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
    @IBOutlet weak var photo: UIImageView!
    @IBAction func tapImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.delegate = self
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
        photo.image = img
        dismiss(animated: true, completion: nil)
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
