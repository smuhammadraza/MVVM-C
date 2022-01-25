//
//  DataStoreProtocol.swift
//  MVVM-C
//
//  Created by Macbook Pro on 25/01/2022.
//

import Foundation

protocol DataStoreProtocol {
    func getAllCars()->[CarModel]
    func getCar(by id : Int)->CarModel?
}
