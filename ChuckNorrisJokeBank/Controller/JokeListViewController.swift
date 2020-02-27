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
      // Pull Down Refresh NOT REQUIRED - PAGINATION!
//    var refreshControl: UIRefreshControl!
    
    var fetchingMore = false
    var randomJokeArray = [String]()
    
    @IBOutlet weak var jokeTableView: UITableView!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        randomJokeManager.delegate = self
        jokeTableView.delegate = self
        jokeTableView.dataSource = self
        
        // Set Spinner/Loading
        let loadingNib = UINib(nibName: "LoadingCell", bundle: nil)
        jokeTableView.register(loadingNib, forCellReuseIdentifier: "LoadingCell")
        
        // Style buttons
        okButton.layer.cornerRadius = 20
        
        retrieveJokes()
        
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
        
        // Replace Occurences of 'bad/poor' punctuation in a JSON
        let replaceQuot = randomJoke.replacingOccurrences(of: "&quot;", with: "\"")
        // Found a joke stating he?s, but appears to be an error in the API as ' appears in other jokes and ? used correctly...
//        let replaceQues = replaceQuot.replacingOccurrences(of: "?", with: "\'")
        
        // Send (puntuation error free) joke recieved to ViewController label
        // Request Jokes asynchronously after a 1 second delay for 'Loading Spinner' to display to user
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.randomJokeArray.append(replaceQuot)
            self.jokeTableView.reloadData()
            self.fetchingMore = false
        })
                                  
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    @IBAction func okButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // If-Else-If for Spinner/Loading
        if section == 0 {
            print("Section 0: numberOfRowsInSection")
            print("I have counted at Section 0: \(randomJokeArray.count)")

            return randomJokeArray.count

        } else if section == 1 && fetchingMore {
            print("Section 1: numberOfRowsInSection")
            print("I have counted at Section 1: \(randomJokeArray.count)")
            return 1
        }
        
        print("LAST SECTION")
        return 0
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // If-Else-If for Spinner/Loading
        if indexPath.section == 0 {

            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! JokeCell
            cell.configureJoke(randomJoke: randomJokeArray[indexPath.row])

            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell") as! LoadingCell
            cell.spinner.startAnimating()

            return cell
        }
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
            
        if offsetY > contentHeight - scrollView.frame.height {
            if !fetchingMore {
                beginBatchFetch()
            }
        }
    }
    
    func beginBatchFetch() {
        fetchingMore = true
        print("Batch Fetching")
        
        // Spinner/Loading
        jokeTableView.reloadSections(IndexSet(integer: 1), with: .none)
        
        retrieveJokes()

    }
    
}
