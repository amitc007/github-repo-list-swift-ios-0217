//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    var store = ReposDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.accessibilityLabel = "tableView"
        tableView.accessibilityLabel = "tableView"
        tableView.accessibilityIdentifier = "tableView"
        
        store.getRepositoriesFromAPI {
            DispatchQueue.main.async {
                // your code that touches the UI here, like, maybe:
                self.tableView.reloadData()
            }

        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.repositories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! RepoTableCell
        
        cell.fullName.text = store.repositories[indexPath.row].fullName
        cell.url.text = String(describing: store.repositories[indexPath.row].htmlURL)
        cell.repositoryId.text = store.repositories[indexPath.row].repositoryID
        print("In tableView:\(cell.repositoryId.text)")
        return cell
    }
    

}
