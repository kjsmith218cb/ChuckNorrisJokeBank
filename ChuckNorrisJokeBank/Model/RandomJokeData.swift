//
//  RandomJokeData.swift
//  ChuckNorrisJokeBank
//
//  Created by Danny on 24/02/2020.
//  Copyright © 2020 Daniel Sutcliffe. All rights reserved.
//

import Foundation

struct RandomJokeData: Codable {
    let type: String
    let value: Value
}

struct Value: Codable {
    let joke: String
}
