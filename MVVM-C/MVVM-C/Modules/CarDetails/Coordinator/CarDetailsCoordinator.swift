//
//  CarDetailsCoordinator.swift
//  MVVM-C
//
//  Created by Macbook Pro on 25/01/2022.
//

import UIKit

class CarDetailsCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let data: CarModel
    
    init(navigationController: UINavigationController, data: CarModel) {
        self.navigationController = navigationController
        self.data = data
    }
    
    
    func start() -> UIViewController {
        let vc = CarDetailsCoordinator.instantiateViewController() as! CarDetailsViewController
        let viewModel = CarDetailsViewModel(data: self.data)
        vc.viewModel = viewModel
        return vc
    }
    
    
}

extension CarDetailsCoordinator: StoryboardInitializable {
    static var storyboardName: UIStoryboard.Storyboard {
        return .main
    }
}
