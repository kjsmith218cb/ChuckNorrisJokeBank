//
//  RandomJokeManagerDelegate.swift
//  ChuckNorrisJokeBank
//
//  Created by Danny on 24/02/2020.
//  Copyright © 2020 Daniel Sutcliffe. All rights reserved.
//

import Foundation

protocol RandomJokeManagerDelegate {
    func didUpdateRandomJoke(_ randomJokeManager: RandomJokeManager, randomJoke: String)
    func didFailWithError(error: Error)
}

struct RandomJokeManager {
    
    var delegate: RandomJokeManagerDelegate?
    
    func fetchRandomJoke() {
        let urlString = "https://api.icndb.com/jokes/random?exclude=[explicit]"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            // 2. Create a URL Session
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    // Check I am getting the correct JSON
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString!)
                    
                    // Inside closure requires self. when calling from current class
                    if let randomJoke = self.parseJSON(jokeData: safeData) {
                        self.delegate?.didUpdateRandomJoke(self, randomJoke: randomJoke)
                    }
                }
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    
    // Decode JSON Data
    func parseJSON(jokeData: Data) -> String? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(RandomJokeData.self, from: jokeData)
            return decodedData.value.joke
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
}
