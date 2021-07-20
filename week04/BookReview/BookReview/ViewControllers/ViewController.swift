//
//  ViewController.swift
//  BookReview
//
//  Created by Ha Neul Iee on 2021/07/19.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        AF.request("http://spartacodingclub.shop/review").responseString { (resp) in
            print(resp.value ?? "")
        }
        */
        
        // GET
        
        AF.request("http://spartacodingclub.shop/review").responseJSON { (response) in
            let json = JSON(response.value!)
            print(json["reviews"][2])
        }
        
        
        var parameters = [
            "title_give": "너무나도 쉬운 iOS 개발",
            "autor_give": "늘이",
            "review_give": "재밌어요!"
        ]
        
        AF.request("http://spartacodingclub.shop/review", method: .post, parameters: parameters).responseJSON { (response) in
            var json = JSON(response.value!)
            print(json)
        }
        
    }
    
    
}

