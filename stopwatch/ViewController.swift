//
//  ViewController.swift
//  stopwatch
//
//  Created by Hikari Hara on 2015/05/08.
//  Copyright (c) 2015年 HikariHara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label:UILabel!
    @IBOutlet var hanteiLabel:UILabel!
    
    var number:Float = 0.0
    var timer: NSTimer = NSTimer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func start(){
        hanteiLabel.text = ""
        if !timer.valid {
             timer = NSTimer.scheduledTimerWithTimeInterval(
                0.01,
                target: self,
                selector: Selector("up"),
                userInfo: nil,
                repeats: true)
        }
        
        
    }
    
    @IBAction func stop(){
        if timer.valid{
            timer.invalidate()
            label.text = String(format: "%.2f",number)
        }
        self.hantei()
    }
    
    @IBAction func reset(){
        number = 0.0
        label.text = String(format: "%.2f",number)
        hanteiLabel.text = ""
        if timer.valid{
        timer.invalidate()
        }
    }

    
    func up(){
        number = number + 0.01
        label.text = String(format: "%.2f",number)
        
        if number > 4.5{
            label.text = ""
        }
        
//        Float型はInt型とはString型に変換する方法が違います。 今回は小数点以下2桁まで表示させたいので
//        String(format: “%.2f”,count) としましょう。
//        %.2fにcountの小数点以下2桁が入ります。
    }
    
    func hantei(){
        if number >= 9.5 && number <= 10.5 {
        hanteiLabel.text = "lol"
        if number >= 9.7 && number <= 10.3 {
        hanteiLabel.text = "haha"
        if number >= 9.8 && number <= 10.2 {
        hanteiLabel.text = "oh"
            if number == 10 {
                hanteiLabel.text = "tensai!"
            }
            }
        }
    }else{
        hanteiLabel.text = "boooo"
        }
    }
    


}


