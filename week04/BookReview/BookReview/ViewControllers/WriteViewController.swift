//
//  WriteViewController.swift
//  BookReview
//
//  Created by Ha Neul Iee on 2021/07/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class WriteViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var reviewTextField: UITextField!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickedDoneButton(_ sender: Any) {
        let title = titleTextField.text ?? ""
        let author = authorTextField.text ?? ""
        let review = reviewTextField.text ?? ""
        
        if title.count == 0 || author.count == 0 || review.count == 0 {
            let alert = UIAlertController(title: "책리뷰", message: "모두 입력해주세요!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let parameters = [
            "title_give": title,
            "author_give": author,
            "review_give": review
        ]
        
        AF.request("http://spartacodingclub.shop/review", method: .post, parameters: parameters).responseJSON { (response) in
            if let value = response.value {
                let json = JSON(value)
                print(json)
                
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
