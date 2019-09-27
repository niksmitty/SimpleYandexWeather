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
    
    var presenter: WeekForecastPresenterProtocol!
    var configurator: WeekForecastConfiguratorProtocol = WeekForecastConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        presenter.configureView()
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

// MARK: - WeekForecastViewProtocol methods

extension WeekForecastViewController: WeekForecastViewProtocol {
    
    func registerCell(_ nibName: String, _ reuseIdentifier: String) {
        tableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}
