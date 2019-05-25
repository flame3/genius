//
//  requestViewController.swift
//  genius
//
//  Created by Nick on 5/15/19.
//  Copyright © 2019 nicksdev. All rights reserved.
//

import UIKit

class requestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    

    let requstTV: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .blue
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    final let urlSting = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
 
    // link for  media: https://rss.itunes.apple.com/en-us
    //   https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.requstTV.dataSource = self
        self.requstTV.delegate = self
        
        view.addSubview(requstTV)
        
        requstTV.register(requestTableViewCell.self, forCellReuseIdentifier: "cell")
        
       
        setupUI()
        self.downloadJsonWithUrl()
        
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
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! requestTableViewCell

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    

    
    
    
    
    // MARK: - Helper Methods to retrieve data
    struct downloadJsonThruUrl{
        let session = URLSession.shared
         func getData(completion: @escaping ([Results]) -> Void){
            guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json") else {return}

            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let error = error {
                    print("error retrieving data \(error.localizedDescription)")
                }
                
                do {
                    guard let data = data else {return}
                    let decoder = JSONDecoder()
                    let subData = try decoder.decode(SubData.self, from: data)
                    let results = subData.feed.results
                    DispatchQueue.main.async {
                        completion(results)
                    }
                    
                } catch{
                    // error
                    print("error decoding Json \(error.localizedDescription)")
                }
            }.resume()
        }
        
        
        func downloadImagesThruUrl(with: URL, completion: @escaping (_ image: UIImage?) -> Void){
            guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json") else {return}
            session.dataTask(with: url) { (data, response, error) in
                var downlaodedImage: UIImage?
                
                if let error = error{
                    print("error retrieving image \(error.localizedDescription)")
                }
                guard let data = data else {return}
                downlaodedImage = UIImage(data: data)
                
                DispatchQueue.main.async {
                    completion(downlaodedImage)
                }
            }.resume()
        }
    }
    
    
    func downloadJsonWithUrl(){
        let url = NSURL(string: urlSting)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: { (data, response, error) in
            guard let data = data, error == nil, response != nil else{
                print("something is wrong")
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let result = try decoder.decode(Feed.self, from: data)
                //print(result.results.artworkUrl100.self)
                
            } catch{
                print("something wrong after downloaded \(error.localizedDescription)")
            }
            
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
