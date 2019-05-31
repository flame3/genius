//
//  NetworkHelper.swift
//  genius
//
//  Created by Nick on 5/25/19.
//  Copyright © 2019 nicksdev. All rights reserved.
//

import Foundation
import UIKit

struct DownloadJsonThruUrl{
    static let instance = DownloadJsonThruUrl()
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
    
    
    func downloadImagesThruUrl(withUrl url: URL, completion: @escaping (_ image: UIImage?) -> Void){
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
