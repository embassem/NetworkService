//
//  PlayersViweModel.swift
//  Bundesliga
//
//  Created by Bassem on 2/5/17.
//  Copyright © 2017 Bassem Abbas. All rights reserved.
//

import Foundation
import SwifterSwift
class PlayersViewModel: NSObject{
    
    private var reloadCollectionViewCallback : (()->())!
    private var dataModel :PlayersDataModel?
    private  var repository:PlayesRepositoryProtocal!
    var teamId:String!
    //reloadCollectionViewCallback given to us by view controller
    //we'll use this to trigger reloading data in the view controller's collection view
    init(reloadCollectionViewCallback : @escaping (()->()),teamId:String){
        
        super.init()
        
        self.reloadCollectionViewCallback = reloadCollectionViewCallback;
        self.teamId = teamId;
        self.repository = Repository(LocalDataStoreage:RealmLocalStorageModel(),RemoteDataStorage:MoyaNetworkLModel())
        
    }
    
    //invoke data manager to get new data
    func retrieveData(){
        
        
  /*      // abstract team id from url to use for Moya repository
        //another way is to remove the domain from the given href and send the rest as a paramter to moya Model
        var teamId = ""
        var teamPath = ""
        if let href = self.team.links?.players?.href{
            if let teamID =   href.splitted(by: "/").last{
                teamId = teamID;
            }
        }
        if let href = self.team.links?.players?.href{
            
            teamPath = href.replacingOccurrences(of: "http://api.football-data.org", with: "", options: NSString.CompareOptions.literal, range:nil)
            
        }
        // self.repository.getPlayersForTeam(teamPath: teamPath, withPrefeared: .remote) { (response)
     */
        
        self.repository.getPlayersForTeam(teamId: teamId, withPrefeared: .remote) { (response) in
 
            
            if let playesDataModel = response as? PlayersDataModel{
                
                self.dataModel = playesDataModel;
                
                self.reloadCollectionViewCallback()
            }
        }
    }
    
    
    
    func getPlayersName() -> [String]{
        
        if let  playerNames =  self.dataModel?.players{
            
          let names =   playerNames.flatMap { (player:Player) -> String? in
                
                return player.name
            }
            return names
        }else {
            
            return [];
        }
        
        
    }
    
    func getSectionIndexs() -> [String]{
        
        
        var names  = getPlayersName();
        
        names.removeDuplicates();
        
     var indexs =    names.map { (name) -> String in
            
            String( name.characters.first!).uppercased()
        }
        
        indexs.removeDuplicates();
      let sortedIndex =  indexs.sorted();
        
        return sortedIndex
        
    }
    
    
    //CollcetionView related Method
    
    func numberOfSectionsInCollectionView() -> Int{
        
        var numberOfSections = 1;
       
        
       var playerNames = getPlayersName()
        playerNames.removeDuplicates();
        numberOfSections = playerNames.count
        
        return  numberOfSections;
    }
    
    func numberOfRowsInSection(section:Int)-> Int {
        
        var numberOfItems = 0;
        
        let sectionString = self.getSectionIndexs()[section];
        
    let playersCount = dataModel?.players!.filter({ (player) -> Bool in
        
        player.name!.uppercased().firstCharacter == sectionString.uppercased().firstCharacter
    })
        
        if let count  = playersCount?.count{
            numberOfItems = count
        }
        
        
        return  numberOfItems;
    }
    
    func dataforCellinTableViewView( cellForItemAtIndexPath indexPath: IndexPath) -> Player? {
        
        let sectionString = self.getSectionIndexs()[indexPath.section];
        
        let players = dataModel?.players!.filter({ (player) -> Bool in
            
            player.name!.uppercased().firstCharacter == sectionString.uppercased().firstCharacter
        })
    let sortedPlayers =     players?.sorted(by: { (first:Player, secand:Player) -> Bool in
                return   first.name! < secand.name!
        });
        
        if let player =  sortedPlayers?[indexPath.row] {
            
            return player
        }else {
            return nil
        }
        
        
    }
    
}
