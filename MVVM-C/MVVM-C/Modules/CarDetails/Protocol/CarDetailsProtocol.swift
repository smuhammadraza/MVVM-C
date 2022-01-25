//
//  CarDetailsProtocol.swift
//  MVVM-C
//
//  Created by Macbook Pro on 25/01/2022.
//

import Foundation

protocol CarDetailsViewModelProtocol {
    var data : CarModel{ get }
    var title : String{ get }

    var showData : ((CarModel)->())?{ get set }
    
    func viewDidLoad()
}
