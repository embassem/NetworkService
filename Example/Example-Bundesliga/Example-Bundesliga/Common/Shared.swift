//
//  Shared.swift
//  Bundesliga
//
//  Created by Bassem on 2/5/17.
//  Copyright © 2017 Bassem Abbas. All rights reserved.
//

import Foundation
import PKHUD


class Shared {
    
    
    class HUD {
        
        class func showProgressHUD(title:String?,subTitle:String?){
            
            PKHUD.sharedHUD.contentView = PKHUDProgressView(title: title, subtitle: subTitle)
            PKHUD.sharedHUD.show()
            
        }
        
        
        class func HideHud(after:TimeInterval){
            
            PKHUD.sharedHUD.hide(afterDelay: after)
        }
        
    }
    
}
