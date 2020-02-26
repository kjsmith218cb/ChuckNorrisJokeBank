//
//  JokeListViewController.swift
//  ChuckNorrisJokeBank
//
//  Created by Danny on 24/02/2020.
//  Copyright © 2020 Daniel Sutcliffe. All rights reserved.
//

import UIKit

class JokeListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RandomJokeManagerDelegate {
    
    var randomJokeManager = RandomJokeManager()
    var refreshControl: UIRefreshControl!
    
    var fetchingMore = false
//    var randomJokeArray = ["Joke 1", "Joke 2", "Joke 3", "Joke 4", "Joke 5", "Joke 6", "Joke 7", "Joke 8", "Joke 9", "Joke 10"]
    var randomJokeArray = [String]()
    
    @IBOutlet weak var jokeTableView: UITableView!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        randomJokeManager.delegate = self
        
        jokeTableView.delegate = self
        jokeTableView.dataSource = self
        
        // Style buttons
        okButton.layer.cornerRadius = 20
        
        retrieveJokes()
        
//        retrieveJokes()
//        jokeTableView.reloadData()
        
//        //Pull Down Refresh NOT REQUIRED - PAGINATION!!
//        refreshControl = UIRefreshControl()
//        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
//        jokeTableView.addSubview(refreshControl)
        
    }
    
//    //Pull Down Refresh NOT REQUIRED - PAGINATION!!
//    @objc func refresh(_ sender: Any) {
//        retrieveJokes()
//
//        // Stop Spinner
//        refreshControl.endRefreshing()
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        jokeTableView.reloadData()
    }

    func retrieveJokes() {
        // Loop to get 10 random jokes
        for _ in 1...10 {
            // Fetch random joke
            randomJokeManager.fetchRandomJoke()
        }
    }
    
    func didUpdateRandomJoke(_ randomJokeManager: RandomJokeManager, randomJoke: String) {
        
        print("DID UPDATE RANDOM JOKE")
        print(randomJoke)
        print(self.randomJokeArray)
        // Replace Occurences of bad punctuation
        let replaceQuot = randomJoke.replacingOccurrences(of: "&quot;", with: "\"")
        // Found a joke stating he?s, but appears to be an error in the API as ' appears in other jokes and ? used correctly...
//        let replaceQues = replaceQuot.replacingOccurrences(of: "?", with: "\'")
                                  
        DispatchQueue.main.async {
            print(replaceQuot)
            self.randomJokeArray.append(replaceQuot)
            print(self.randomJokeArray)
        }
                                  
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    @IBAction func okButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return randomJokeArray.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! JokeCell
        cell.configureJoke(randomJoke: randomJokeArray[indexPath.row])
            
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
//        print("offsetY: \(offsetY) | contentHeight: \(contentHeight)")
            
        if offsetY > contentHeight - scrollView.frame.height {
            if !fetchingMore {
                beginBatchFetch()
            }
        }
    }
    
    func beginBatchFetch() {
        fetchingMore = true
        print("Begin Batch Fetch")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.retrieveJokes()
            self.fetchingMore = false
            self.jokeTableView.reloadData()
        })
    }
    
}
