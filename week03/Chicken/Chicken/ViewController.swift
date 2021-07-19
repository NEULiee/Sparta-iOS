//
//  ViewController.swift
//  Chicken
//
//  Created by Ha Neul Iee on 2021/07/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func textFieldEditingChanged(_ sender: Any) {
        let text = textField.text ?? "1"
        stepper.value = Double(text) ?? 1
    }
    @IBAction func stepperValueChanged(_ sender: Any) {
        textField.text = String(Int(stepper.value))
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController = segue.destination as? ChickenOutputViewController else {
            return
        }
        nextViewController.people = Int(stepper.value)
    }
}

