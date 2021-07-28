//
//  FingerGameView.swift
//  FingerGame
//
//  Created by Ha Neul Iee on 2021/07/28.
//

import UIKit

class FingerGameView: UIView {
    
    // 약한 참조: view에 연결해줄 Controller
    weak var controller: FingerGameViewController?
    
    var touchToRoundView: [UITouch: UIView] = [:]
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // touch는 5개까지 multi touch를 지원한다.
        for touch in touches {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
            view.center = touch.location(in: self)
            view.backgroundColor = UIColor(named: "red")
            
            // width와 height를 같게하고 cornerRadius를 40으로 하면 원이 만들어진다.
            view.layer.cornerRadius = 40
            
            self.touchToRoundView[touch] = view
            self.addSubview(view)
            
            self.controller?.touchCountDidChange()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let view = self.touchToRoundView[touch]
            view?.center = touch.location(in: self)
        }
    }
    
    // 정상적으로 끝난 경우
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let view = self.touchToRoundView[touch]
            
            view?.removeFromSuperview()
            self.touchToRoundView.removeValue(forKey: touch)
            
            self.controller?.touchCountDidChange()
        }
    }
    
    // 비정상적으로 끝난 경우
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let view = self.touchToRoundView[touch]
            
            view?.removeFromSuperview()
            self.touchToRoundView.removeValue(forKey: touch)
            
            self.controller?.touchCountDidChange()
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
