//
//  ObjectExtension.swift
//  SimpleYandexWeather
//
//  Created by Никита on 30/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import RealmSwift

extension Object {
    
    static func build<O: Object>(_ build: (O) -> Void) -> O {
        let object = O()
        build(object)
        return object
    }
    
}
