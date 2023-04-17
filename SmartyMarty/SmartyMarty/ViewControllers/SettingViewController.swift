//
//  SettingViewController.swift
//  SmartyMarty
//
//  Created by Leo on 2023-04-08.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet var slVolume : UISlider!
    @IBOutlet var lbVolume : UILabel!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func sliderValueChanged(sender : UISlider){
        
        updateVolume()
    }
    
    func updateVolume(){
        let Volume = slVolume.value
        let strVolume = String(format: " %.0f",Volume)
        lbVolume.text = strVolume
        appDelegate.volume = Int(slVolume.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateVolume()
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
