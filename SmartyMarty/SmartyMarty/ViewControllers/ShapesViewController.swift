//
//  ShapesViewController.swift
//  SmartyMarty
//
//  Created by Yukun Chen on 2023-04-17.
//

import UIKit

class ShapesViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    let square : Shape = .init()
    let rectangle : Shape = .init()
    let diamond : Shape = .init()
    let triangle : Shape = .init()
    let circle : Shape = .init()
    let star : Shape = .init()
    let oval : Shape = .init()
    
    var shapeset:[Shape] = []
    
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
    
    override func viewDidLoad() {
        getShape()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shapeset.count
    }

    // define table method for cell thickness
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }

    // define table method for how each cell should look
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "Kids_App-01.png")!)
        
        let tableCell : SiteCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell ?? SiteCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "cell")

        //populate the cell
        let rowNum = indexPath.row
        let alph = "\(shapeset[rowNum].shape ?? "")"
       // let imgName = UIImage(named:imageData[rowNum])

        tableCell.primaryLabel.text =  alph

        tableCell.myImageView.image = UIImage(named: alph + ".png")
        tableCell.accessoryType = .disclosureIndicator

        //return the cell
        return tableCell

    }


    // define the table method for clicking on a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // in AppDelegate define a string called selectedURL
        let rowNum = indexPath.row
        let a = shapeset[rowNum].shape!
        
        
        
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
