//
//  VegetableViewController.swift
//  SmartyMarty
//
//  Created by Leo on 2023-04-17.
//

import UIKit

class VegetableViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    let artichoke : Vegetable = .init()
    let carrot : Vegetable = .init()
    let eggplant : Vegetable = .init()
    let greenbeans : Vegetable = .init()
    let lettuce : Vegetable = .init()
    let pepper : Vegetable = .init()
    let spinach : Vegetable = .init()
   
   
    
    var al:[Vegetable] = []

    func getVege(){
        artichoke.initWithData(vege: "Artichoke")
        carrot.initWithData(vege: "Carrot")
        eggplant.initWithData(vege: "Eggplant")
        greenbeans.initWithData(vege: "Greenbeans")
        lettuce.initWithData(vege: "Lettuce")
        pepper.initWithData(vege: "Pepper")
        spinach.initWithData(vege: "Spinach")
        
        al =  [artichoke,carrot,eggplant,greenbeans,lettuce,pepper,spinach]
    }
    override func viewDidLoad() {
        getVege()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return al.count
    }

    // define table method for cell thickness
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }

    // define table method for how each cell should look
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "Kids_App-01.png")!)
        
        let tableCell : SiteCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell ?? SiteCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")

        // populate the cell
        let rowNum = indexPath.row
        let vege = "\(al[rowNum].vege ?? "")"
       // let imgName = UIImage(named:imageData[rowNum])

        tableCell.primaryLabel.text =  vege

        tableCell.myImageView.image = UIImage(named: vege + ".png")
        tableCell.accessoryType = .disclosureIndicator

        // return the cell
        return tableCell

    }


    // define the table method for clicking on a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // in AppDelegate define a string called selectedURL
        let rowNum = indexPath.row
        let a = al[rowNum].vege!
        
        
        
        SoundManager.shared.playSound(forResource: a, ofType: "mp3")
        
        let alertController = UIAlertController(title: "Playing sound for ", message: a, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        //SoundManager.shared.playSound(forResource: a, ofType: "mp3")
        
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
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
