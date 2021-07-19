//
//  ViewController.swift
//  FlashApp
//
//  Created by Ha Neul Iee on 2021/06/12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onButtonTouchUpInside(_ sender: Any) {
        view.backgroundColor = UIColor(red: 188 / 255.0, green: 177 / 255.0, blue: 166 / 255.0, alpha: 1)
        label.textColor = .black
        imageView.image = UIImage(systemName: "flashlight.on.fill")
    }
    
    @IBAction func offButtonTouchUpInside(_ sender: Any) {
        view.backgroundColor = UIColor.black
        label.textColor = .white
        imageView.image = UIImage(systemName: "flashlight.off.fill")
    }
}

