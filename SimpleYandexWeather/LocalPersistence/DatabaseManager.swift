//
//  DatabaseManager.swift
//  SimpleYandexWeather
//
//  Created by Никита on 29/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import RealmSwift

// MARK: - RealmDatabaseAccessible

protocol RealmDatabaseAccessible {
    var realm: Realm { get }
    
    // Thread safe realm instance
    func safeRealm() -> Realm
}

extension RealmDatabaseAccessible {
    
    func safeRealm() -> Realm {
        let configuration = realm.configuration
        return try! Realm(configuration: configuration)
    }
    
}

// MARK: - DatabaseManagerProtocol

protocol DatabaseManagerProtocol {
    var databaseContextNotification: (() -> Void)? { get set }
    
    func save<T: Object>(object: T, update: Realm.UpdatePolicy) throws
    func save<T: Object>(objects: [T], update: Realm.UpdatePolicy) throws
    
    func delete<T: Object>(object: T) throws
    func delete<T: Object>(objects: [T]) throws
    func deleteAll<T: Object>(_ model: T.Type) throws
    
    func fetch<T: Object>(_ model: T.Type, predicate: NSPredicate?) -> [T]
    
    func clearAllData()
}

extension DatabaseManagerProtocol {
    
    func save<T: Object>(object: T, update: Realm.UpdatePolicy = .all) throws {
        return try save(object: object, update: update)
    }
    
    func save<T: Object>(objects: [T], update: Realm.UpdatePolicy = .all) throws {
        return try save(objects: objects, update: update)
    }
    
    func fetch<T: Object>(_ model: T.Type, predicate: NSPredicate? = nil) -> [T] {
        return fetch(model, predicate: predicate)
    }
    
}

class DatabaseManager: RealmDatabaseAccessible {
    
    lazy var realm: Realm = {
        let realm = try! Realm(configuration: Realm.Configuration.defaultConfiguration)
        notificationToken = realm.observe({ [weak self] notification, realm in
            self?.contextNotification?()
        })
        return realm
    }()
    
    private var notificationToken: NotificationToken?
    
    var contextNotification: (() -> Void)?
    
    deinit {
        notificationToken?.invalidate()
    }
    
}

// MARK: - DatabaseManagerProtocol methods

extension DatabaseManager: DatabaseManagerProtocol {
    
    var databaseContextNotification: (() -> Void)? {
        get {
            return self.contextNotification
        }
        set {
            self.contextNotification = newValue
        }
    }
    
    func save<T: Object>(object: T, update: Realm.UpdatePolicy = .all) throws {
        let realm = self.safeRealm()
        realm.beginWrite()
        realm.add(object, update: update)
        return try realm.commitWrite()
    }
    
    func save<T: Object>(objects: [T], update: Realm.UpdatePolicy = .all) throws {
        let realm = self.safeRealm()
        realm.beginWrite()
        realm.add(objects, update: update)
        return try realm.commitWrite()
    }
    
    func delete<T: Object>(object: T) throws {
        let realm = self.safeRealm()
        realm.beginWrite()
        realm.delete(object)
        return try realm.commitWrite()
    }
    
    func delete<T: Object>(objects: [T]) throws {
        let realm = self.safeRealm()
        realm.beginWrite()
        realm.delete(objects)
        return try realm.commitWrite()
    }
    
    func deleteAll<T: Object>(_ model: T.Type) throws {
        let realm = self.safeRealm()
        let objects = realm.objects(model)
        realm.beginWrite()
        objects.forEach { realm.delete($0) }
        return try realm.commitWrite()
    }
    
    func fetch<T: Object>(_ model: T.Type, predicate: NSPredicate? = nil) -> [T] {
        let realm = self.safeRealm()
        var objects = realm.objects(model)
        
        if let predicate = predicate {
            objects = objects.filter(predicate)
        }
        
        return objects.compactMap { $0 }
    }
    
    func clearAllData() {
        do {
            let realm = self.safeRealm()
            try realm.write {
                realm.deleteAll()
            }
        } catch {}
    }
    
}
