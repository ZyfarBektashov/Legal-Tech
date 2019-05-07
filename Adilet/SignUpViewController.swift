//
//  SignUpViewController.swift
//  Adilet
//
//  Created by Shohkarim Mamadnazar on 5/7/19.
//  Copyright © 2019 Shohkarim Mamadnazar. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var middleName: UITextField!
    @IBOutlet weak var birthday: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var passportNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDismissButton()
        
    }
    
    private func setupDismissButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(dismissView))
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUp(_ sender: CustomButton) {
        let user = User(first_name: name.text!,
                        last_name: surname.text!,
                        date_of_birth: birthday.text!,
                        gender: gender.text!,
                        email: email.text!,
                        passport_no: passportNumber.text!,
                        password: password.text!)
        showProgressHud()
        ServerManager.shared.signUp(user: user, {
            print(123)
        }) { (error) in
            self.showErrorAlert(message: error)
            self.hideProgressHud()
        }
    }
}
