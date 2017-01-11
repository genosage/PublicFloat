//
//  ArtworkViewController.swift
//  PublicFloat
//
//  Created by Xing Hu on 15/9/17.
//  Copyright (c) 2015年 YellowTeam. All rights reserved.
//

import Foundation
import UIKit
class ArtworkListViewController: UITableViewController,UISearchBarDelegate, UISearchDisplayDelegate {
    
    var emoBelong = Emotion(id: 0,emotion_name: "",artwork_id: 0)
    var emotions = [Emotion]()
    
    var artworks = [ArtWork]()
    var filteredArtworks = [ArtWork]()
    var is_searching : Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SelectArtwork()
        self.filteredArtworks=[]
        
        is_searching = false
        //   self.tableView.reloadData()
        print("curretn_user++\(AppDelegate.current_user.user_id)")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func SelectArtwork(){
        databody.fetchAllArtworks({ (allartworks) -> Void in
            DispatchQueue.main.async(execute: {
                
                for e in self.emotions{
                    if(e.emotion_name == self.emoBelong.emotion_name){
                        for art in allartworks{
                            if(e.artwork_id == art.artwork_id){
                                self.artworks.append(art)
                            }
                        }
                    }
                }
                self.tableView.reloadData()
            })
            }, error: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (is_searching == true){
            return filteredArtworks.count
        }else{
            return artworks.count  //Currently Giving default Value
        }
    }
    
    override  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : ArtwrokCell = tableView.dequeueReusableCell(withIdentifier: "ACell") as! ArtwrokCell
        
        if(is_searching == false){
            let artwork = self.artworks[indexPath.row]
            // Configure the cell
            cell.ArtworkName.text = artwork.name
            cell.ArtworkImg.image = UIImage(named: artwork.imageUrl)
            
        }else {
            let artwork = self.filteredArtworks[indexPath.row]
            // Configure the cell
            cell.ArtworkName.text = artwork.name
            cell.ArtworkImg.image = UIImage(named: artwork.imageUrl)
            
        }
        
        return cell //
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchBar.text!.isEmpty{
            is_searching = false
            self.tableView.reloadData()
        } else {
            
            is_searching = true
            filteredArtworks = []
            for index in 0 ..< artworks.count
            {
                let artwork_id = artworks[index].artwork_id
                let currentName = artworks[index].name
                let currentimg = artworks[index].imageUrl
                let currentDesc = artworks[index].location
                if (currentName.lowercased().range(of: searchText.lowercased())  != nil ){
                    
                    filteredArtworks.append(ArtWork(artwork_id:artwork_id, name: currentName, imageUrl: currentimg, location: currentDesc))
                    
                }
            }
            
        }
        tableView.reloadData()
    }
    
    
    
    //fort the detail view
    //    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //        self.performSegueWithIdentifier("artworkdetail", sender: tableView)
    //    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "artworkdetail" {
            
            if let destination = segue.destination as? ArtworkDetailViewController {
                let index = tableView.indexPathForSelectedRow?.row
                if  index != nil{
                    destination.art = artworks[index!]
                    destination.emo = self.emoBelong
                }
            }
        }
    }
    
    
}

