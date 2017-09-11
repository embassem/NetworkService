//
//  RealmLocalStorageModel.swift
//  Bundesliga
//
//  Created by Bassem on 1/29/17.
//  Copyright © 2017 Bassem Abbas. All rights reserved.
//

import Foundation
import RealmSwift



class RealmLocalStorageModel {
    
    
    lazy var realm: Realm = {
        
        return try! Realm()
    }()
    
    
   
    
    
    
    
    
    
}

extension RealmLocalStorageModel:LocalDataStorageProtocal{
    
    
    func saveComptitionTeamsDatatoLocal(comptition: TeamsDataModel) -> Bool {
        
        
        
        do {
            
            try realm.write {
                realm.add(comptition)
                realm.refresh()
                
                
            }
        } catch let error as Error {
            fatalError(error.localizedDescription)
            
        }
        
        return true
        
    }
    
    func getTeamComptition(comptitionId: Int) -> TeamsDataModel? {
       
        
        do {
            
            let team =  realm.objects(TeamsDataModel.self).filter("competitionId == %@", comptitionId).first

            return team;
            
            
        } catch let error as Error {
            fatalError(error.localizedDescription)
            
        }
        
    }
    
    
   
    
    
    
}
