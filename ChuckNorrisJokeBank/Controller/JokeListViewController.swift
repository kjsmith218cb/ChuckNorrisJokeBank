//
//  JokeListViewController.swift
//  ChuckNorrisJokeBank
//
//  Created by Danny on 24/02/2020.
//  Copyright © 2020 Daniel Sutcliffe. All rights reserved.
//

import UIKit

class JokeListViewController: UIViewController {
    
    let randomJoke = ["Joke 1", "Joke 2", "Joke 3", "Joke 4", "Joke 5", "Joke 6", "Joke 7", "Joke 8", "Joke 9", "Joke 10"]
    
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Style buttons
        okButton.layer.cornerRadius = 20

    }
    
    @IBAction func okButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension JokeListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return randomJoke.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = randomJoke[indexPath.row]
        
//        let joke = randomJoke[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! NEJokeCell
//        cell.setJoke(randomJoke: joke)
        
        return cell
    }
    
}
