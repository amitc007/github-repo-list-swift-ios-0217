//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    var fullName:String      //full name of the repository object
    var htmlURL:String    //`String` value for the key `html_url`
    var repositoryID:String   //ID of the repository
    
    
    init(dictionary: [String: Any]) {
        
        fullName = dictionary["full_name"] as! String
        htmlURL = dictionary["html_url"] as! String
        //repositoryID = String(describing: dictionary["id"].unsafelyUnwrapped)
        repositoryID = (dictionary["id"] as! NSNumber).stringValue
    }
    
 }
