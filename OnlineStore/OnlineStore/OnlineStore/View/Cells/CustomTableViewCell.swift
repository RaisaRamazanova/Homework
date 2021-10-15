//
//  CustomTableViewCell.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 11.09.2021.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    // MARK: - Properties

    private let clothesLabelAndDescription: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()

    private let clothesPrice: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()

    private let clothesCount: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()

    private var imageOfClothes: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()

    // MARK: - Life Cycle

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
    
    func transferCellData(_ cellViewModel: CellViewModel) {
        setupLayout()
        clothesLabelAndDescription.text = cellViewModel.description + " " + cellViewModel.title
        clothesCount.text = "Количество: " + String(cellViewModel.count) + " шт."
        clothesPrice.text = String( Int(cellViewModel.price)! * cellViewModel.count )  + " ₽"
        imageOfClothes.image = cellViewModel.image
    }

    private func initView() {
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

            clothesLabelAndDescription.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            clothesLabelAndDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            clothesLabelAndDescription.leadingAnchor.constraint(equalTo: imageOfClothes.trailingAnchor, constant: 15),

            clothesCount.topAnchor.constraint(equalTo: clothesLabelAndDescription.bottomAnchor, constant: 10),
            clothesCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            clothesCount.leadingAnchor.constraint(equalTo: imageOfClothes.trailingAnchor, constant: 15)
        ])
    }
}
