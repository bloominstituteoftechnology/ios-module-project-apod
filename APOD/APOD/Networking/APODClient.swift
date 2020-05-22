//
//  APODClient.swift
//  APOD
//
//  Created by Shawn Gee on 5/22/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

private let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
private let apiKey = "SvFYLcIx4kH490qEwhjsyxpSdPVqdfA1wwzXO8Kl"

typealias PhotoResultCompletion = ((Result<Photo, NetworkError>) -> Void)
typealias ImageResultCompletion = ((Result<UIImage, NetworkError>) -> Void)

struct APODClient {
    func fetchPhoto(from date: Date, completion: @escaping PhotoResultCompletion) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "date", value:  Photo.dateFormatter.string(from: date)),
        ]
        
        guard let url = urlComponents.url else {
            completion(.failure(.badURL))
            return
        }
        
        print(url)
        
        URLSession.shared.dataResultTask(with: URLRequest(url: url)) { (result) in
            completion(PhotoResultDecoder().decode(result))
        }.resume()
    }
    
    func fetchImage(url: URL, completion: @escaping ImageResultCompletion) {
        URLSession.shared.dataResultTask(with: URLRequest(url: url)) { (result) in
            completion(ImageResultDecoder().decode(result))
        }.resume()
    }
}
