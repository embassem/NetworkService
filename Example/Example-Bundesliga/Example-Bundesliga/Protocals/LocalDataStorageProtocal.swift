
//
//  LocalDataStorageProtocal.swift
//  Bundesliga
//
//  Created by Bassem on 1/29/17.
//  Copyright © 2017 Bassem Abbas. All rights reserved.
//

import Foundation
protocol LocalDataStorageProtocal {
    
    func saveComptitionTeamsDatatoLocal(comptition:TeamsDataModel)-> Bool;
    func getTeamComptition(comptitionId:Int)-> TeamsDataModel?;
    
}
