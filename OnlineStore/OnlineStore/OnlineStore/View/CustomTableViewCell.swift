//
//  CustomTableViewCell.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 11.09.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var cellViewModel: CellViewModel? {
        didSet {
            setupLayout()
            clothesLabelAndDescription.text = cellViewModel!.description + " " + cellViewModel!.title
            clothesCount.text = "Количество: " + String(cellViewModel?.count ?? 1) + " шт."
            clothesPrice.text = String( Int(cellViewModel!.price)! * cellViewModel!.count )  + " ₽"
            imageOfClothes.image = cellViewModel?.image?.image
        }
    }

    private let clothesLabelAndDescription : UILabel = {
        let cl = UILabel()
        cl.textColor = .black
        cl.font = UIFont.boldSystemFont(ofSize: 12)
        cl.textAlignment = .left
        return cl
    }()
    
    private let clothesPrice : UILabel = {
        let cl = UILabel()
        cl.textColor = .black
        cl.font = UIFont.boldSystemFont(ofSize: 12)
        cl.textAlignment = .left
        return cl
    }()
    
    private let clothesCount : UILabel = {
        let cl = UILabel()
        cl.textColor = .black
        cl.font = UIFont.boldSystemFont(ofSize: 12)
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
        clothesLabelAndDescription.text = nil
        clothesCount.text = nil
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
         clothesLabelAndDescription,
         clothesCount,
         clothesPrice].forEach {
            contentView.addSubview($0)
            $0.toAutoLayout()
        }
        NSLayoutConstraint.activate([
            imageOfClothes.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageOfClothes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageOfClothes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            imageOfClothes.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3 ),
            
            clothesPrice.topAnchor.constraint(equalTo: clothesCount.bottomAnchor, constant: 10),
            clothesPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            clothesPrice.leadingAnchor.constraint(equalTo: imageOfClothes.trailingAnchor, constant: 15),

            clothesLabelAndDescription.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 10),
            clothesLabelAndDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            clothesLabelAndDescription.leadingAnchor.constraint(equalTo: imageOfClothes.trailingAnchor, constant: 15),

            clothesCount.topAnchor.constraint(equalTo: clothesLabelAndDescription.bottomAnchor , constant: 10),
            clothesCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            clothesCount.leadingAnchor.constraint(equalTo: imageOfClothes.trailingAnchor, constant: 15),
        ])
    }
}
