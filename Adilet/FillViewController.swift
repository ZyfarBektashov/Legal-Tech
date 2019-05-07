
//
//  FillViewController.swift
//  Adilet
//
//  Created by Shohkarim Mamadnazar on 5/7/19.
//  Copyright © 2019 Shohkarim Mamadnazar. All rights reserved.
//

import UIKit

class FillViewController: UIViewController {
    
    @IBOutlet weak var firstSide: UITextField!
    @IBOutlet weak var place: UITextField!
    @IBOutlet weak var secondSide: UITextField!
    @IBOutlet weak var secondSideName: UITextField!
    @IBOutlet weak var secondSideSurname: UITextField!
    @IBOutlet weak var day: UITextField!
    @IBOutlet weak var month: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var duration: UITextField!
    
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
    
    @IBAction func fill(_ sender: CustomButton) {
        let file = FillDoc(first_side: firstSide.text!,
                           place: place.text!,
                           first_name: "",
                           last_name: "",
                           second_side: secondSide.text!,
                           second_first_name: secondSideName.text!,
                           second_last_name: secondSideSurname.text!,
                           day: day.text!,
                           month: month.text!,
                           year: year.text!,
                           duration: duration.text!)
        showProgressHud()
        ServerManager.shared.downloadPDFFile()
//        ServerManager.shared.generatePDF(file: file, {
//            print("123")
//        }) { (error) in
//            self.showErrorAlert(message: error)
//            self.hideProgressHud()
//        }
    }
}
