//
//  ViewController.swift
//  Test
//
//  Created by h on 2022/06/17.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let vd = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        
        vd.modalTransitionStyle = .coverVertical
        vd.delegate = self
        self.present(vd , animated: true, completion: nil)
    }

}

extension FirstViewController : ChangeUIDelegate {
    func changeUI() {
        self.textLabel.text = "UI변경"
        self.view.backgroundColor = .systemFill
    }
}
