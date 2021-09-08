//
//  ThirdViewController.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 30.08.2021.
//

import UIKit

class ThirdViewController: UIViewController {

    private let emptyCart : UILabel = {
        let cl = UILabel()
        cl.textColor = .gray
        cl.text = "Добавьте в корзину товары из каталога"
        cl.textColor = .black
        cl.font = UIFont.systemFont(ofSize: 15)
        cl.textAlignment = .center
        return cl
    }()
    
    private var imageOfCart: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Корзина")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Корзина"
        navigationController?.navigationBar.barTintColor = UIColor(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        setupLayout() 
    }
    
    // создаем constraint и добавляем Subview
    private func setupLayout() {
        [imageOfCart,
         emptyCart].forEach {
            view.addSubview($0)
            $0.toAutoLayout()
        }
        NSLayoutConstraint.activate([
            imageOfCart.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            imageOfCart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageOfCart.heightAnchor.constraint(equalToConstant: 200),
            imageOfCart.widthAnchor.constraint(equalToConstant: 200),
            
            emptyCart.topAnchor.constraint(equalTo: imageOfCart.bottomAnchor , constant: 10),
            emptyCart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            emptyCart.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),

        ])
    }
}
