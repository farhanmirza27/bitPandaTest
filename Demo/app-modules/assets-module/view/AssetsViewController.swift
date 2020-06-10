//
//  AssetsViewController.swift
//  Demo
//  Created by Farhan Mirza on 05/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit
import Segmentio

// cell identifiers
fileprivate let reuseIdentifier = "CryptoCellId"
fileprivate let reuseIdentifierCommodity = "CommodityCellId"
fileprivate let reuseIdentifierFiat = "FiatCellId"

// enum for sections
private enum AssetsTableSection {
    case Cryptocoins
    case Commodities
    case Fiats
}

class AssetsViewController: UIViewController {
    private var sections : [AssetsTableSection]  = [.Cryptocoins,.Commodities,.Fiats]
    var presenter : ViewToPresenterAssetsProtocol?
    var assets = AssetsResponse(cryptocoins: [], commodities: [], fiats: [])
    var showFiltered = false
    var segmentView = Segmentio()
    var tableView = UIComponents.shared.tableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabsView()
        setupLayout()
        presenter?.getAssets()
    }
    
    // sub-views layout setup
    private func setupLayout() {
        navigationItem.title = "Assets"
        view.backgroundColor = .white
        // table view
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        tableView.register(CryptocoinCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.register(CommodityCell.self, forCellReuseIdentifier: reuseIdentifierCommodity)
        tableView.register(FiatCell.self, forCellReuseIdentifier: reuseIdentifierFiat)
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

extension AssetsViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .Cryptocoins:
            return assets.cryptocoins.count
        case .Commodities:
            return assets.commodities.count
        case .Fiats :
            return assets.fiats.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .Cryptocoins:
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CryptocoinCell
            cell.cryptocoin = assets.cryptocoins[indexPath.row]
            return cell
        case .Commodities:
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierCommodity, for: indexPath) as! CommodityCell
            cell.commodity = assets.commodities[indexPath.row]
            return cell
        case .Fiats:
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierFiat, for: indexPath) as! FiatCell
            cell.fiat = assets.fiats[indexPath.row]
            return cell
        }
    }
}

extension AssetsViewController : PresenterToViewAssetsProtocol {
    func showAssets(assets : AssetsResponse) {
        segmentView.isHidden = false
        self.assets = assets
        tableView.reloadData()
    }
    func error(errorMessage: String) {
        segmentView.isHidden = true
        self.alert(message: errorMessage)
    }
}

extension AssetsViewController {
    // top tabs configuration
    func configureTabsView() {
        // tabs
        let items = [SegmentioItem(title: "All",image: nil),SegmentioItem(title: "Cryptocoins",image: nil),SegmentioItem(title: "Commodities",image: nil),SegmentioItem(title: "Fiats",image: nil)]
        // configuration
        segmentView.configuration(items: items)
        // call back
        segmentView.valueDidChange = { segmentio, segmentIndex in
            switch segmentIndex {
            case 0:
                self.sections = [.Cryptocoins,.Commodities,.Fiats]
            case 1:
                self.sections = [.Cryptocoins]
            case 2:
                self.sections = [.Commodities]
            case 3:
                self.sections = [.Fiats]
            default:
                break
            }
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
    
    
}
