//
//  AppCoordinator.swift
//  MVVM-C
//
//  Created by Macbook Pro on 25/01/2022.
//

import Foundation
import UIKit

final class AppCoordinator : Coordinator{
    
    private var window : UIWindow?
    
   lazy var dataStore : DataStoreProtocol = {
        return DataStore()
    }()
    
    init(window : UIWindow) {
        self.window = window
    }
    var listCoordinator : CarsListCoordinator!

    @discardableResult
    func start()->UIViewController{
        listCoordinator = CarsListCoordinator(dataStore: dataStore)
        let mainVC = listCoordinator.start()
        self.window?.rootViewController = mainVC
        self.window?.makeKeyAndVisible()
        return mainVC
    }
}
