//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    var repositories:[GithubRepository] = []
    
    func getRepositoriesFromAPI(_ completion: @escaping () -> Void) {
        
        GithubAPIClient.getRepositories(completion: { repo in
            self.repositories = []
            //var dict = [String:Any]()
            print("\nIn getRepositoriesFromAPI:\n")
            for dict in repo {
                
                //print(dict)
                let githubRepository = GithubRepository(dictionary: dict)
                self.repositories.append(githubRepository)
                //print("id:\(githubRepository.repositoryID) fullname:\(githubRepository.fullName) url:\(githubRepository.htmlURL)")
            }
            completion()
            
        })
        
    }
}
