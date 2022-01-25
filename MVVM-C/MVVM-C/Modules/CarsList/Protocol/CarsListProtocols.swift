//
//  CarsListProtocols.swift
//  MVVM-C
//
//  Created by Macbook Pro on 25/01/2022.
//

import Foundation

protocol CarsListServiceProtocol {
    var dataStore : DataStoreProtocol { get }
   
    func getCarsList(response : @escaping([CarModel])->())
    func getCar(by id : Int, response : @escaping(CarModel?)->())
}

protocol CarsListViewModelCoordinatorDelegate: AnyObject {
    func didTapOnRow(with data : CarModel)
}

protocol CarsListViewModelProtocol: AnyObject {
    
    var data : [CarModel]?{ get }
    var service : CarsListServiceProtocol { get }
    var coordinatorDelegate : CarsListViewModelCoordinatorDelegate? {get set}
    var title : String{ get }
    
    var showData : (()->())?{ get set}
    var showLoader : (()->())?{get set}
    var hideLoader : (()->())?{get set}
    
    func didTapOnCar(of index : Int)
    func heightForRow(at index : Int, of section : Int)->Int
    func numberOfRowsInSection(section : Int)->Int
    func viewDidLoad()
    func getCarName(at index : Int)->String
}
