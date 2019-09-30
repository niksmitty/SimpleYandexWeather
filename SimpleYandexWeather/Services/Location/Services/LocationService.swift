//
//  LocationService.swift
//  SimpleYandexWeather
//
//  Created by Никита on 30/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import CoreLocation

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

protocol LocationUpdateProtocol: class {
    func locationDidUpdate(to coordinate: Coordinate)
}

class LocationService: NSObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    
    weak var delegate: LocationUpdateProtocol?
    
    override init() {
        super.init()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = manager.location?.coordinate else { return }
        self.delegate?.locationDidUpdate(to: Coordinate(latitude: coordinate.latitude, longitude: coordinate.longitude))
    }
    
}
