//
//  CarsListCoordinator.swift
//  MVVM-C
//
//  Created by Macbook Pro on 25/01/2022.
//

import Foundation
import UIKit

class CarsListCoordinator: Coordinator {
    
    // MARK: - VARIABLES
    var rootViewController: UINavigationController!
    var dataStore: DataStoreProtocol
    var carDetailsCoordinator: CarDetailsCoordinator!
    // MARK: - INITIALIZER
    
    init(dataStore: DataStoreProtocol) {
        self.dataStore = dataStore
    }
    
    // IMPLEMENTATION
    
    func start() -> UIViewController {
        let listVC = CarsListCoordinator.instantiateViewController() as! CarsListViewController
        rootViewController = UINavigationController(rootViewController: listVC)
        let service = CarsListService(dataStore: self.dataStore)
        let viewModel = CarsListViewModel(service: service)
        viewModel.coordinatorDelegate = self
        listVC.viewModel = viewModel
        return rootViewController
    }
    
}


extension CarsListCoordinator: CarsListViewModelCoordinatorDelegate {
    func didTapOnRow(with data: CarModel) {
        carDetailsCoordinator = CarDetailsCoordinator(navigationController: self.rootViewController, data: data)
        let detailsVC = carDetailsCoordinator.start()
        self.rootViewController.pushViewController(detailsVC, animated: true)
    }
}

extension CarsListCoordinator: StoryboardInitializable {
    static var storyboardName: UIStoryboard.Storyboard {
        return .main
    }
}
