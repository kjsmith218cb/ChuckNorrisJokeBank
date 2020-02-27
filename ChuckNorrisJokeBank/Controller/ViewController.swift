//
//  ViewController.swift
//  ChuckNorrisJokeBank
//
//  Created by Danny on 24/02/2020.
//  Copyright © 2020 Daniel Sutcliffe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeImage: UIImageView!
    @IBOutlet weak var randomJokeButton: UIButton!
    @IBOutlet weak var jokeListButton: UIButton!
    @IBOutlet weak var unknownButton: UIButton!
    
    var buttonCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
                // Make welcome picture display as a circle
                welcomeImage.layer.cornerRadius = welcomeImage.frame.width/2
                welcomeImage.clipsToBounds = true
                
                // Add a shadow to welcome picture
                welcomeImage.layer.shadowColor = UIColor.black.cgColor
                welcomeImage.layer.shadowOpacity = 1
                welcomeImage.layer.shadowOffset = .zero
                welcomeImage.layer.shadowRadius = 10
                welcomeImage.layer.shadowPath = UIBezierPath(rect: welcomeImage.bounds).cgPath
                welcomeImage.layer.shouldRasterize = true
                
                // Style buttons
                randomJokeButton.layer.cornerRadius = 20
                jokeListButton.layer.cornerRadius = 20
                unknownButton.layer.cornerRadius = 20
                unknownButton.layer.borderWidth = 2
                unknownButton.layer.borderColor = UIColor(red: 5/255, green: 46/255, blue: 104/255, alpha: 1.0).cgColor

    }

    @IBAction func randomJokeButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToSingle", sender: self)
    }
    
    @IBAction func jokeListButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToList", sender: self)
    }
    
    func buttonCountFunction() {
        buttonCount += 1
        print(buttonCount)
        if (buttonCount == 5) {
            print("PROOF: Persistance Pays Off - GIVE THIS MAN THE JOB!!!")
        }
        
    }
    
    @IBAction func unknownButtonPressed(_ sender: UIButton) {
        buttonCountFunction()
    }
    
}

