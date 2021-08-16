//
//  CatalogCell.swift
//  OnlineStore
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import UIKit

class CustomLowerCell: UICollectionViewCell {
    

    var data: CustomDataClothes? {
        didSet {
            guard let data = data else { return }
            bg.image = data.backgroundImage
            clothesLabel.text = data.title
            clothesPrice.text = String(data.price) + " Р"
        }
    }
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    fileprivate let clothesLabel = UILabel()
    fileprivate let clothesPrice = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        clothesLabel.frame = CGRect(x: 10, y: 240, width: 160, height: 30)
        clothesLabel.textColor = .white
        clothesLabel.font = .systemFont(ofSize: 12)
        clothesPrice.frame = CGRect(x: 10, y: 210, width: 160, height: 20)
        clothesPrice.textColor = .white
//
//        clothesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
//        clothesLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
//        clothesLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
//        clothesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        contentView.addSubview(bg)
        contentView.addSubview(clothesLabel)
        contentView.addSubview(clothesPrice)

        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -70).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
