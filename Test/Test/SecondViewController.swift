//
//  SecondViewController.swift
//  Test
//
//  Created by h on 2022/06/17.
//

import UIKit

protocol ChangeUIDelegate : class {
    func changeUI()
}

class SecondViewController: UIViewController {

    
    weak var delegate : ChangeUIDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func clickButtonTapped(_ sender: UIButton) {
        self.delegate?.changeUI()
        self.dismiss(animated: true, completion:  nil)
    }
    
    

}
