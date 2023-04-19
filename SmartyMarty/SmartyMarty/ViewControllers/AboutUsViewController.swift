//
//  AboutUsViewController.swift
//  SmartyMarty
//
//  Created by Yukun     on 2023-04-08.
//  Purpose: This view controller displays information about the developers of the SmartyMarty app, as well as its features and purpose.
//

import UIKit

class AboutUsViewController: UIViewController {
    @IBOutlet var infor : UILabel!
    @IBOutlet var feature : UILabel!
    @IBOutlet var purpose : UILabel!
    
    // This function is an unwind segue that returns to the AboutUsViewController from another view controller.
    @IBAction func unwindToAboutUsViewController(sender : UIStoryboardSegue){
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Sets the text for the "infor" UILabel.
        infor.text = "Builded by Yukun Chen, Kirill Afanasiev, Ziang Wang and Furkan Gonul"
        
        // Sets the text for the "feature" UILabel.
        feature.text = "The purpose of this iOS application is to provide a fun and interactive educational tool for children to learn important concepts such as the alphabet, numbers, cars, vegetables, shapes, colors, and animal recognition with animal sounds. Beside animal sounds audio will be available for each object when the user clicks on it."
        
        // Sets the text for the "purpose" UILabel.
        purpose.text = "The application will feature multiple quizzes to reinforce learning and engage children in a playful manner. Additionally, the app will showcase animal pictures and their corresponding sounds to help children learn about different animals and their habitats. "
        // Do any additional setup after loading the view.
    }

}

