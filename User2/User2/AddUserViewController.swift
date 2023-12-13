//  AddUserViewController.swift
//  Created on 2023/12/13

import UIKit

protocol AddUserDelegate: AnyObject {
    func didAddUser(name: String, phoneNumber: String)
}

class AddUserViewController: UIViewController {
    
    weak var delegate: AddUserDelegate?
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var phoneNumberTF: UITextField!
    
    @IBAction func addClick(_ sender: Any) {
        delegate?.didAddUser(name: self.nameTF.text ?? "", phoneNumber: self.phoneNumberTF.text ?? "")
        navigationController?.popViewController(animated: true)
    }
    
}
