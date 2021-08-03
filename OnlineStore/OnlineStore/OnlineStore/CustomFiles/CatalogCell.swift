//
//  CatalogCell.swift
//  OnlineStore
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import UIKit

class CatalogCell: UICollectionViewCell {
    var imagesPreView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.orange.cgColor
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()

    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imagesPreView.layer.masksToBounds = true
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        imagesPreView = UIImageView()
        addSubview(imagesPreView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
