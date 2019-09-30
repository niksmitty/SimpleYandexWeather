//
//  WeekForecastPresenter.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation

class WeekForecastPresenter {
    
    weak var view: WeekForecastViewProtocol!
    var interactor: WeekForecastInteractorProtocol!
    var router: WeekForecastRouterProtocol!
    
    var items = [DayForecastItem]() {
        didSet {
            items = DayForecastItem.transformDaysFormat(for: items)
        }
    }
    
    required init(view: WeekForecastViewProtocol) {
        self.view = view
    }
    
}

// MARK: - WeekForecastPresenterProtocol methods

extension WeekForecastPresenter: WeekForecastPresenterProtocol {
    
    var reuseIdentifier: String {
        return Const.dayForecastReuseIdentifier
    }
    
    var sectionHeaderHeight: Double {
        return Const.sectionHeaderHeight
    }
    
    var sectionFooterHeight: Double {
        return Const.sectionFooterHeight
    }
    
    func configureView() {
        view.configureNavigationBar(Const.navBarTitle)
        view.configureRefreshControl(Const.refreshControlTitle)
        view.configureTableView()
        view.registerCell(Const.dayForecastCellNibName, Const.dayForecastReuseIdentifier)
        view.showProgress()
        refreshForecast()
    }
    
    func refreshForecast() {
        guard let currentCoordinate = interactor.currentCoordinate else { return }
        interactor.getForecastInfo(with: currentCoordinate)
    }
    
    var itemsCount: Int {
        return items.count
    }
    
    func item(atIndex indexPath: IndexPath) -> DayForecastItem? {
        guard items.indices.contains(indexPath.row) else { return nil }
        return items[indexPath.row]
    }
    
    func cellSelected(at indexPath: IndexPath) {
        router.showDayForecast(with: items[indexPath.row])
    }
    
}

// MARK: - WeekForecastPresenterProtocol methods

extension WeekForecastPresenter: WeekForecastInteractorOutputProtocol {
    
    func locationDidUpdate(_ coordinate: Coordinate) {
        interactor.getForecastInfo(with: coordinate)
    }
    
    func hideIndicators() {
        view.hideProgress()
        view.hideRefreshControl()
    }
    
    func handleSuccess(with forecastItems: [DayForecastItem]) {
        self.items = forecastItems
        view.reloadData()
    }
    
    func handleError(_ errorString: String) {
        print("Error: \(errorString)")
    }
    
}

// MARK: - Constants

extension WeekForecastPresenter {
    private enum Const {
        static let dayForecastCellNibName = "DayForecastCell"
        static let dayForecastReuseIdentifier = "DayForecastCell"
        
        static let refreshControlTitle = NSLocalizedString("Week forecast refresh control title", comment: "")
        
        static let sectionHeaderHeight = 0.01
        static let sectionFooterHeight = 0.01
        
        static let navBarTitle = NSLocalizedString("Week forecast title", comment: "")
    }
}
