//
//  ColorViewController.swift
//  SmartyMarty
//  ColorViewController class, which is responsible for displaying a list of colors and playing sounds when the user selects a color.
//  Created by Yukun Chen on 2023-04-17.
//

import UIKit

class ColorViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    // Define instances of Color
    let black : Color = .init()
    let brown : Color = .init()
    let green : Color = .init()
    let pink : Color = .init()
    let purple : Color = .init()
    let red : Color = .init()
    let white : Color = .init()
    let yellow : Color = .init()
    
    // Define an array of Color objects
    var colorset:[Color] = []
    
    // Set the properties of each Color object
    func getColor(){
        black.initWithData(color: "Black")
        brown.initWithData(color: "Brown")
        green.initWithData(color: "Green")
        pink.initWithData(color: "Pink")
        purple.initWithData(color: "Purple")
        red.initWithData(color: "Red")
        white.initWithData(color: "White")
        yellow.initWithData(color: "Yellow")
        
        colorset =  [black,brown,green,pink,purple,red,white, yellow]
    }
    
    // Called after the controller's view is loaded into memory
    override func viewDidLoad() {
        getColor()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Return the number of rows in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorset.count
    }

    // Set the height for each row in the table
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }

    // Set the height for each row in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Set the background color of the table
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "Kids_App-01.png")!)
        
        // Set the background color of the table
        let tableCell : SiteCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell ?? SiteCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")

        // Set the background color of the table
        let rowNum = indexPath.row
        let alph = "\(colorset[rowNum].color ?? "")"

        tableCell.primaryLabel.text =  alph

        tableCell.myImageView.image = UIImage(named: alph + ".png")
        tableCell.accessoryType = .disclosureIndicator

        // Return the cell
        return tableCell

    }


    // define the table method for clicking on a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // in AppDelegate define a string called selectedURL
        let rowNum = indexPath.row
        let a = colorset[rowNum].color!
        
        
        
        SoundManager.shared.playSound(forResource: a, ofType: "mp3")
        
        let alertController = UIAlertController(title: "Playing sound for ", message: a, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }

}
