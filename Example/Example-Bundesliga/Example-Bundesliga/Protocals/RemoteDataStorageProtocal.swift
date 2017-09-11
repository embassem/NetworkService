//
//  RemoteDataStorageProtocal.swift
//  Bundesliga
//
//  Created by Bassem on 1/29/17.
//  Copyright © 2017 Bassem Abbas. All rights reserved.
//

import Foundation

protocol RemoteDataStorageProtocal {
    
    //Mark:TeamsViewController
    func getTeamsForComptition(comptitionId:Int ,callback : @escaping ((_ error:Bool,_ result : Any)->()));
    
    
    
    
    //MARK:- PlayersViewController 
    func getPlayersforTeam(teamId:String,callback : @escaping ((_ error:Bool,_ result : Any)->()))
    //func getPlayersforTeam(teamPath:String,callback : @escaping ((_ error:Bool,_ result : Any)->()))
}
