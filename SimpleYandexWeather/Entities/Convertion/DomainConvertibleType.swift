//
//  DomainConvertibleType.swift
//  SimpleYandexWeather
//
//  Created by Никита on 30/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

protocol DomainConvertibleType {
    associatedtype DomainType
    
    func asDomain() -> DomainType
}
