//
//  CarDetailsViewModel.swift
//  MVVM-C
//
//  Created by Macbook Pro on 25/01/2022.
//

import Foundation

class CarDetailsViewModel: CarDetailsViewModelProtocol {
    
    var data: CarModel
    var title: String { return data.name }
    var showData: ((CarModel) -> ())?
    
    
    init(data: CarModel) {
        self.data = data
    }
    
    
    func viewDidLoad() {
        self.showData?(self.data)
    }
    
    
}
