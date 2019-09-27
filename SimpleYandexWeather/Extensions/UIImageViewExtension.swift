//
//  UIImageViewExtension.swift
//  SimpleYandexWeather
//
//  Created by Никита on 27/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit
import SVGKit

extension UIImageView {
    
    func setImageFromUrl(urlString: String) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            do {
                let data = try Data(contentsOf: URL(string: urlString)!)
                let svgImage = SVGKImage(data: data)
                if let image = svgImage?.uiImage {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
}
