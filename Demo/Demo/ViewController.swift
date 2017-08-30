//
//  ViewController.swift
//  Demo
//
//  Created by Bassem on 8/30/17.
//  Copyright © 2017 ADLANC. All rights reserved.
//

import UIKit
import NetworkService
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//         IbtikarProvider(baseUrl: "https://api.github.com", plugins: [], headers: []).getprovider()
    NetworkService.config(providers: [ MOIAProvider(baseUrl: "https://api.github.com", plugins: [], headers: []).getprovider(),ibtikarProvider(baseUrl: "https://api.github.com", plugins: [], headers: []).getprovider()])
        
        
        
        NetworkService.shared.request(endPoint:IbtikarAPI.aboutProgram, modelType: AboutProgram.self ,responseType: .object) { (result, json, response, type) in
            
            switch result {
                
            case .success(let res)  :
                
                if let userprofile  = res as? GenaricModel<AboutProgram> {
                    
                    
                }else {
                    
                }
                
                break ;
                
                
                
            case .failure(let error ) :
                
                return
                
            }
        }
        
//        
//        NetworkService.shared.request(endPoint: GitHub.userRepositories("ashfurrow"), modelType: userRepo.self ,responseType: .array) { (result, json, response, type) in
//            
//            switch result {
//                
//            case .success(let res)  :
//                
//                if let userprofile  = res as? GenaricModel<userRepo> {
//                    
//                    
//                }else {
//                    
//                }
//                
//                break ;
//                
//                
//                
//            case .failure(let error ) :
//                
//                return
//                
//            }
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}




