//
//  PlayersViewController.swift
//  Bundesliga
//
//  Created by Bassem on 2/5/17.
//  Copyright © 2017 Bassem Abbas. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {

    
    var viewModel : PlayersViewModel!
    var team:Team!
   
    
    @IBOutlet weak var playerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
          self.setupTableView();
        //initialize the VM  passing closer to callback when reload data
        if let teamId = team.teamID{
        self.viewModel = PlayersViewModel(reloadCollectionViewCallback: self.reloadTableViewData,teamId:teamId);
        
      
        
        //get the data ;
        self.viewModel.retrieveData();
        }
        
         self.playerTableView.tableHeaderView = UIView(frame: CGRect.zero);
        
        //remove Empty cell
        
        self.playerTableView.tableFooterView = UIView(frame: CGRect.zero);
        
    }

    
    
    
    
    func setupTableView(){
        playerTableView.delegate = self
        playerTableView.dataSource = self
        
    }
    
    func reloadTableViewData(){
        
        playerTableView.reloadData()
        
    }
    
}

extension PlayersViewController:UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if   UIDevice.current.model.lowercased() != "iphone"{
           return 60
        }else {
            return 84
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 28
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return viewModel.getSectionIndexs().count
        
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
      return   viewModel.getSectionIndexs()
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return viewModel.getSectionIndexs()[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        var identifier  = "PlayersIphone"
      if   UIDevice.current.model.lowercased() != "iphone"{
        identifier = "PlayersIpad"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PlayerTableViewCell
        if let data = viewModel.dataforCellinTableViewView(cellForItemAtIndexPath: indexPath){
        cell.setUpCell(data: data);
        
        }
        
        
        return cell
    }
    
    
     func getTeamId() -> String{
        if let links = self.team.links{
            
            if let players = links.players{
                
                if let href = players.href{
                    var arr =   href.splitted(by: "/")
                    arr.removeLast()
                    
                    if let teamID =  arr.last{
                        return  teamID;
                    }
                }
            }
        }
        return ""
        
    }
}


extension PlayersViewController:UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        debugPrint("No logic for select Player !")
    }
}
