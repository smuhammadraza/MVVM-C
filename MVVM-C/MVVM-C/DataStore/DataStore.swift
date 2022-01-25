//
//  DataStore.swift
//  MVVM-C
//
//  Created by Macbook Pro on 25/01/2022.
//

import Foundation

final class DataStore : DataStoreProtocol {
    
    private let data = [
        CarModel(name : "Hyundai Ioniq 5", image : "Hyundai_Ioniq", description : "The Ioniq 5 has its sights firmly set on premium rivals such as the Audi Q4 e-tron, Volkswagen ID.4 and Tesla Model Y. Make no mistake, the Ioniq 5 is impressive across the board, showcasing next-gen electric car tech along with capable performance and charging ability normally reserved for high-end models like the Porsche Taycan and Audi e-tron GT."),
        CarModel(name : "Skoda Enyaq", image : "Skoda_Enyaq", description : "The Enyaq is an all-electric family car that is typically Skoda: that is to say it's practical, well-equipped, comfortable and decent to drive. With top-spec models able to cover over 300 miles from a full charge, it soothes any range anxiety and just gets on with being an excellent family car - that just happens to run on battery power."),
        CarModel(name : "Tesla Model 3", image : "tesla", description : "The Model 3 was the electric car many had been waiting for. It’s a compact executive saloon rivalling the likes of the Mercedes C-Class and BMW 3 Series – a market with broad mainstream appeal – and it’s also one of the most convincing electric cars that money can buy."),
        CarModel(name : "Audi e-tron GT", image : "Audi_e-tron", description : "The Audi e-tron GT combines dramatic styling with premium levels of comfort and plenty of power to match. Ride quality is excellent, and if you decide to crank things up you'll notice the precise steering and superb grip help to make the e-tron GT a rewarding drive.")
                    ]
    
    func getAllCars() -> [CarModel] {
        return data
    }
    
    func getCar(by id: Int) -> CarModel? {
        return (id <= (data.count - 1) && id >= 0 ) ? data[id] : nil
    }
    
    
}
