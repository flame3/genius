//
//  requestTableViewCell.swift
//  genius
//
//  Created by Nick on 5/19/19.
//  Copyright © 2019 nicksdev. All rights reserved.
//

import UIKit

class requestTableViewCell: UITableViewCell {
    
    
    var result: Results? {
        didSet{
            guard let result = result else {return}
            artistNameLBL.text = result.artistName
            albumReleaseDate.text = result.releaseDate
            print(artistNameLBL.text!)
            print(albumReleaseDate.text!)
            guard let url = URL(string: result.artworkUrl100) else {return}
            DownloadJsonThruUrl.instance.downloadImagesThruUrl(withUrl: url) { [ weak self ] (image) in
                self?.artistCoverImage.image  = image
                
                print(self!.artistCoverImage)
            }
        }
    }
    
    let artistCoverImage: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let artistNameLBL: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let albumReleaseDate: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.addSubview(artistCoverImage)
        self.addSubview(artistNameLBL)
        self.addSubview(albumReleaseDate)
        setupUI()
    }
    
    
    func setupUI(){
        
        artistCoverImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        artistCoverImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        artistCoverImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 15).isActive = true
        artistCoverImage.widthAnchor.constraint(equalToConstant: 150)
        
        
        
        artistNameLBL.leftAnchor.constraint(equalTo: artistCoverImage.rightAnchor, constant: 15).isActive = true
        artistNameLBL.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        artistNameLBL.widthAnchor.constraint(equalToConstant: 50).isActive = true
        artistNameLBL.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        albumReleaseDate.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        albumReleaseDate.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        albumReleaseDate.widthAnchor.constraint(equalToConstant: 50).isActive = true
        albumReleaseDate.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
    }

    

}
