//
//  FingerGameViewController.swift
//  FingerGame
//
//  Created by Ha Neul Iee on 2021/07/28.
//

import UIKit
import Firebase

class FingerGameViewController: UIViewController {

    // UIView -> FingerGameView
    @IBOutlet weak var gameView: FingerGameView!
    @IBOutlet weak var secondsLabel: UILabel!
    
    var secondLeft = 5
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // controller와 연결
        gameView.controller = self

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
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func touchCountDidChange () {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (t) in
            
            let count = self.gameView.touchToRoundView.count
            let randomChoice = Int.random(in: 0..<count)
            
            let roundViews = [UIView](self.gameView.touchToRoundView.values)
            
            for i in 0..<count {
        
                let roundView = roundViews[i]
                if i == randomChoice {
                    UIView.animate(withDuration: 1) {

                    roundView.backgroundColor = UIColor(named: "green")
                        
                        
                    // 크기 변화
                    let center = roundView.center
                    roundView.frame.size = CGSize(width: 120, height: 120)
                    roundView.layer.cornerRadius = 60
                    roundView.center = center
                    }
                }
            }
        }
        
        resetSecondsTimer()
    }
    
    
    // Timer 분리
    var secondsTimer: Timer!
    
    func resetSecondsTimer() {
        secondsTimer?.invalidate()
        
        if gameView.touchToRoundView.count <= 0 {
            self.secondsLabel.text = ""
            return
        }
        
        self.secondLeft = 5
        self.secondsLabel.text = "5"
        
        self.blickSecondsLabel()
        
        secondsTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
            self.secondLeft -= 1
            self.secondsLabel.text = "\(self.secondLeft)"
            
            self.blickSecondsLabel()
            
            if self.secondLeft == 0 {
                self.secondsLabel.text = ""
                self.secondsTimer.invalidate()
                
                self.blickSecondsLabel()
            }
        })
    }
    
    func blickSecondsLabel() {
        self.secondsLabel.alpha = 1
        
        UIView.animate(withDuration: 0.5) {
            self.secondsLabel.alpha = 0
        }
    }
    
}
