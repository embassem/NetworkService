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
        
        
        
    NetworkService.config(providers: [GithubProvider(baseUrl: "https://api.github.com", plugins: [], headers: []).getprovider()])
        
        
        NetworkService.shared.request(endPoint: GitHub.userRepositories("ashfurrow"), modelType: userRepo.self ,responseType: .array) { (result, json, response, type) in
            
            switch result {
                
            case .success(let res)  :
                
                if let userprofile  = res as? GenaricModel<GithubRoot> {
                    
                    
                }else {
                    
                }
                
                break ;
                
                
                
            case .failure(let error ) :
                
                return
                
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}




