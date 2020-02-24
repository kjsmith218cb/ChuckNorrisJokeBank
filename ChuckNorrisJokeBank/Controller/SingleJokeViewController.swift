//
//  SingleJokeViewController.swift
//  ChuckNorrisJokeBank
//
//  Created by Danny on 24/02/2020.
//  Copyright © 2020 Daniel Sutcliffe. All rights reserved.
//

import UIKit

class SingleJokeViewController: UIViewController, RandomJokeManagerDelegate {

    @IBOutlet weak var randomJokeLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    var randomJokeManager = RandomJokeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                              
        randomJokeManager.delegate = self
                              
        // Style buttons
        okButton.layer.cornerRadius = 20
                              
        // Fetch random joke
        randomJokeManager.fetchRandomJoke()
    }
                          
    func didUpdateRandomJoke(_ randomJokeManager: RandomJokeManager, randomJoke: String) {
        
        print(randomJoke)
        // Replace Occurences of bad punctuation
        let replaceQuot = randomJoke.replacingOccurrences(of: "&quot;", with: "\"")
        // Found a joke stating he?s, but appears to be an error in the API as ' appears in other jokes and ? used correctly...
//        let replaceQues = replaceQuot.replacingOccurrences(of: "?", with: "\'")
                              
        DispatchQueue.main.async {
//            self.jokeLabel.text = randomJoke
            self.randomJokeLabel.text = replaceQuot
        }
                              
    }
                          
    func didFailWithError(error: Error) {
        print(error)
    }

    @IBAction func okButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
