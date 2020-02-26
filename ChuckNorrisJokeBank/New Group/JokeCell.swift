//
//  JokeCell.swift
//  ChuckNorrisJokeBank
//
//  Created by Danny on 25/02/2020.
//  Copyright © 2020 Daniel Sutcliffe. All rights reserved.
//

import UIKit

class JokeCell: UITableViewCell {
    
    @IBOutlet weak var jokeLabel: UILabel!
    
    func configureJoke(randomJoke: String) {
//        print(randomJoke)
        jokeLabel.text = randomJoke
    }

}
