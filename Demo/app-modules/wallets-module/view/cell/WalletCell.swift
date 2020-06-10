//
//  WalletCell.swift
//  Demo
//
//  Created by Farhan Mirza on 07/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit
// Wallet Cell
class WalletCell : WalletBasicCell {
    var wallet : Wallet? {
        didSet {
            guard let wallet = wallet else {return}
            nameLabel.text = wallet.attributes.name
            symbolLabel.text = wallet.attributes.cryptocoin_symbol
            balanceLabel.text = wallet.precisedBalance()
            if wallet.attributes.is_default {isDefault()} else {notDefault()}
        }
    }
}
// Commodity Wallet Cell
class CommodityWalletCell : WalletBasicCell {
    var commodityWallet : CommodityWallet? {
        didSet {
            guard let commodityWallet = commodityWallet else {return}
            nameLabel.text = commodityWallet.attributes.name
            symbolLabel.text = commodityWallet.attributes.cryptocoin_symbol
            balanceLabel.text = commodityWallet.precisedBalance()
            if commodityWallet.attributes.is_default {isDefault()} else {notDefault()}
        }
    }
}
// Fiat Wallet Cell
class FiatWalletCell : WalletBasicCell {
    var fiatWallet : FiatWallet? {
        didSet {
            guard let fiatWallet = fiatWallet else {return}
            nameLabel.text = fiatWallet.attributes.name
            symbolLabel.text = fiatWallet.attributes.fiat_symbol
            balanceLabel.text = fiatWallet.precisedBalance()
            isFiat()
        }
    }
}

// Basic Wallet Cell
class WalletBasicCell : UITableViewCell {
    var container = UIComponents.shared.container(bgColor: AppTheme.bgColor, cornerRadius : 15)
    var nameLabel = UIComponents.shared.label(text: "", fontName: FontName.Bold, fontSize: 16, color: AppTheme.textColor)
    var symbolLabel = UIComponents.shared.label(text: "", fontName: FontName.Regular, fontSize: 14, color: AppTheme.textColor)
    var balanceLabel = UIComponents.shared.label(text: "",alignment: .right ,fontName: FontName.Bold, fontSize: 15, color: AppTheme.textColor)
    var defaultLabel = UIComponents.shared.label(text: "Default",alignment: .center,color: AppTheme.bgColor)
    var fiatLabel = UIComponents.shared.label(text: "Fiat Wallet",alignment: .center,color: AppTheme.bgColor)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // subviews layout..
    private func setupLayout() {
        selectionStyle = .none
        backgroundColor = .clear
        [fiatLabel,defaultLabel].forEach { label in
            label.isHidden = true
            label.layer.cornerRadius = 5
            label.clipsToBounds = true
        }
        defaultLabel.backgroundColor = AppTheme.secondaryColor
        fiatLabel.backgroundColor = AppTheme.primaryColor
        container.addShadow()
        container.addSubViews(views: nameLabel,symbolLabel,balanceLabel,defaultLabel,fiatLabel)
        addSubViews(views: container)
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            container.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
            container.topAnchor.constraint(equalTo: topAnchor,constant: 16),
            container.heightAnchor.constraint(equalToConstant: 90),
            container.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16),
            
            // name label
            nameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 30),
            nameLabel.topAnchor.constraint(equalTo: topAnchor,constant: 40),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -120),
            // symbol label
            symbolLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            symbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 4),
            symbolLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            // price label
            balanceLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            balanceLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -16),
            balanceLabel.widthAnchor.constraint(equalToConstant: 100),
            // default label
            defaultLabel.topAnchor.constraint(equalTo: container.topAnchor,constant: -12),
            defaultLabel.widthAnchor.constraint(equalToConstant: 60),
            defaultLabel.heightAnchor.constraint(equalToConstant: 24),
            defaultLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: -12),
            // fiat label
            fiatLabel.topAnchor.constraint(equalTo: container.topAnchor,constant: -12),
            fiatLabel.widthAnchor.constraint(equalToConstant: 80),
            fiatLabel.heightAnchor.constraint(equalToConstant: 24),
            fiatLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: -12),
            
        ])
    }
    
    func isDefault() {
        defaultLabel.isHidden = false
    }
    func notDefault() {
        defaultLabel.isHidden = true
    }
    func isFiat() {
        fiatLabel.isHidden = false
    }
}

