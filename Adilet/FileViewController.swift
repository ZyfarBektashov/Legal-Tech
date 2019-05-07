//
//  FileViewController.swift
//  Adilet
//
//  Created by Shohkarim Mamadnazar on 5/7/19.
//  Copyright © 2019 Shohkarim Mamadnazar. All rights reserved.
//

import UIKit

class FileViewController: UIViewController {

    @IBOutlet weak var docWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupFillButton()
        
        if let pdfURL = Bundle.main.url(forResource: "типовой договор оказания услуг", withExtension: "pdf") {
            if let data = NSData(contentsOf: pdfURL) {
                docWebView.load(data as Data, mimeType: "application/pdf", textEncodingName: "", baseURL: pdfURL.deletingLastPathComponent())
            }
        }
    }
    
    private func setupFillButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Заполнить", style: .plain, target: self, action: #selector(fill))
    }
    
    @objc private func fill() {
        let alert = UIAlertController(title: "", message: "Заполните дополнительные поля", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Заполнить", style: .default, handler: { (action) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FillViewController")
            let nvc = UINavigationController(rootViewController: vc!)
            self.present(nvc, animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func share(_ sender: UIButton) {
        let myPDF = NSData(contentsOf: Bundle.main.url(forResource: "типовой договор оказания услуг", withExtension: "pdf")!)
        let activityVC = UIActivityViewController(activityItems: [myPDF], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
}
