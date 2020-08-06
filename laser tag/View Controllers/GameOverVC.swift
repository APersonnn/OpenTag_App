//
//  GameOverVC.swift
//  laser tag
//
//  Created by Aarush Bothra on 8/4/20.
//  Copyright © 2020 Aarush Bothra. All rights reserved.
//

import UIKit

class GameOverVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var newGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func newGameButton(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let mainViewController = mainStoryboard.instantiateViewController(identifier: "MainVC") as! ViewController
        
        self.navigationController?.pushViewController(mainViewController, animated: true)
        print("switching to mainVC")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GameOverVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if Game.teamSetting > 0 {
            return Game.teamSetting + 1
        } else {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if Game.teamSetting > 0 {
            let label = UILabel()
            label.text = "Team \(section + 1): \(handleGame.findTeamScore(team: section + 1))"
            switch section + 1 {
            case 1:
                label.backgroundColor = UIColor.red
            case 2:
                label.backgroundColor = UIColor.blue
            case 3:
                label.backgroundColor = UIColor.green
            case 4:
                label.backgroundColor = UIColor.purple
            case 5:
                label.backgroundColor = UIColor.orange
            case 6:
                label.backgroundColor = UIColor.cyan
            case 7:
                label.backgroundColor = UIColor.yellow
            case 8:
                label.backgroundColor = UIColor.magenta
            default:
                label.backgroundColor = UIColor.systemBlue
            }
            return label
        } else {
            return UIView()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Game.teamSetting > 0 {
            var team = [Player]()
            for player in Players {
                if section + 1 == player.team {
                    team.append(player)
                }
            }
            return team.count
        } else {
            print("players.count: \(Players.count)")
            return Players.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCellEnd")
        
        if Game.teamSetting > 0 {
            var team = [Player]()
            for player in Players {
                if indexPath.section + 1 == player.team {
                    team.append(player)
                }
            }
            cell?.backgroundColor = UIColor.systemGray2
            cell?.textLabel?.text = "\(team[indexPath.row].username) | K: \(team[indexPath.row].kills) D: \(team[indexPath.row].deaths)"
        } else {
            print("creating players cell")
            cell?.textLabel?.text = "\(Players[indexPath.row].username) | K: \(Players[indexPath.row].kills) D: \(Players[indexPath.row].deaths)"
        }
        
        
        return cell!
    }
    
    
}
