//
//  NetworkError.swift
//  APOD
//
//  Created by Chris Dobek on 6/18/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badResponse, badData, errorDecoding
}
