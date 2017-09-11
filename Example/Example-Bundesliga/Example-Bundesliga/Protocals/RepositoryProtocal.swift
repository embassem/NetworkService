//
//  RepositoryProtocal.swift
//  Bundesliga
//
//  Created by Bassem on 1/29/17.
//  Copyright © 2017 Bassem Abbas. All rights reserved.
//

import Foundation


 protocol TeamsRepositoryProtocal {
    //MARK: TeamsViewController
     func getTeamsForComptition(comptitionId:Int,withPrefeared:RepositoryPrefaredStorage , callback :@escaping ((_ result : Any)->()));
    
    
    
   
}



 protocol PlayesRepositoryProtocal {
    
    
    //MARK: PlayerViewController
    
      func getPlayersForTeam(teamId:String,withPrefeared:RepositoryPrefaredStorage , callback :@escaping ((_ result : Any)->()));
    
     //func getPlayersForTeam(teamPath:String,withPrefeared:RepositoryPrefaredStorage , callback :@escaping ((_ result : Any)->()));
    
}

enum RepositoryPrefaredStorage{
    
    case normal;
    case remote;
    case local;
    
}
