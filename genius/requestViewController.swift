//
//  requestViewController.swift
//  genius
//
//  Created by Nick on 5/15/19.
//  Copyright © 2019 nicksdev. All rights reserved.
//

import UIKit

class requestViewController: UIViewController, UITableViewDataSource {
   
    

    let requstTV: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .blue
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    final let urlSting = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
    
    var artistNameArray = [String]()
    var albumNameArray = [String]()
    var albumCoverImageArray = [String]()
    
    
    
    
    // link for  media: https://rss.itunes.apple.com/en-us
    //   https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.requstTV.dataSource = self
        
        view.addSubview(requstTV)
        
        requstTV.register(requestTableViewCell.self, forCellReuseIdentifier: "cell")
        
       
        setupUI()
        self.downloadJsonWihTask()
        
        view.backgroundColor = .yellow
    }
    
    
    // MARK: - Setup UI
    
    
    func setupUI(){
        requstTV.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        requstTV.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        requstTV.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        requstTV.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //requstTV.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! requestTableViewCell
//        cell.albumNameLBL.text = albumNameArray[indexPath.row]
//        cell.artistNameLBL.text = artistNameArray[indexPath.row]
//
//
//        let imgURL = NSURL(string: albumCoverImageArray[indexPath.row])
//
//        if imgURL != nil{
//            let data = NSData(contentsOf: (imgURL as URL?)!)
//            cell.artistCoverImage.image = UIImage(data: data! as Data)
//        }
//
        return cell
    }
    

    
    
    
    
    // MARK: - Helper Methods to retrieve data
    
    func downloadJsonWithUrl(){
        let url = NSURL(string: urlSting)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: { (data, response, error) in
            if let jo = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary{
                print(jo.value(forKey: "feed")!)
                
//                if self.artistNameArray = jo.value(forKey: "feed") as? NSArray{
//                  if let results = jo.value(forkey: "results") as? NSArray{
//                    for artist in self.artistNameArray{
//                        if let artistDictionary = artist as? NSDictionary{
//                            if let name = artistDictionary.value(forKey: "artist"){
//                                self.artistNameArray.append(name as! String)
//                            }
//                            if let name = artistDictionary.value(forKey: "artist"){
//                                self.albumNameArray.append(name as! String)
//                            }
//                            if let name = artistDictionary.value(forKey: "artist"){
//                                self.albumCoverImageArray.append(name as! String)
//                            }
//                OperationQueue.main.addOperation({
//                    self.requstTV.reloadData()
//                })
//
//
//                        }
//                        // go ahead and dig deeper
//                    }
//                }// last brace for if statement
//            }

            }//end of dataTask
            
        }).resume()
    }//end
    
    func downloadJsonWihTask(){
        
        let url = NSURL(string: urlSting)
        var downloadTask = URLRequest(url: (url as? URL)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20)
        
        downloadTask.httpMethod = "GET"
        


        
        URLSession.shared.dataTask(with: downloadTask, completionHandler: { (data, response, error) in
            let jo = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            
            print(jo)
        }).resume()
        
        
    }
    


}
