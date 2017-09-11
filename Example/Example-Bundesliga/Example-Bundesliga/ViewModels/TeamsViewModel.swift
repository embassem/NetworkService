//
//  TeamsViewModel.swift
//  Bundesliga
//
//  Created by Bassem on 1/29/17.
//  Copyright © 2017 Bassem Abbas. All rights reserved.
//

import Foundation

class TeamsViewModel: NSObject{
    
   private var reloadCollectionViewCallback : (()->())!
   private var dataModel :TeamsDataModel?
   private  var repository:TeamsRepositoryProtocal!
    
    
    //reloadCollectionViewCallback given to us by view controller
    //we'll use this to trigger reloading data in the view controller's collection view
    init(reloadCollectionViewCallback : @escaping (()->())){
        
        super.init()
        
        self.reloadCollectionViewCallback = reloadCollectionViewCallback;
        
        self.repository = Repository(LocalDataStoreage:RealmLocalStorageModel(),RemoteDataStorage:MoyaNetworkLModel())
       
    }
    
    //invoke data manager to get new data
    func retrieveData(){
        
       self.repository.getTeamsForComptition(comptitionId:  440, withPrefeared: .normal) { (response) in
        
        
        if let teamDataModel = response as? TeamsDataModel{
            
            self.dataModel = teamDataModel;
            
            self.reloadCollectionViewCallback()
        }
        }
    }
    
    
    
    //CollcetionView related Method
    
    func numberOfSectionsInCollectionView() -> Int{
        
        let numberOfSections = 1;
        
        
        
        return  numberOfSections;
    }
    
    func numberOfItemsInSection(section:Int)-> Int {
        
        var numberOfItems = 0;
        if let count  = dataModel?.count{
            numberOfItems = count
        }
        
        return  numberOfItems;
    }
    
    func dataforCellinCollectionView( cellForItemAtIndexPath indexPath: IndexPath) -> Team? {
        
        if let team =  dataModel?.teams[indexPath.row] {
            
            return team
        }else {
            return nil
        }
        
        
    }
    
   

    
   
}
