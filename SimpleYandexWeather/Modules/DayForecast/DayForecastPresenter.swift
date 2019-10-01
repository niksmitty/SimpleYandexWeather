//
//  DayForecastPresenter.swift
//  SimpleYandexWeather
//
//  Created by Никита on 28/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation

class DayForecastPresenter {
    
    weak var view: DayForecastViewProtocol!
    var interactor: DayForecastInteractorProtocol!
    var router: DayForecastRouterProtocol!
    
    var items = [HourForecastItem]()
    
    private let dayForecastItem: DayForecastItem
    
    required init(view: DayForecastViewProtocol, dayForecastItem: DayForecastItem) {
        self.view = view
        self.dayForecastItem = dayForecastItem
    }
    
}

// MARK: - DayForecastPresenterProtocol methods

extension DayForecastPresenter: DayForecastPresenterProtocol {
    
    var reuseIdentifier: String {
        return Const.hourForecastReuseIdentifier
    }
    
    var sectionHeaderHeight: Double {
        return Const.sectionHeaderHeight
    }
    
    var sectionFooterHeight: Double {
        return Const.sectionFooterHeight
    }
    
    func configureView() {
        view.configureNavigationBar(dayForecastItem.day)
        view.registerCell(Const.hourForecastCellNibName, Const.hourForecastReuseIdentifier)
        items = dayForecastItem.hours
    }
    
    var itemsCount: Int {
        let itemsCount = items.count
        view.configureTableBackgroundView(itemsCount, Const.emptyMessageString)
        return itemsCount
    }
    
    func item(atIndex indexPath: IndexPath) -> HourForecastItem? {
        guard items.indices.contains(indexPath.row) else { return nil }
        return items[indexPath.row]
    }
    
}

// MARK: - DayForecastInteractorOutputProtocol methods

extension DayForecastPresenter: DayForecastInteractorOutputProtocol {
    
}

// MARK: - Constants

extension DayForecastPresenter {
    private enum Const {
        static let hourForecastCellNibName = "HourForecastCell"
        static let hourForecastReuseIdentifier = "HourForecastCell"
        
        static let sectionHeaderHeight = 0.01
        static let sectionFooterHeight = 0.01
        
        static let emptyMessageString = NSLocalizedString("Empty message title", comment: "")
    }
}
