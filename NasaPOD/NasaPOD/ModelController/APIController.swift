//
//  APIController.swift
//  NasaPOD
//
//  Created by Cora Jacobson on 12/11/20.
//

import UIKit

enum APIError: String, Error {
    case DataNilError
    case JSONDecodeError
    case JSONMissingResults
}

class APIController: NSObject {
    
    private let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    private let apiKey = "qzGsj0zsKk6CA9JZP1UjAbpQHabBfaPg2M5dGMB7"
    
    @objc(sharedController)
    static let shared = APIController()
    
    @objc(getPhotoForDayWithDateString:completionHandler:)
    func getPhotoForDay(with date: Date, completion: @escaping (_ photo: PhotoOfTheDay?, _ error: Error?) -> Void) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: date)
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        let queryDate = URLQueryItem(name: "date", value: dateString)
        let key = URLQueryItem(name: "api_key", value: apiKey)
        components.queryItems = [queryDate, key]
        let url = components.url!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, APIError.DataNilError)
                }
                return
            }
            
            do {
                guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {
                    throw APIError.JSONDecodeError
                }
                
                let photo = PhotoOfTheDay(dictionary: dictionary)
                
                DispatchQueue.main.async {
                    completion(photo, nil)
                }
                
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
            
        }.resume()
    }
    
    func fetchImage(url: URL, completion: @escaping (_ image: UIImage?, _ error: Error?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, APIError.DataNilError)
                }
                return
            }
            
            if let image = UIImage(data: data) {
                completion(image, nil)
            } else if let alternateImage = UIImage(named: "planet") {
                completion(alternateImage, nil)
            }
        }
        task.resume()
    }
    
}
