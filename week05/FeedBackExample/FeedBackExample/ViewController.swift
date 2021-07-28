//
//  ViewController.swift
//  FeedBackExample
//
//  Created by Ha Neul Iee on 2021/07/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonDidClicked(_ sender: Any) {
        let impact = UIImpactFeedbackGenerator()
        impact.impactOccurred()
    }

    @IBAction func buttonDidClicked2(_ sender: Any) {
        let impact = UISelectionFeedbackGenerator()
        impact.selectionChanged()
    }
    
    @IBAction func buttonDidClicked3(_ sender: Any) {
        //notification 은 한 번만 선언해도 됨!
        let noti = UINotificationFeedbackGenerator()

        //액션의 결과에 따라 각각 성공, 에러, 주의를 위한 진동
        noti.notificationOccurred(.success) // 성공
        noti.notificationOccurred(.error)   // 에러
        noti.notificationOccurred(.warning) // 주의
    }
    
    

}

