//
//  CarsListService.swift
//  MVVM-C
//
//  Created by Macbook Pro on 25/01/2022.
//

import Foundation

class CarsListService: CarsListServiceProtocol {
    
    var dataStore: DataStoreProtocol

    init(dataStore : DataStoreProtocol) {
        self.dataStore = dataStore
    }
    func getCarsList(response: @escaping ([CarModel]) -> ()) {
        let data = dataStore.getAllCars()
        response(data)
    }
    
    func getCar(by id: Int, response: @escaping (CarModel?) -> ()) {
        let data = dataStore.getCar(by: id)
        response(data)
    }
    
}
