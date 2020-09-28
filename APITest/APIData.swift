//
//  APIData.swift
//  APITest
//
//  Created by Sukidhar Darisi on 28/9/20.
//

import Foundation

struct APIData : Codable {
    let msg : [DataModel]
}

struct DataModel : Codable {
    let id : String
    let mp4Video : String
}
