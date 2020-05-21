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
    private var photos:[WHLPhoto] = []
    var sortedPhotos:[WHLPhoto] {
        return photos.sorted(by: { $0.date < $1.date })
    }

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

    ///  Method will send a get request to API with passed in URL
    /// - Parameters:
    ///   - url: WHLPhoto.hdurl is all that needs to be passed in
    ///   - completion: Will return Data if successful, and Error if error communicating with server.
    /// - Returns: Nil. Completion handler returns Data, so must Initialize a UIImage in completion handler.
    func fetchPhotoData(url: URL, completion: @escaping (Data?, Error?)->()) {
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching single photo(URL: \(url)) : \(error)")
            }

            guard let data = data else { fatalError() }

            completion(data, nil)
        }.resume()

    }

    /// Takes care of creating all Date objects to be used for a given month in any given year
    /// - Parameters:
    ///   - month: Month to be fetched
    ///   - year: Year to be fetched
    /// - Returns: an array of Date objects that can be used for fetching photos from Nasa API or for formatting the CollectionView
    func getDays(for month: Int, in year: Int) -> [Date] {
        let dateComponents = DateComponents(year: year, month: month)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        let days = (range.lowerBound ..< range.upperBound).compactMap { calendar.date(byAdding: .day, value: $0, to: date) }
        return days
    }
}
