//
//  LoginViewController.swift
//  Wild
//
//  Created by Tobias Schillinger on 18.12.18.
//  Copyright © 2018 Tobias Schillinger. All rights reserved.
//

import UIKit
import CoreBluetooth
import CoreGraphics
import AVFoundation
import RSBarcodes_Swift
var status = ""

extension UIButton {
   func press(completion:@escaping ((Bool) -> Void)) {
            UIView.animate(withDuration: 0.05, animations: {
                self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8) }, completion: { (finish: Bool) in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.transform = CGAffineTransform.identity
                        completion(finish)
                    })
            })
    }
    
    
}


class HauptViewController: UIViewController {
    
    

    @IBOutlet var Testmode: UIButton!
    @IBOutlet weak var Programming: UIButton!
 
    @IBOutlet weak var barcodeView: UIImageView!
    @IBOutlet weak var barcodeView1: UIImageView!
    
    
    @IBAction func Testmode(_ sender: UIButton) {
        sender.press(completion:{ finish in
               })
        let PopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Tetsmode") as! TestmodeViewController
                self.addChild(PopOverVC)
                PopOverVC.view.frame = self.view.frame
                self.view.addSubview(PopOverVC.view)
                PopOverVC.didMove(toParent: self)
         //performSegue(withIdentifier: "ToTestmode", sender: self)
        status = "Testmode"

    }

    @IBAction func Programming(_ sender: UIButton) {
        
        sender.press(completion:{ finish in
        })
        
         //performSegue(withIdentifier: "ToTestmode", sender: self)
        status = "Programmingmode"
    }
    
    
    @IBAction func Hilfe(_ sender: UIButton) {
        sender.press(completion:{ finish in
               })
        let PopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HilfePop") as! HilfeViewController
                self.addChild(PopOverVC)
                PopOverVC.view.frame = self.view.frame
                self.view.addSubview(PopOverVC.view)
                PopOverVC.didMove(toParent: self)
        status = "Hilfe"
    }
    

    override func viewDidAppear(_ animated: Bool) {

    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        genBarcode(ean: "$POWER#OFF", BCView: barcodeView)
        genBarcode(ean: "000B0", BCView: barcodeView1)
//        let purple1 = UIColor.lightGray // 1.0 alpha
//        let semi1 = purple1.withAlphaComponent(0.7)
//        self.view.backgroundColor = semi1
        NotificationCenter.default.addObserver(self, selector: #selector(TestStart), name: NSNotification.Name(rawValue: "TestStart"), object: nil)
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    @objc func TestStart(notification: NSNotification){
        
        let PopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Testing") as! TestmodePopController
                self.addChild(PopOverVC)
                PopOverVC.view.frame = self.view.frame
                self.view.addSubview(PopOverVC.view)
                PopOverVC.didMove(toParent: self)
        status = "TestStart"
    }
   override func viewWillAppear(_ animated: Bool) {

    }
    func genBarcode(ean: String, BCView: UIImageView) {
        
        // Check if barcode is valid ean13
        let isValidEan13 = RSUnifiedCodeValidator.shared.isValid(ean, machineReadableCodeObjectType: AVMetadataObject.ObjectType.ean13.rawValue)
        
        if isValidEan13 {
            if let image = RSUnifiedCodeGenerator.shared.generateCode(ean, machineReadableCodeObjectType: AVMetadataObject.ObjectType.ean13.rawValue){
                BCView.image = image
                BCView.layer.borderWidth = 0
            }
        }
        else {
            // Check if barcode is valid code128
            let isValidCode128 = RSUnifiedCodeValidator.shared.isValid(ean, machineReadableCodeObjectType: AVMetadataObject.ObjectType.code128.rawValue)
            
            if isValidCode128 {
                if let image = RSUnifiedCodeGenerator.shared.generateCode(ean, machineReadableCodeObjectType: AVMetadataObject.ObjectType.code128.rawValue){
                    BCView.image = image
                    BCView.layer.borderWidth = 0
                    }
            }
            else {
                    print("Barcode '\(ean)' is not valid for EAN13, Code128!")
            }
        }
    }

}

