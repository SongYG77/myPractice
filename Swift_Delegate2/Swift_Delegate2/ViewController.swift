//
//  ViewController.swift
//  Swift_Delegate2
//
//  Created by h on 2022/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectedResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didAlert(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요,", preferredStyle: .alert)
        let option1 = UIAlertAction(title: "선택A", style: UIAlertAction.Style.default, handler: nil)
        let option2 = UIAlertAction(title: "선택B", style: UIAlertAction.Style.default, handler: nil)
        let option3 = UIAlertAction(title: "선택C", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(option1)
        alert.addAction(option2)
        alert.addAction(option3)    
        
    }
    
}

