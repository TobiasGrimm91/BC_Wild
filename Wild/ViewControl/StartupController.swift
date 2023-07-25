//
//  ViewController.swift
//  Wild
//
//  Created by Tobias Schillinger on 18.12.18.
//  Copyright © 2018 Tobias Schillinger. All rights reserved.
//

import UIKit
// Globale Variablen
var global = Global()


extension UIViewController {
    func reloadViewFromNib() {
        let parent = view.superview
        view.removeFromSuperview()
        view = nil
        parent?.addSubview(view) // This line causes the view to be reloaded
    }
    
}



class StartupViewController: UIViewController {
    
    
  
    @IBOutlet weak var progress: UIActivityIndicatorView!
   
   
    
    override func viewDidAppear(_ animated: Bool) {
        global.ScanningAllowed1 = false
        global.ScanningAllowed2 = false
        global.ScanningAllowed3 = false
        global.ScanningAllowed4 = false
        global.Barcodes.append(EANs(EAN: "4260283487998", ProduktName: "Testprodukt", Preis: "", TankNr: "", Rubrik: ""))
        print("globalBCS")
        print(global.Barcodes[0].EAN)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        //let value = UIInterfaceOrientation.landscapeRight.rawValue
        //UIDevice.current.setValue(value, forKey: "orientation")
        progress.startAnimating()
        SegueSequence()
    }
    
    


    override func viewWillDisappear(_ animated: Bool) {
        progress.stopAnimating()
    }

    func SegueSequence(){
        //Release 3s
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
           self!.performSegue(withIdentifier: "toConnect", sender: self)
        }
    }
    
}

