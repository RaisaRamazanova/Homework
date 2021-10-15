//
//  DetailView.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 18.09.2021.
//

import UIKit

final class DetailView: UIView {

    // MARK: - Properties

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let scrollViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var imageOfClothes: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 400))
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()

    var buyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        button.setTitle("Добавить в корзину", for: .normal)
        button.tintColor = .black
        button.addShadow()
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(touchDownButton), for: .touchDown)
        button.addTarget(self, action: #selector(touchUpInsideButton), for: .touchUpInside)
        return button
    }()

    let titleOfClothes: UILabel = {
        let titleOfClothes = UILabel()
        titleOfClothes.textColor = .black
        titleOfClothes.font = UIFont.boldSystemFont(ofSize: 20)
        return titleOfClothes
    }()

    let descriptionOfClothes: UILabel = {
        let descriptionOfClothes = UILabel()
        descriptionOfClothes.textColor = .black
        descriptionOfClothes.font = UIFont.systemFont(ofSize: 14)
        return descriptionOfClothes
    }()

    let priceOfClothes: UILabel = {
        let priceOfClothes = UILabel()
        priceOfClothes.textColor = .black
        priceOfClothes.font = UIFont.boldSystemFont(ofSize: 20)
        return priceOfClothes
    }()

    let currencyOfClothes: UILabel = {
        let currencyOfClothes = UILabel()
        currencyOfClothes.text = " ₽"
        currencyOfClothes.textColor = .black
        currencyOfClothes.font = UIFont.boldSystemFont(ofSize: 20)
        return currencyOfClothes
    }()

    let aboutClothesLabel: UILabel = {
        let aboutClothesLabel = UILabel()
        aboutClothesLabel.text = "О товаре"
        aboutClothesLabel.textColor = .black
        aboutClothesLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return aboutClothesLabel
    }()

    let seasonOfClothesLabel: UILabel = {
        let seasonOfClothesLabel = UILabel()
        seasonOfClothesLabel.textColor = .black
        seasonOfClothesLabel.font = UIFont.systemFont(ofSize: 14)
        return seasonOfClothesLabel
    }()

    let genderOfClothesLabel: UILabel = {
        let genderOfClothesLabel = UILabel()
        genderOfClothesLabel.textColor = .black
        genderOfClothesLabel.font = UIFont.systemFont(ofSize: 14)
        return genderOfClothesLabel
    }()

    let forGenderOfClothesLabel: UILabel = {
        let genderOfClothesLabel = UILabel()
        genderOfClothesLabel.text = "Для: "
        genderOfClothesLabel.textColor = .black
        genderOfClothesLabel.font = UIFont.systemFont(ofSize: 14)
        return genderOfClothesLabel
    }()

    let forSeasonOfClothesLabel: UILabel = {
        let genderOfClothesLabel = UILabel()
        genderOfClothesLabel.text = "Сезон: "
        genderOfClothesLabel.textColor = .black
        genderOfClothesLabel.font = UIFont.systemFont(ofSize: 14)
        return genderOfClothesLabel
    }()

    var actionOnButtonTap1: (() -> Void)?
    var actionOnButtonTap2: (() -> Void)?

    @objc fileprivate func touchUpInsideButton() {
        actionOnButtonTap1?()
    }

    @objc fileprivate func touchDownButton() {
        actionOnButtonTap2?()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayoutScroll()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayoutScroll() {
        addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollViewContainer.heightAnchor.constraint(equalToConstant: 700).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }

    // создаем constraint и добавляем Subview
    private func setupLayout() {
        setupImageOfClothesLayout()
        setupMainInfoOfClothesLayout()
        [genderOfClothesLabel,
         seasonOfClothesLabel,
         aboutClothesLabel,
         buyButton,
         forGenderOfClothesLabel,
         forSeasonOfClothesLabel].forEach {
            scrollViewContainer.addSubview($0)
            $0.toAutoLayout()
        }
        NSLayoutConstraint.activate([
            buyButton.topAnchor.constraint(equalTo: priceOfClothes.bottomAnchor, constant: 30),
            buyButton.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
            buyButton.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 50),
            buyButton.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor, constant: -50),
            buyButton.heightAnchor.constraint(equalToConstant: 50),

            aboutClothesLabel.topAnchor.constraint(equalTo: buyButton.bottomAnchor, constant: 30),
            aboutClothesLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
            seasonOfClothesLabel.topAnchor.constraint(equalTo: aboutClothesLabel.bottomAnchor, constant: 10),
            seasonOfClothesLabel.leftAnchor.constraint(equalTo: forSeasonOfClothesLabel.rightAnchor, constant: 5),
            forSeasonOfClothesLabel.topAnchor.constraint(equalTo: aboutClothesLabel.bottomAnchor, constant: 10),
            forSeasonOfClothesLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
            genderOfClothesLabel.topAnchor.constraint(equalTo: seasonOfClothesLabel.bottomAnchor, constant: 10),
            genderOfClothesLabel.leftAnchor.constraint(equalTo: forGenderOfClothesLabel.rightAnchor, constant: 5),
            forGenderOfClothesLabel.topAnchor.constraint(equalTo: seasonOfClothesLabel.bottomAnchor, constant: 10),
            forGenderOfClothesLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10)
        ])
        super.updateConstraints()
    }
    
    private func setupMainInfoOfClothesLayout() {
        [titleOfClothes,
         descriptionOfClothes,
         priceOfClothes,
         currencyOfClothes].forEach {
            scrollViewContainer.addSubview($0)
            $0.toAutoLayout()
        }
        NSLayoutConstraint.activate([
            titleOfClothes.topAnchor.constraint(equalTo: imageOfClothes.bottomAnchor, constant: 10),
            titleOfClothes.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
            descriptionOfClothes.topAnchor.constraint(equalTo: titleOfClothes.bottomAnchor, constant: 10),
            descriptionOfClothes.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
            priceOfClothes.topAnchor.constraint(equalTo: descriptionOfClothes.bottomAnchor, constant: 10),
            priceOfClothes.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 10),
            currencyOfClothes.topAnchor.constraint(equalTo: descriptionOfClothes.bottomAnchor, constant: 10),
            currencyOfClothes.leftAnchor.constraint(equalTo: priceOfClothes.rightAnchor, constant: 5),
        ])
        super.updateConstraints()
    }
    
    private func setupImageOfClothesLayout() {
        [imageOfClothes].forEach {
            scrollViewContainer.addSubview($0)
            $0.toAutoLayout()
        }
        NSLayoutConstraint.activate([
            imageOfClothes.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor, constant: 0),
            imageOfClothes.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: 25),
            imageOfClothes.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor, constant: -25),
            imageOfClothes.heightAnchor.constraint(equalToConstant: 400)
        ])
        super.updateConstraints()
    }
}
