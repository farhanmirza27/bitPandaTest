//
//  WalletsViewController.swift
//  Demo
//
//  Created by Farhan Mirza on 06/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit
import Segmentio

fileprivate let reuseIdentierWallet = "WalletCellId"
fileprivate let reuseIdentierCommodityWallet = "CommidtyWalletCellId"
fileprivate let reuseIdentierFiatWallet = "FiatWalletCellId"

private enum WalletSection {
    case Wallet
    case CommodityWallet
    case FiatWallet
}

class WalletsViewController : UIViewController {
    private var sections : [WalletSection] = [.FiatWallet]
    var presenter : ViewToPresenterWalletsProtocol?
    var tableView = UIComponents.shared.tableView()
    var segmentView = Segmentio()
    var walletsResponse = WalletsResponse(wallets: [], commodityWallets: [], fiatWallets: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabsView()
        setupLayout()
        presenter?.getWallets()
    }
    // sub-views
    private func setupLayout() {
        navigationItem.title = "Wallets"
        view.backgroundColor = AppTheme.bgColor
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = AppTheme.bgColor
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        tableView.register(WalletCell.self, forCellReuseIdentifier: reuseIdentierWallet)
        tableView.register(CommodityWalletCell.self, forCellReuseIdentifier: reuseIdentierCommodityWallet)
        tableView.register(FiatWalletCell.self, forCellReuseIdentifier: reuseIdentierFiatWallet)
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubViews(views: segmentView,tableView)
        NSLayoutConstraint.activate([
            segmentView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            segmentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            segmentView.heightAnchor.constraint(equalToConstant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: segmentView.bottomAnchor,constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension WalletsViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .Wallet:
            return  walletsResponse.wallets.count
        case .CommodityWallet:
            return  walletsResponse.commodityWallets.count
        case .FiatWallet:
            return  walletsResponse.fiatWallets.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .Wallet:
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentierWallet, for: indexPath) as! WalletCell
            cell.wallet = walletsResponse.wallets[indexPath.row]
            return cell
        case .CommodityWallet:
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentierCommodityWallet, for: indexPath) as! CommodityWalletCell
            cell.commodityWallet = walletsResponse.commodityWallets[indexPath.row]
            return cell
        case .FiatWallet:
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentierFiatWallet, for: indexPath) as! FiatWalletCell
            cell.fiatWallet = walletsResponse.fiatWallets[indexPath.row]
            return cell
        }
    }
}

extension WalletsViewController : PresenterToViewWalletsProtocol {
    func sucess(wallets: WalletsResponse) {
        self.segmentView.isHidden = false
        self.walletsResponse = wallets
        tableView.reloadData()
    }
    
    func fail(errorMessage: String) {
        self.segmentView.isHidden = true
        self.alert(message: errorMessage)
    }
}


extension WalletsViewController {
    // top tabs config..
    func configureTabsView() {
        let items = [SegmentioItem(title: "Fiat Wallets",image: nil),SegmentioItem(title: "Wallets",image: nil),SegmentioItem(title: "Commodity Wallets",image: nil)]
        segmentView.configuration(items: items)
        segmentView.valueDidChange = { segmentio, segmentIndex in
            switch segmentIndex {
            case 0:
                self.sections = [.FiatWallet]
            case 1:
                self.sections = [.Wallet]
            case 2:
                self.sections = [.CommodityWallet]
            default:
                break
            }
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
        
    }
    
}
