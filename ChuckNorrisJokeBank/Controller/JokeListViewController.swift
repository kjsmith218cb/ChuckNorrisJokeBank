//
//  JokeListViewController.swift
//  ChuckNorrisJokeBank
//
//  Created by Danny on 24/02/2020.
//  Copyright © 2020 Daniel Sutcliffe. All rights reserved.
//

import UIKit

class JokeListViewController: UIViewController, RandomJokeManagerDelegate {
    
//    var randomJokeArray = ["Joke 1", "Joke 2", "Joke 3", "Joke 4", "Joke 5", "Joke 6", "Joke 7", "Joke 8", "Joke 9", "Joke 10"]
    var randomJokeArray = [String]()
    
    var randomJokeManager = RandomJokeManager()
    var refreshControl: UIRefreshControl!
    
    @IBOutlet weak var jokeTableView: UITableView!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Pull Down Refresh
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        jokeTableView.addSubview(refreshControl)
        
        randomJokeManager.delegate = self
        
        // Style buttons
        okButton.layer.cornerRadius = 20
        
        retrieveJokes()
        
    }
    
    //Pull Down Refresh
    @objc func refresh(_ sender: Any) {
        retrieveJokes()

        // Stop Spinner
        refreshControl.endRefreshing()
    }

    func retrieveJokes() {
        // Loop to get 10 random jokes
        for _ in 1...2 {
            // Fetch random joke
            randomJokeManager.fetchRandomJoke()
        }
        jokeTableView.reloadData()
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
    
}

extension JokeListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomJokeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.textLabel?.text = randomJoke[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! JokeCell
        cell.configureJoke(randomJoke: randomJokeArray[indexPath.row])
        
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("TEST")
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        print("offsetY: \(offsetY) | contentHeight: \(contentHeight)")
    }
    
}
