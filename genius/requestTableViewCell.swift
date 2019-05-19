//
//  requestTableViewCell.swift
//  genius
//
//  Created by Nick on 5/19/19.
//  Copyright © 2019 nicksdev. All rights reserved.
//

import UIKit

class requestTableViewCell: UITableViewCell {
    
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
    let albumNameLBL: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.addSubview(artistCoverImage)
        self.addSubview(artistNameLBL)
        self.addSubview(albumNameLBL)
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
        
        
        
        albumNameLBL.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        albumNameLBL.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        albumNameLBL.widthAnchor.constraint(equalToConstant: 50).isActive = true
        albumNameLBL.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
