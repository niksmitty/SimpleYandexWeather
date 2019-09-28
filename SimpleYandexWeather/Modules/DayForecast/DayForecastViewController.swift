//
//  DayForecastViewController.swift
//  SimpleYandexWeather
//
//  Created by Никита on 28/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

class DayForecastViewController: UIViewController {

    var presenter: DayForecastPresenterProtocol!
    var configurator: DayForecastConfiguratorProtocol = DayForecastConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.configureView()
    }

}

// MARK: - DayForecastViewProtocol methods

extension DayForecastViewController: DayForecastViewProtocol {
    
    func configureNavigationBar(_ title: String) {
        navigationItem.title = title
    }
    
}
