//
//  DayForecastCell.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

class DayForecastCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dayTemperatureTitleLabel: UILabel!
    @IBOutlet weak var dayIconImageView: UIImageView!
    @IBOutlet weak var dayTemperatureValueLabel: UILabel!
    @IBOutlet weak var nightTemperatureTitleLabel: UILabel!
    @IBOutlet weak var nightIconImageView: UIImageView!
    @IBOutlet weak var nightTemperatureValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dayTemperatureTitleLabel.text = Const.dayTemperatureTitle
        nightTemperatureTitleLabel.text = Const.nightTemperatureTitle
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with dayForecastItem: DayForecastItem) {
        dayLabel.text = dayForecastItem.day
        dayTemperatureValueLabel.text = "\(dayForecastItem.dayTemperature)ºC"
        nightTemperatureValueLabel.text = "\(dayForecastItem.nightTemperature)ºC"
        dayIconImageView.setImageFromUrl(urlString: dayForecastItem.dayIconUrl)
        nightIconImageView.setImageFromUrl(urlString: dayForecastItem.nightIconUrl)
    }
    
}

// MARK: - Constants

extension DayForecastCell {
    private enum Const {
        static let dayTemperatureTitle = NSLocalizedString("Day temperature title", comment: "")
        static let nightTemperatureTitle = NSLocalizedString("Night temperature title", comment: "")
    }
}
