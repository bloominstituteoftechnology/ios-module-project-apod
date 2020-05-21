//
//  PhotoController.swift
//  APOD
//
//  Created by Wyatt Harrell on 5/21/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import Foundation

class PhotoController {
    private let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    private let apiKey = "3MYY5NPWds1kZu7B3B7In88FKEHYXncJQkgBFNr6"
    private(set) var photos:[WHLPhoto] = []
    private let decoder: JSONDecoder = JSONDecoder()

    /// Date Formatter that will be used to both decode and encode Date objects. "yyy-MM-dd" -> "2020-05-21"
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()

    func fetchPhotoForDate(date: Date) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!

        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "date", value: dateFormatter.string(from: date))
        ]

        let requestURL = urlComponents.url!

        URLSession.shared.dataTask(with: requestURL) { data, _, error in
            if let error = error {
                NSLog("Error receiving data for date(\(date)): \(error)")
            }

            guard let data = data else { fatalError() }

            do {
                var container = decoder.decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>)
            } catch {
                NSLog(<#string#>)
            }

        }.resume()
    }
}
