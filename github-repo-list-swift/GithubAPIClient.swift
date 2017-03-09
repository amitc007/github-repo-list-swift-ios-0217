//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    class func getRepositories (completion: @escaping ([[String : Any]]) -> Void ) {
        print("\nIn getRepositories:\n")
        let urlStr = "https://api.github.com/repositories?client_id=\(clientID)&client_secret=\(secret)"
        
            print(urlStr)
            let url = URL(string: urlStr)
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url!, completionHandler: { (data, response, error) in
         
                    if let unwrappedData = data {
                        //print(unwrappedData)
                        do {
                            let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [[String : Any]] ?? [[:]]
                            //print("responseJSON:\(responseJSON)")
                            completion(responseJSON)
                            
                            
                        } catch {  }
                    }
                }
                )
            dataTask.resume()
        
        
    }   //class func
    
}
    


