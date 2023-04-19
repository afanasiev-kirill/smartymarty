//
//  VegetableViewController.swift
//  SmartyMarty
//
//  Created by Ziang Wang on 2023-04-17.
// This class manages the vegetable view, including displaying vegetables in a table view, playing sound for selected vegetable and handling navigation to other views.
// It also defines a custom cell for the table view and populates it with data from Vegetable objects.
// The Vegetable objects are initialized with data and stored in an array, which is used to populate the table view.
// When a cell is selected, the corresponding vegetable's name is used to play a sound and display an alert message.
// This class conforms to UITableViewDataSource and UITableViewDelegate protocols to handle table view data source and delegate methods.

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

    // Initialize Vegetable objects with data and store them in an array
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
    
    // Load the view and initialize Vegetable objects
    override func viewDidLoad() {
        getVege()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Returns the number of rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return al.count
    }

    // Returns the height of each cell in the table view
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
