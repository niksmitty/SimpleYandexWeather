//
//  UITableViewExtension.swift
//  SimpleYandexWeather
//
//  Created by Никита on 01/10/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

extension UITableView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = .systemFont(ofSize: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
    }
    
    func restore() {
        self.backgroundView = nil
    }
    
}
