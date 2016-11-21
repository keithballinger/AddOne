//
//  MainViewController.swift
//  AddOne
//
//  Created by Keith Ballinger on 10/28/16.
//  Copyright © 2016 Keith Ballinger. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {

    @IBOutlet weak var numbersLabel:UILabel?
    @IBOutlet weak var scoreLabel:UILabel?
    @IBOutlet weak var inputField:UITextField?
    
    var score:Int = 0
    
    var hud:MBPro?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setRandomNumberLabel()
        updateScoreLabel()
        
        if(inputField != nil)
        {
            inputField!.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        }
    }
    
    func textFieldDidChange(textField:UITextField)
    {
        if(inputField?.text?.characters.count < 4)
        {
            return
        }
        
        let numbers:Int? = Int(numbersLabel!.text!)
        let input:Int? = Int(inputField!.text!)
        
        if( numbers != nil && input != nil)
        {
            print("Comparing: \(inputField!.text) minus \(numbersLabel!.text!) == \(input! - numbers!)")
            
            if(input! - numbers! == 1111)
            {
                print("Correct")
                
                score++
            }
            else
            {
                print("Incorrect")
                score--
            }
        }
        
        setRandomNumberLabel()
        updateScoreLabel()
        
        inputField!.text = "";
        
    }
    
    func updateScoreLabel()
    {
        if(scoreLabel != nil)
        {
            scoreLabel!.text = "\(score)"
        }
    }
    
    func setRandomNumberLabel()
    {
        if(numbersLabel != nil)
        {
            numbersLabel!.text = generateRandomNumber()
        }
    }
    
    func generateRandomNumber() -> String
    {
        var result:String = ""
        
        for _ in 1...4
        {
            var digit:Int = Int(arc4random_uniform(8) + 1)
            
            result += "\(digit)"
        }
        
        return result
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
