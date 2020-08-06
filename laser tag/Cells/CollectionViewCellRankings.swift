//
//  CollectionViewCellGame.swift
//  laser tag
//
//  Created by Aarush Bothra on 7/29/20.
//  Copyright © 2020 Aarush Bothra. All rights reserved.
//

import UIKit

class CollectionViewCellRankings: UICollectionViewCell {
    

    
    @IBOutlet weak var tableViewInGame: UITableView!
    
    
    var teamsSorted = [Team]()
    var playersInYourTeam = [Player]()
    var playersSorted = [Player]()
    
    var cellNumber = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension CollectionViewCellRankings: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch cellNumber {
        case 0:
            return playersSorted.count
        case 1:
            return teamsSorted.count
        case 2:
            print("creating second cell")
            return playersInYourTeam.count
        default:
            return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RankingCellTV")!
        cell.backgroundColor = UIColor.systemGray2
        
        switch cellNumber {
        case 0://FFA
            cell.textLabel?.text = "\(playersSorted[indexPath.row].username): \(playersSorted[indexPath.row].kills)"
        case 1://Team rankings
            if Game.teamSetting > 0 {
                cell.textLabel?.text = "Team \(String(teamsSorted[indexPath.row].team!)): \(String(teamsSorted[indexPath.row].score!))"
                switch teamsSorted[indexPath.row].team {
                case 1:
                    cell.backgroundColor = UIColor.red
                case 2:
                    cell.backgroundColor = UIColor.blue
                case 3:
                    cell.backgroundColor = UIColor.green
                case 4:
                    cell.backgroundColor = UIColor.purple
                case 5:
                    cell.backgroundColor = UIColor.orange
                case 6:
                    cell.backgroundColor = UIColor.cyan
                case 7:
                    cell.backgroundColor = UIColor.yellow
                case 8:
                    cell.backgroundColor = UIColor.magenta
                default:
                    cell.backgroundColor = UIColor.systemBlue
                }
            }
        case 2://Players in team
            print("printing team player")
            cell.textLabel?.text = "\(playersInYourTeam[indexPath.row].username) | K: \(playersInYourTeam[indexPath.row].kills) D: \(playersInYourTeam[indexPath.row].deaths)"
        default:
            break
            
        }
        
        return cell
    }
        
    
    
    
}

