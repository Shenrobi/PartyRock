//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Terrell Robinson on 8/31/16.
//  Copyright © 2016 Terrell Robinson. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRockVids = [PartyRock]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let p1 = PartyRock(imageURL: "https://i.ytimg.com/vi/wyx6JDQCslE/maxresdefault.jpg", videoURL: "<iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/wyx6JDQCslE?rel=0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Sexy and I Know It")
        
        let p2 = PartyRock(imageURL: "https://i.ytimg.com/vi/XNtTEibFvlQ/maxresdefault.jpg", videoURL: "<iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/XNtTEibFvlQ?rel=0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Shots")
        
        
        let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/KQ6zr6kCPj8/maxresdefault.jpg", videoURL: "<iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/KQ6zr6kCPj8?rel=0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Party Rock Anthem")
        
        
        let p4 = PartyRock(imageURL: "https://i.ytimg.com/vi/SkTt9k4Y-a8/maxresdefault.jpg", videoURL: "<iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/SkTt9k4Y-a8?rel=0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Sorry for Party Rocking")
        
        let p5 = PartyRock(imageURL: "https://i.ytimg.com/vi/pnlo531zWSs/maxresdefault.jpg", videoURL: "<iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/UA8rcLvS1BY?rel=0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Champagne Showers")
        
        partyRockVids.append(p1)
        partyRockVids.append(p2)
        partyRockVids.append(p3)
        partyRockVids.append(p4)
        partyRockVids.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRockVids[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            
            // Every time we grab a new cell, the table view knows which index we are.... And the index is always going to be equal to the number that we put in the function below (numberOfRowsInSection)... So every time we go through, we need to grab an item out of the partyRockVids array.
            
            return cell
        } else {
            return UITableViewCell()
        }
        
    } // When iOS recycles cells
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return partyRockVids.count
    } // How many rows do you want in your table view
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyRock = partyRockVids[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
    

}





