//
//  TeamCollectionViewCell.swift
//  Bundesliga
//
//  Created by Bassem on 1/29/17.
//  Copyright © 2017 Bassem Abbas. All rights reserved.
//

import UIKit
import Alamofire
import SVGKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!

    
    var celldata:Team!
    
    func setUpCell(data:Team) {
        
        
        self.celldata = data;
        
        
        if let title = self.celldata.name{
            self.teamNameLabel.text = title;
        }
        self.teamImageView.image = nil;
        self.teamImageView.contentMode = .scaleAspectFit;
        
       
            
        //TODO:- Replace SVG Lib with better one cause laging when scroll on real Deveice 
        
        if let imageLinkString = self.celldata.crestUrl{
            print(imageLinkString)
             DispatchQueue.global(qos: .background).async {
            if let url = URL(string: imageLinkString){
                
                Alamofire.request(url).responseData(completionHandler: { (imageData) in
                    if let data = imageData.data{
                        DispatchQueue.main.async {
                            
                        
                        if let anSVGImage = SVGKImage(data: data){
                    self.teamImageView.image = anSVGImage.uiImage
                        }else {
                            if let image = UIImage(data: data){
                                self.teamImageView.image = image;
                            }
                            
                            }
                        }
                    }
                    
                })
                
                
            }
        }
            
        }
    }
    
}
