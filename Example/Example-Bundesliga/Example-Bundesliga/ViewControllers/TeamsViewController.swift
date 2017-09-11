//
//  TeamsViewController.swift
//  Bundesliga
//
//  Created by Bassem on 1/29/17.
//  Copyright © 2017 Bassem Abbas. All rights reserved.
//

import UIKit

class TeamsViewController: UIViewController {

    var viewModel : TeamsViewModel!

    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        
        //initialize the viewModel passing it a closure to call when the viewModel has new data
        
        self.viewModel = TeamsViewModel(reloadCollectionViewCallback : reloadCollectionViewData)
        
        self.viewModel.retrieveData();
        
        //TODO: add pull to force refresh data from internet
        
    }

   
    
   
    
    func setupCollectionView(){
        teamsCollectionView.delegate = self
        teamsCollectionView.dataSource = self
        
    }
    
    //method is called by the viewModel when it has new data
    func reloadCollectionViewData(){
        
        teamsCollectionView.reloadData()
        
    }
    
    
    
}

extension TeamsViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return viewModel.numberOfSectionsInCollectionView()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.numberOfItemsInSection(section: section)
        
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamCollectionViewCell
        
        
        if let cellData =   viewModel.dataforCellinCollectionView(cellForItemAtIndexPath: indexPath){
            
            cell.setUpCell(data: cellData)
        }
        
        return  cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
        if let cell  = collectionView.cellForItem(at: indexPath) as? TeamCollectionViewCell {
            
            self.pushToPlayerController(team: cell.celldata)
            
        }
        
    }
}

extension TeamsViewController{
    
    // setting the size of an item to have  2 item per row with 20 pt in lefta nand middle and right
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let padding =  CGFloat(integerLiteral: 60);
        let collectionViewSize = collectionView.frame.size.width - padding;
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2);
        
    }
    
    
    
    //use to push from pteam VC to player vc 
    //paramter:team  to ge the selected team and team id  
    
    func pushToPlayerController(team:Team) {
        
        
        let stb = UIStoryboard(storyboard: .Main);
        let pushVC:PlayersViewController = stb.instantiateViewController();
        
        pushVC.team = team;
        
        self.navigationController?.pushViewController(pushVC, animated: true);
        
    }
}

extension TeamsViewController:UICollectionViewDelegate{
    
    
}

