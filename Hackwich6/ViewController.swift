//
//  ViewController.swift
//  Hackwich6
//
//  Created by Kevin Bechayda on 3/5/18.
//  Copyright © 2018 Kevin Bechayda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slider: UISlider!
    // create a variable that can hold the value of the slider
    var currentValue: Int = 0
    
    // Set targetValue to a randomly generated number at the arc4random_uniform function
    // (DELETED) var targetValue: Int = 1 + Int(arc4random_uniform(100))
    
    // create a varibale that will hold our target value
    var targetValue = 0
    
    @IBOutlet var targetLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Set currentValue to e intitial alue of the slider
        currentValue = lroundf(slider.value)
    
        // Call startNewRound
        startNewRound()

        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
    }
    
    //create a new function that displays the targetValue in the targetValue
    func updatedTargetLabel(){
        targetLabel.text = String(targetValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sliderHasMoved(_ sender: Any) {
        
        print("The value of the slider is:\(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func myGuessButtonPressed(_ sender: Any) {
        //5. New variable message that displays a message that includes currentValue
        let message = "The value is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        
       //1. create alert view
        let alert = UIAlertController(title:"Hello World!", message: message, preferredStyle: .alert)
        
        //2. button that user taps to dismiss view controller
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        //3. add the button to the alertview
        alert.addAction(action)
        
        //4. present alertview on the screen
        present(alert, animated: true, completion: nil)
    
        startNewRound()
  
    }
    
    func startNewRound() {
            
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
       
        updatedTargetLabel()


}
}
