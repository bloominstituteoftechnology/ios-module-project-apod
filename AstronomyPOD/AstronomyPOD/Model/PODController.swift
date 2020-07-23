//
//  PODController.swift
//  AstronomyPOD
//
//  Created by Nonye on 7/23/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import Foundation

enum ErrorType: Error {
    case noData, noResponse, error
}

class PODController  {
    
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    let apiKey = "MNbRoKx7rlAGjRfloAVlVZSCtAmAbv0ASOUP9vqr"
    let pod: [POD] = []
    
    let df: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()
    
    // Fetch photo
    func fetchPOD(date: Date, completion: @escaping (Error?)->()) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        
        urlComponents.queryItems = [
        URLQueryItem(name: "api_key", value: apiKey),
        URLQueryItem(name: "date", value: df.string(from: date))
        ]
        let requestURL = urlComponents.url!
        
        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            if let error = error {
                NSLog("Error grabbing data from date \(date)): \(error)")
                completion(error)
            }
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                NSLog("Server did not give back correct URL")
                completion(error)
                return
            }
            guard let data = data else {
                completion(error)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String]
                guard let jsonDate = json!["date"],
                    let explanation = json!["explanation"],
                let jsonURL = json!["url"],
                let copyright = json!["copyright"],
                    let title = json!["title"] else {
                        completion(error)
                        return
                }
                let url = URL(string: jsonURL)!
                
            }
        }
    }
    
    //
    
    
    
    
    
}
