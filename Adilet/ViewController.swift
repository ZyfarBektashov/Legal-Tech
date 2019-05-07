//
//  ViewController.swift
//  Adilet
//
//  Created by Shohkarim Mamadnazar on 5/6/19.
//  Copyright © 2019 Shohkarim Mamadnazar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    private var categories: [MainCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupProfileButton()
        
        ServerManager.shared.getCategories({ (allCategories) in
            self.categories = allCategories
            self.mainCollectionView.reloadData()
        }) { (error) in
            print(error)
        }
    }
    
    private func setupProfileButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Профиль", style: .plain, target: self, action: #selector(showProfile))
    }
    
    @objc private func showProfile() {
        let alert = UIAlertController(title: "", message: "Зарегистрируйтесь чтобы заполнить", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Зарегистрироваться", style: .default, handler: { (action) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController")
            let nvc = UINavigationController(rootViewController: vc!)
            self.present(nvc, animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        cell.category.text = categories[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        vc.id = categories[indexPath.row].id
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

