//
//  PlayerTableViewCell.swift
//  Bundesliga
//
//  Created by Bassem on 2/5/17.
//  Copyright © 2017 Bassem Abbas. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var playerPositionTitleLabel: UILabel!
    @IBOutlet weak var playernameLabel: UILabel!
    
    
    var celldata:Player!
    
    func setUpCell(data:Player) {
        
        
        self.celldata = data;
        
        
        if let nametitle = self.celldata.name{
            self.playernameLabel.text = nametitle;
        }
        if let positionTitle = self.celldata.position{
            self.playerPositionTitleLabel.text = positionTitle;
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
