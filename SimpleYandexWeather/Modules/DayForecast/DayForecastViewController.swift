//
//  DayForecastViewController.swift
//  SimpleYandexWeather
//
//  Created by Никита on 28/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

class DayForecastViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: DayForecastPresenterProtocol!
    var configurator: DayForecastConfiguratorProtocol = DayForecastConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.configureView()
    }

}

// MARK: - UITableViewDataSource methods

extension DayForecastViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: presenter.reuseIdentifier, for: indexPath) as? HourForecastCell,
            let item = presenter.item(atIndex: indexPath) else { return UITableViewCell() }
        
        cell.configureCell(with: item)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate methods

extension DayForecastViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(presenter.sectionHeaderHeight)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return Const.emptyView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(presenter.sectionFooterHeight)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return Const.emptyView
    }
    
}

// MARK: - DayForecastViewProtocol methods

extension DayForecastViewController: DayForecastViewProtocol {
    
    func configureNavigationBar(_ title: String) {
        navigationItem.title = title
    }
   
    func registerCell(_ nibName: String, _ reuseIdentifier: String) {
        tableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func configureTableBackgroundView(_ itemsCount: Int, _ emptyMessage: String) {
        if itemsCount == 0 {
            tableView.setEmptyMessage(emptyMessage)
        } else {
            tableView.restore()
        }
    }
    
}

// MARK: - Constants

extension DayForecastViewController {
    private enum Const {
        static let emptyView = UIView(frame: .zero)
    }
}
