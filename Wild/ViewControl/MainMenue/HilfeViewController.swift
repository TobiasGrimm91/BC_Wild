//
//  HilfeViewController.swift
//  Wild
//
//  Created by Tobias Schillinger on 04.11.19.
//  Copyright © 2019 Tobias Schillinger. All rights reserved.
//

import UIKit

class HilfeViewController: UIViewController {
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

    var breakUP = false

    @IBOutlet var Version: UILabel!
   
    @IBOutlet weak var back: UIButton!
  
    
    
  override func viewDidLoad() {
      super.viewDidLoad()

     
      //Background of main view
      let purple1 = UIColor.lightGray // 1.0 alpha
    let semi1 = purple1.withAlphaComponent(0.7)
      self.view.backgroundColor = semi1
    Version.text = appVersion
  
  }
    
    func removeAnimate(){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion: {(finished: Bool) in
            if (finished){
                self.view.removeFromSuperview()
            }
              
        });
        
    }
    
    
  @IBAction func Abbrechen(_ sender: Any) {
      self.removeAnimate()
   
  }
  
    
  
  func showAnimate(){

      self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
      self.view.alpha = 0.0;
      UIView.animate(withDuration: 0.25, animations: {
          self.view.alpha = 1.0
          self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
      });
  }
  


}
