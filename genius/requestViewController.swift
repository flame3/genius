//
//  requestViewController.swift
//  genius
//
//  Created by Nick on 5/15/19.
//  Copyright © 2019 nicksdev. All rights reserved.
//

import UIKit

class requestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var results = [Results]()
    
    let requstTV: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .blue
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    final let urlSting = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
    //var results: [Results]()
    // link for  media: https://rss.itunes.apple.com/en-us
    //   https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.requstTV.dataSource = self
        self.requstTV.delegate = self
        
        view.addSubview(requstTV)
        
        requstTV.register(requestTableViewCell.self, forCellReuseIdentifier: "cell")
        
        DownloadJsonThruUrl.instance.getData { [weak self ] (result) in
            result.forEach({ (result) in
                self?.navigationItem.title = result.artistName
            })
            self?.results = result
            self?.requstTV.reloadData()
            
        }
        
        setupUI()
        
        view.backgroundColor = .yellow
    }
    
    
    // MARK: - Setup UI
    
    
    func setupUI(){
        requstTV.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        requstTV.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        requstTV.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        requstTV.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! requestTableViewCell
        
        let result = results[indexPath.row]
        cell.result = result
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
    
    
    
    
    
    // MARK: - Helper Methods to retrieve data

    
}
