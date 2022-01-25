//
//  CarsListViewModel.swift
//  MVVM-C
//
//  Created by Macbook Pro on 25/01/2022.
//

import Foundation

class CarsListViewModel: CarsListViewModelProtocol {
    
    // MARK: - VARIABLES
    var data: [CarModel]?
    var service: CarsListServiceProtocol
    var coordinatorDelegate: CarsListViewModelCoordinatorDelegate?
    var title: String { return "Top Electric Cars" }
    var showData: (() -> ())?
    var showLoader: (() -> ())?
    var hideLoader: (() -> ())?
    
    
    private var shouldShowLoader = false{
        didSet{
            (self.shouldShowLoader) ? self.showLoader?() : self.hideLoader?()
        }
    }
    
    // MARK: - INITIALIZER
    
    init(service: CarsListServiceProtocol) {
        self.service = service
        shouldShowLoader = true
        self.getData()
    }
    
    func didTapOnCar(of index: Int) {
        self.coordinatorDelegate?.didTapOnRow(with: self.data![index])
    }
    
    func heightForRow(at index: Int, of section: Int) -> Int {
        return 70
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        guard let data = data else { return 0 }
        return data.count
    }
    
    func viewDidLoad() {
        (shouldShowLoader) ? self.showLoader?() : self.hideLoader?()
    }
    
    func getCarName(at index: Int) -> String {
        guard let data = data else { return "" }
        return data[index].name
    }
    
    
    // MARK: - HELPER METHODS
    
    private func getData(){
        self.service.getCarsList { [weak self](data) in
            guard let `self` = self else { return }
            self.data = data
            self.shouldShowLoader = false
            self.showData?()
        }
    }
    
}
