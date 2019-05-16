//
//  requestViewController.swift
//  genius
//
//  Created by Nick on 5/15/19.
//  Copyright © 2019 nicksdev. All rights reserved.
//

import UIKit

class requestViewController: UIViewController {

    let requstTV: UITableView = {
        let tv = UITableView()
        return tv
    }()
    
    let urlSting = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
    
    
    // link for  media: https://rss.itunes.apple.com/en-us
    //   https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .yellow
    }
    
    func downloadJsonWithUrl(){
        let url = NSURL(string: urlSting)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: { (data, response, error) in
            if let jo = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary{
                print(jo)

            }
            
        }).resume()
    }
    


}
