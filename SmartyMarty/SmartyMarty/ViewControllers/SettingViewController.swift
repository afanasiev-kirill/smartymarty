//
//  SettingViewController.swift
//  SmartyMarty
//
//  Created by Ziang Wang on 2023-04-08.
//  Description: This class defines the settings view controller that allows the user to control the application's volume through a slider. The class implements a UISlider object that controls the volume and displays it as a label. The view controller updates the volume value in the app delegate when the user changes it.

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet var slVolume : UISlider!
    @IBOutlet var lbVolume : UILabel!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //change volume when slider volume change
    @IBAction func sliderValueChanged(sender : UISlider){
        
        updateVolume()
    }
    //update volume and display the number of volume
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
