//
//  CryptocoinCell.swift
//  Demo
//
//  Created by Farhan Mirza on 06/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

// Cryptocoin Cell
class CryptocoinCell : AssetCell {
    var cryptocoin : Cryptocoin? {
        didSet {
            guard let cryptocoin = cryptocoin else { return }
            nameLabel.text = cryptocoin.attributes.name
            symbolLabel.text = cryptocoin.attributes.symbol
            priceLabel.text = cryptocoin.precisedPrice()
            icon.loadImageWithURL(url: cryptocoin.attributes.logo)
        }
    }
}

// Commodity Cell
class CommodityCell : AssetCell {
    var commodity : Commodity? {
        didSet {
            guard let commodity = commodity else { return }
            nameLabel.text = commodity.attributes.name
            symbolLabel.text = commodity.attributes.symbol
            priceLabel.text = commodity.precisedPrice()
            icon.loadImageWithURL(url: commodity.attributes.logo)
        }
    }
}

// Fiat Cell
class FiatCell : AssetCell {
    var fiat : Fiat? {
        didSet {
            guard let fiat = fiat else { return }
            nameLabel.text = fiat.attributes.name
            symbolLabel.text = fiat.attributes.symbol
            icon.loadImageWithURL(url: fiat.attributes.logo)
        }
    }
}

// Basic Asset Cell
class AssetCell : UITableViewCell {
    var container = UIComponents.shared.container(bgColor: AppTheme.bgColor, cornerRadius : 15)
    var icon = UIComponents.shared.ImageView(imageName: "", contentMode: .scaleAspectFill, cornerRadius: 30)
    var nameLabel = UIComponents.shared.label(text: "", fontName: FontName.Bold, fontSize: 16, color: AppTheme.textColor)
    var symbolLabel = UIComponents.shared.label(text: "", fontName: FontName.Regular, fontSize: 14, color: AppTheme.textColor)
    var priceLabel = UIComponents.shared.label(text: "",alignment: .right ,fontName: FontName.Bold, fontSize: 16, color: AppTheme.textColor)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        selectionStyle = .none
        backgroundColor = .clear
        container.addShadow()
        container.addSubViews(views: icon,nameLabel,symbolLabel,priceLabel)
        addSubViews(views: container)
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            container.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
            container.topAnchor.constraint(equalTo: topAnchor,constant: 16),
            container.heightAnchor.constraint(equalToConstant: 90),
            container.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16),
            // icon
            icon.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: -16),
            icon.heightAnchor.constraint(equalToConstant: 60),
            icon.widthAnchor.constraint(equalToConstant: 60),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            // name label
            nameLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor,constant: 20),
            nameLabel.topAnchor.constraint(equalTo: topAnchor,constant: 35),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -90),
            // symbol label
            symbolLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            symbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 4),
            symbolLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            // price label
            priceLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -16),
            priceLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
