//
//  WeekForecastViewController.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

class WeekForecastViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activity: UIActivityIndicatorView!
    
    private let refreshControl = UIRefreshControl()
    
    var presenter: WeekForecastPresenterProtocol!
    var configurator: WeekForecastConfiguratorProtocol = WeekForecastConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        presenter.configureView()
    }
    
    @objc private func refresh(_ sender: Any) {
        presenter.refreshForecast()
    }
    
    // MARK: - Navigation methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}

// MARK: - UITableViewDataSource methods

extension WeekForecastViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: presenter.reuseIdentifier, for: indexPath) as? DayForecastCell,
            let item = presenter.item(atIndex: indexPath) else { return UITableViewCell() }
        
        cell.configureCell(with: item)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate methods

extension WeekForecastViewController: UITableViewDelegate {
    
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

// MARK: - WeekForecastViewProtocol methods

extension WeekForecastViewController: WeekForecastViewProtocol {
    
    func configureNavigationBar(_ title: String) {
        navigationItem.title = title
    }
    
    func configureRefreshControl(_ title: String) {
        refreshControl.tintColor = Const.refreshControlColor
        refreshControl.attributedTitle = NSAttributedString(string: title,
                                                            attributes: [NSAttributedString.Key.foregroundColor: Const.refreshControlColor])
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
    }
    
    func configureTableView() {
        tableView.refreshControl = refreshControl
    }
    
    func registerCell(_ nibName: String, _ reuseIdentifier: String) {
        tableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showProgress() {
        DispatchQueue.main.async {
            self.activity.startAnimating()
        }
    }
    
    func hideProgress() {
        DispatchQueue.main.async {
            self.activity.stopAnimating()
        }
    }
    
    func hideRefreshControl() {
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
        }
    }
    
}

// MARK: - Constants

extension WeekForecastViewController {
    private enum Const {
        static let refreshControlColor: UIColor = .black
        static let emptyView = UIView(frame: .zero)
    }
}
