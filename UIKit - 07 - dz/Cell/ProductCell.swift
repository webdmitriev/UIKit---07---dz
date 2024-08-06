//
//  ProductCell.swift
//  UIKit - 07 - dz
//
//  Created by Олег Дмитриев on 06.08.2024.
//

import UIKit

class ProductCell: UITableViewCell {
    
    static let reuseId = "ProductCell"
    
    private let appUIBuilders = UIBuilders()
    
    private lazy var containerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .appGray
        $0.layer.cornerRadius = 30
        //$0.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return $0
    }(UIView())
    
    private lazy var productImage: UIImageView = appUIBuilders.addImage(image: "product-image-01",
                                                                       offsetH: 240,
                                                                       brs: 30)
    
    private lazy var productUserAvatar: UIImageView = appUIBuilders.addImage(image: "user-avatar-01",
                                                                            offsetH: 63,
                                                                            brs: 33)
    
    private lazy var productUserName: UILabel = appUIBuilders.addLabel(text: "",
                                                                      offsetH: 24,
                                                                      fontS: 20,
                                                                      fontW: .black,
                                                                      color: .appWhite)
    
    private lazy var productTitle: UILabel = appUIBuilders.addLabel(text: "",
                                                                   offsetH: 24,
                                                                   fontS: 20,
                                                                   fontW: .black,
                                                                   color: .appBlack)
    
    private lazy var productDescr: UILabel = appUIBuilders.addLabel(text: "",
                                                                   offsetH: 0,
                                                                   fontS: 16,
                                                                   fontW: .regular,
                                                                   color: .appBlack)
    
    private lazy var productBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Show more", for: .normal)
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        $0.setTitleColor(.appWhite, for: .normal)
        $0.backgroundColor = .appGreen
        $0.layer.cornerRadius = 25
        return $0
    }(UIButton())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(item: ProductData) {
        productImage.image = UIImage(named: item.productImage)
        productUserAvatar.image = UIImage(named: item.productUserAvatar)
        productUserName.text = item.productUserName
        productTitle.text = item.productTitle
        productDescr.text = item.productDescr
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        addSubview(containerView)
        containerView.addSubviews(productImage, productUserAvatar, productUserName, productTitle, productDescr, productBtn)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            productImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            productImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            productImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            productUserAvatar.topAnchor.constraint(equalTo: productImage.topAnchor, constant: 20),
            productUserAvatar.leadingAnchor.constraint(equalTo: productImage.leadingAnchor, constant: 20),
            productUserAvatar.widthAnchor.constraint(equalToConstant: 63),
            
            productUserName.leadingAnchor.constraint(equalTo: productImage.leadingAnchor, constant: 20),
            productUserName.trailingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: -20),
            productUserName.bottomAnchor.constraint(equalTo: productImage.bottomAnchor, constant: -30),
            
            productTitle.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20),
            productTitle.leadingAnchor.constraint(equalTo: productImage.leadingAnchor, constant: 16),
            productTitle.trailingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: -16),            
            productDescr.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 12),
            productDescr.leadingAnchor.constraint(equalTo: productImage.leadingAnchor, constant: 0),
            productDescr.trailingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 0),
            
            productBtn.topAnchor.constraint(equalTo: productDescr.bottomAnchor, constant: 25),
            productBtn.leadingAnchor.constraint(equalTo: productImage.leadingAnchor, constant: 0),
            productBtn.trailingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 0),
            
            containerView.bottomAnchor.constraint(equalTo: productBtn.bottomAnchor, constant: 20),
        ])
    }
    
}
