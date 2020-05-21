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
    private(set) var photos:[WHLPhoto] = []

    /// Date Formatter that will be used to both decode and encode Date objects. "yyy-MM-dd" -> "2020-05-21"
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()

    func fetchPhotoForDate(date: Date) {

    }
}
