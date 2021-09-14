//
//  CatalogCell.swift
//  OnlineStore
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    var cellViewModel: JsonCellViewModel? {
        didSet {
            setupLayout()
            clothesLabel.text = cellViewModel?.title
            clothesDescription.text = cellViewModel?.description
            clothesPrice.text = cellViewModel!.price + " ₽"
            imageOfClothes.image = cellViewModel?.image?.image
        }
    }

    private let clothesLabel : UILabel = {
        let cl = UILabel()
        cl.textColor = .gray
        cl.font = UIFont.boldSystemFont(ofSize: 15)
        cl.textAlignment = .left
        return cl
    }()
    
    private let clothesDescription : UILabel = {
        let cl = UILabel()
        cl.textColor = .gray
        cl.font = UIFont.boldSystemFont(ofSize: 10)
        cl.textAlignment = .left
        return cl
    }()
    
    private let clothesPrice : UILabel = {
        let cl = UILabel()
        cl.textColor = .black
        cl.font = UIFont.boldSystemFont(ofSize: 20)
        cl.textAlignment = .left
        return cl
    }()
    
    private var imageOfClothes: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()

    // MARK: - override function
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clothesLabel.text = nil
        clothesDescription.text = nil
        clothesPrice.text = nil
    }

    // MARK: - function
    
    func initView() {
        backgroundColor = .clear
        preservesSuperviewLayoutMargins = false
        layoutMargins = UIEdgeInsets.zero
    }
    
    // MARK: - function
    
    // создаем constraint и добавляем Subview
    private func setupLayout() {
        [imageOfClothes,
         clothesLabel,
         clothesDescription,
         clothesPrice].forEach {
            contentView.addSubview($0)
            $0.toAutoLayout()
        }
        NSLayoutConstraint.activate([
            imageOfClothes.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageOfClothes.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageOfClothes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageOfClothes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -70),
            
            clothesPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -35),
            clothesPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            clothesPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),

            clothesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -20),
            clothesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            clothesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),

            clothesDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -5),
            clothesDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            clothesDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
        ])
    }
}
