//
//  ProgrammingViewController.swift
//  Wild
//
//  Created by Tobias Schillinger on 22.07.23.
//  Copyright © 2023 Tobias Schillinger. All rights reserved.
//

import UIKit

class ProgrammingViewController: UIViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @IBOutlet weak var NT_1: UIButton!
    
    @IBOutlet weak var NT_2: UIButton!
    
    @IBOutlet weak var NT_3: UIButton!
    
    @IBOutlet weak var NT_4: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ProgrammingDone), name: NSNotification.Name(rawValue: "ProgrammingDone"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(Programmstart), name: NSNotification.Name(rawValue: "Programmstart"), object: nil)
        let purple1 = UIColor.lightGray // 1.0 alpha
        let semi1 = purple1.withAlphaComponent(0.7)
        self.view.backgroundColor = semi1
        // Do any additional setup after loading the view.
    }
    @objc func Programmstart(notification: NSNotification){
        
        let PopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Testing") as! TestmodePopController
                self.addChild(PopOverVC)
                PopOverVC.view.frame = self.view.frame
                self.view.addSubview(PopOverVC.view)
                PopOverVC.didMove(toParent: self)
        status = "Programmstart"
    }
    @IBAction func NT_1(_ sender: UIButton) {
        global.ScannerChoosen = "NT-1"
        sender.press(completion:{ finish in
               })
        let PopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Programm") as! ProgrammingPopController
                self.addChild(PopOverVC)
                PopOverVC.view.frame = self.view.frame
                self.view.addSubview(PopOverVC.view)
                PopOverVC.didMove(toParent: self)
        

    }
    @IBAction func NT_2(_ sender: UIButton) {
        global.ScannerChoosen = "NT-2"
        
  
        sender.press(completion:{ finish in
               })
        let PopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Programm") as! ProgrammingPopController
                self.addChild(PopOverVC)
                PopOverVC.view.frame = self.view.frame
                self.view.addSubview(PopOverVC.view)
                PopOverVC.didMove(toParent: self)
        

    }
    @IBAction func NT_3(_ sender: UIButton) {
        global.ScannerChoosen = "NT-3"
        sender.press(completion:{ finish in
               })
        let PopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Programm") as! ProgrammingPopController
                self.addChild(PopOverVC)
                PopOverVC.view.frame = self.view.frame
                self.view.addSubview(PopOverVC.view)
                PopOverVC.didMove(toParent: self)
        

    }
    @IBAction func NT_4(_ sender: UIButton) {
        global.ScannerChoosen = "NT-4"
        sender.press(completion:{ finish in
               })
        let PopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Programm") as! ProgrammingPopController
                self.addChild(PopOverVC)
                PopOverVC.view.frame = self.view.frame
                self.view.addSubview(PopOverVC.view)
                PopOverVC.didMove(toParent: self)
        

    }
    @objc func ProgrammingDone(notification: NSNotification){
        global.Progammingstate = 0
        let PopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Tetsmode") as! TestmodeViewController
                self.addChild(PopOverVC)
                PopOverVC.view.frame = self.view.frame
                self.view.addSubview(PopOverVC.view)
                PopOverVC.didMove(toParent: self)
         //performSegue(withIdentifier: "ToTestmode", sender: self)
        //status = "Testmode"
    }


}
