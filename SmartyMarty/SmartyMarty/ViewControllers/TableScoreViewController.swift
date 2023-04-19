//
//  ScoresViewController.swift
//  SmartyMarty
//
//  Created by Kirill Afanasiev on 2023-04-19.
//

import UIKit

class TableScoreViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
   
    
    var scores: [Score] = []
    
    override func viewDidLoad() {
        readDb()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }

    // define table method for cell thickness
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }

    // define table method for how each cell should look
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "Kids_App-01.png")!)
        let tableCell : ScoreCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ScoreCell ?? ScoreCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        tableCell.scoreLabel.text = "\(scores[indexPath.row].score)"
        return tableCell
    }


    func readDb(){
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                appDelegate.readDb()
                self.scores = appDelegate.scores
            }
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
