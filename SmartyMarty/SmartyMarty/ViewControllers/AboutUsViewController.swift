//
//  AboutUsViewController.swift
//  SmartyMarty
//
//  Created by Leo on 2023-04-08.
//

import UIKit

class AboutUsViewController: UIViewController {
    @IBOutlet var infor : UILabel!
    @IBOutlet var feature : UILabel!
    @IBOutlet var purpose : UILabel!
    
    @IBAction func unwindToAboutUsViewController(sender : UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        infor.text = "Builded by Yukun Chen, Kirill Afanasiev, Ziang Wang and Furkan Gonul"
        feature.text = "The purpose of this iOS application is to provide a fun and interactive educational tool for children to learn important concepts such as the alphabet, numbers, cars, vegetables, shapes, colors, and animal recognition with animal sounds. Beside animal sounds audio will be available for each object when the user clicks on it."
        purpose.text = "The application will feature multiple quizzes to reinforce learning and engage children in a playful manner. Additionally, the app will showcase animal pictures and their corresponding sounds to help children learn about different animals and their habitats. "
        // Do any additional setup after loading the view.
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
