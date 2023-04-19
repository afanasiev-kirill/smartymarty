//
//  ShapesViewController.swift
//  SmartyMarty
//
//  Created by Yukun Chen on 2023-04-10.
//  This view controller manages the display of different shapes in a table view. When a cell is tapped, the corresponding shape's sound is played and an alert is shown indicating the shape whose sound is playing. The table view is populated with pre-defined shapes, which are stored in an array of Shape objects.
//

import UIKit

class ShapesViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    // Initialize shapes as empty Shape objects
    let square : Shape = .init()
    let rectangle : Shape = .init()
    let diamond : Shape = .init()
    let triangle : Shape = .init()
    let circle : Shape = .init()
    let star : Shape = .init()
    let oval : Shape = .init()
    
    // Create an empty array to hold the shapes
    var shapeset:[Shape] = []
    
    // Initialize the shapes with data and add them to the shapeset array
    func getShape(){
        square.initWithData(shape: "Square")
        rectangle.initWithData(shape: "Rectangle")
        diamond.initWithData(shape: "Diamond")
        triangle.initWithData(shape: "Triangle")
        circle.initWithData(shape: "Circle")
        star.initWithData(shape: "Star")
        oval.initWithData(shape: "Oval")
        
        shapeset =  [square,rectangle,diamond,triangle,circle,star,oval]
    }
    
    // This method is called after the view controller has loaded its view hierarchy into memory
    override func viewDidLoad() {
        // Call getShape() to initialize the shapes
        getShape()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // This method returns the number of rows in the shapeset array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shapeset.count
    }

    // This method sets the height for each row in the table
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }

    // This method sets the content of each cell in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Set the background color of the table view
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "Kids_App-01.png")!)
        
        // Create a reusable table cell object
        let tableCell : SiteCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell ?? SiteCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")

        // Get the corresponding shape object for this row
        let rowNum = indexPath.row
        let alph = "\(shapeset[rowNum].shape ?? "")"
        
        // Set the text and image of the table cell
        tableCell.primaryLabel.text =  alph
        tableCell.myImageView.image = UIImage(named: alph + ".png")
        tableCell.accessoryType = .disclosureIndicator

        // Return the table cell
        return tableCell

    }
    
    // This method is called when a row in the table is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Get the corresponding shape object for this row
        let rowNum = indexPath.row
        let a = shapeset[rowNum].shape!
        
        // Play the sound associated with the shape using SoundManager
        print(a)
        SoundManager.shared.playSound(forResource: a, ofType: "mp3")
        
        // Display an alert indicating the shape that is currently playing
        let alertController = UIAlertController(title: "Playing sound for ", message: a, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
}
