//
//  DataStoreManager.swift
//  EasyTravel
//
//  Created by Сергей Бабич on 11.07.2022.
//

import Foundation

class DataStoreManager {
    
    func prepareForWork() {
        if let data = UserDefaults.standard.object(forKey: "activeTrips") as? Data { activeTrips = try! PropertyListDecoder().decode(Array<TripInfo>.self, from: data)
        }
    }
    
    func saveTrip(_ trip: TripInfo) {
        activeTrips.append(trip)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(activeTrips), forKey: "activeTrips")
    }
}
