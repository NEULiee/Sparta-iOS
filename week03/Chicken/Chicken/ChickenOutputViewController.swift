//
//  ChickenOutputViewController.swift
//  Chicken
//
//  Created by Ha Neul Iee on 2021/07/18.
//

import UIKit

class ChickenOutputViewController: UIViewController {
    
    
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var chickenLabel: UILabel!
    
    var people: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.peopleLabel.text = "\(people)명이서\n먹는다면..."
        self.chickenLabel.text = "\(caculateChicken())마리를 시키거라"
        
    }
    
    func caculateChicken() -> Int {
        let peopleDivided = Double(people)/1.618
        let chicken = round(peopleDivided)

        return Int(chicken)

    }
    

}
