//
//  ViewController.swift
//  arc
//
//  Created by Jaime_Andrade on 6/30/17.
//  Copyright © 2017 Jaime Andrade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func btnPushAction(_ sender: PushButtonView) {
        if sender.isAddButton{
            counterView.counter += 1
        }else{
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLabel.text = String(counterView.counter)
    }
   
    
}

