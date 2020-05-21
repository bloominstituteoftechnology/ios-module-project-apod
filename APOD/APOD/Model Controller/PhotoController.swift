//
//  PhotoController.swift
//  APOD
//
//  Created by Wyatt Harrell on 5/21/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import Foundation

class PhotoController {
    // MARK: - Properties
    private let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    private let apiKey = "3MYY5NPWds1kZu7B3B7In88FKEHYXncJQkgBFNr6"
    private(set) var photos:[WHLPhoto] = []

    /// Date Formatter that will be used to both decode and encode Date objects. "yyy-MM-dd" -> "2020-05-21"
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()


    // MARK: - Methods

    /// Method creates a date object and calls fetchPhotoForDate()
    /// - Parameter completion: Only returns nil when successful, otherwise it will return error if there's a server error.
    /// - Returns: FatalError if programmer error
    func fetchToday(completion: @escaping (Error?)->()) {
        fetchPhotoForDate(date: Date()) { (error) in
            if let error = error {
                NSLog("Error error : \(error)")
                completion(error)
            }
            completion(nil)
        }
    }

    /// Method will take care of fetching data from the server, parsing it, and storing it into controller's photos array.
    /// - Parameters:
    ///   - date: Date object for date desired
    ///   - completion: Only returns nil when successful, otherwise it will return error if there's a server error.
    /// - Returns: FatalError if programmer error
    func fetchPhotoForDate(date: Date, completion: @escaping (Error?)->()) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!

        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "date", value: dateFormatter.string(from: date))
        ]

        let requestURL = urlComponents.url!

        URLSession.shared.dataTask(with: requestURL) { data, _, error in
            if let error = error {
                NSLog("Error receiving data for date(\(date)): \(error)")
                completion(error)
            }

            guard let data = data else { fatalError() }

            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String]
                guard let jsonDate = json!["date"],
                let explanation = json!["explanation"],
                let jsonURL = json!["hdurl"],
                let title = json!["title"] else { fatalError() }


                let url = URL(string: jsonURL)!
                let date = self.dateFormatter.date(from: jsonDate)!
                let newPhoto = WHLPhoto(title: title, explanation: explanation, date: date , hdurl: url)
                self.photos.append(newPhoto)
            } catch {
                NSLog("Failed to do something with json \(error)")
                completion(error)
            }
            completion(nil)

        }.resume()
    }
}
