//
//  ViewController.swift
//  ramenTimer
//
//  Created by Ha Neul Iee on 2021/06/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var secondsLeft: Int = 180
    var timer: Timer?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerButton.layer.cornerRadius = 10
        self.secondsLeft = 180
        self.updateTimerLabel()
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
        timerButton.setTitle("타이머 시작하기", for: UIControl.State.normal)
    }
    
    func updateTimerLabel() {
        let minutes = self.secondsLeft / 60
        let seconds = self.secondsLeft % 60
        
        if self.secondsLeft < 10 {
            self.timerLabel.textColor = UIColor.red
        }
        else {
            self.timerLabel.textColor = .black
        }
        
        UIView.transition(with: self.timerLabel, duration: 0.3, options: .transition) {
            if self.secondsLeft > 0 {
                self.timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
            }
            else {
                self.timerLabel.text = "시간 끝!"
            }
        } completion: { Bool in
            
        
        }
    }

    @IBAction func timerButtonClicked(_ sender: Any) {
        
        if timer != nil {
            resetTimer()
            return
        }
        
        self.timerButton.setTitle("타이머 종료하기", for: .normal)
        self.secondsLeft = 180 + self.segmentControl.selectedSegmentIndex * 60
        self.updateTimerLabel()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { t in
            self.secondsLeft -= 1
            self.updateTimerLabel()
            
            if self.secondsLeft == 0 {
                self.resetTimer()
            }
        }
    }
    
    @IBAction func valueChangedSegmentControl(_ sender: Any) {
        self.resetTimer()
        self.secondsLeft = 180 + self.segmentControl.selectedSegmentIndex * 60
        self.updateTimerLabel()
    }
}

