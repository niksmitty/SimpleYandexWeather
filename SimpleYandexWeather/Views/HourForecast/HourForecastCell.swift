//
//  HourForecastCell.swift
//  SimpleYandexWeather
//
//  Created by Никита on 30/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

class HourForecastCell: UITableViewCell {

    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var temperatureValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with hourForecastItem: HourForecastItem) {
        hourLabel.text = hourForecastItem.hour
        temperatureValueLabel.text = "\(hourForecastItem.temperature)ºC"
        iconImageView.setImageFromUrl(urlString: hourForecastItem.iconUrl)
    }
    
}
