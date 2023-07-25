//
//  NutzerViewController.swift
//  Wild
//
//  Created by Tobias Schillinger on 28.08.19.
//  Copyright © 2019 Tobias Schillinger. All rights reserved.
//

import UIKit
import CoreBluetooth
//var BLE = Blue()


extension UIViewController {
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}


class TestmodeViewController: UIViewController, UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate {

    
    var Name = ""
    var BCscanner = ""
 
    
    @IBOutlet weak var Scanner: UITextField!
    
    @IBOutlet weak var ScannerDrop: UIPickerView!
    
    @IBOutlet weak var ScannerTest: UIButton!
    @IBOutlet weak var UpdateScanner: UIButton!
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 40
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let countrows : Int = global.barcodescanner.count

        return countrows
    }
    

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            let titleRow = global.barcodescanner[row]
            return titleRow
        
        
      
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         self.view.endEditing(true)

            if global.barcodescanner.isEmpty{
                
            }else{
                self.Scanner.text = global.barcodescanner[row]
                self.ScannerDrop.isHidden = false
            }

        
    }

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.view.endEditing(true)
        if (textField == self.Scanner)
        {
            self.ScannerDrop.isHidden = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(global.barcodescanner.count > 0)
        {
            Scanner.text = global.barcodescanner[0]
        }else{
            Scanner.text = "No Scanner available!"
        }
        
         //DB.WakeUp()
   
        BLE.centralManager.stopScan()

        NotificationCenter.default.addObserver(self, selector: #selector(Disconnected), name: NSNotification.Name(rawValue: "Disconnect"), object: nil)

        let purple1 = UIColor.lightGray // 1.0 alpha
        let semi1 = purple1.withAlphaComponent(0.7)
        self.view.backgroundColor = semi1
       
    }

    @IBAction func Close(_ sender: Any) {
        removeAnimate()
        
    }
    
    
    @IBAction func UpdateScanner(_ sender: UIButton) {

        sender.press(completion:{ finish in
        })
        BLE.centralManager.scanForPeripherals(withServices: [BLE.ScannerIDs])
        self.ScannerDrop.reloadAllComponents()
        ScannerDrop.reloadAllComponents()
    }
    
    @IBAction func ScannerTest(_ sender: Any) {
        
        if(status == "Programmingmode"){
        BCscanner = String(Scanner.text ?? "")
        if BCscanner == " NT-1" && global.ScannerChoosen == "NT-1"{
            global.ScanningAllowed1 = true
            removeAnimate()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Programmstart"), object: nil)
            
        }
        else if BCscanner == " NT-2" && global.ScannerChoosen == "NT-2"{
            global.ScanningAllowed2 = true
            print(global.ScanningAllowed2)
            removeAnimate()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Programmstart"), object: nil)
            
            
        }
        else if BCscanner == " NT-3" && global.ScannerChoosen == "NT-3"{
            global.ScanningAllowed3 = true
            removeAnimate()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Programmstart"), object: nil)
            
        }
        else if BCscanner == " NT-4" && global.ScannerChoosen == "NT-4"{
            global.ScanningAllowed4 = true
            removeAnimate()
            global.ScannerChoosen = "NT-4"
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Programmstart"), object: nil)
            
            
        }else{
            showAlertWithDistructiveButton()
        }
    }else if(status == "Testmode")
    {
        BCscanner = String(Scanner.text ?? "")
        if BCscanner == " NT-1"{
            global.ScannerChoosen = "NT-1"
            global.ScanningAllowed1 = true
            removeAnimate()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TestStart"), object: nil)
            
        }
        else if BCscanner == " NT-2"{
            global.ScannerChoosen = "NT-2"
            global.ScanningAllowed2 = true
            print(global.ScanningAllowed2)
            removeAnimate()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TestStart"), object: nil)
            
            
        }
        else if BCscanner == " NT-3"{
            global.ScannerChoosen = "NT-3"
            global.ScanningAllowed3 = true
            removeAnimate()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TestStart"), object: nil)
            
        }
        else if BCscanner == " NT-4"{
            global.ScannerChoosen = "NT-4"
            global.ScanningAllowed4 = true
            removeAnimate()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TestStart"), object: nil)
            
            
        }
    }
    }
    func showAlertWithDistructiveButton() {
        let text = "Bitte verbinden Sie den gerade eingerichteten Scanner: " + global.ScannerChoosen
        let alert = UIAlertController(title: "Falscher Scanner ausgewählt.", message: text, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Verstanden", style: UIAlertAction.Style.default, handler: { _ in
            
        }))

        self.present(alert, animated: true, completion: nil)
    }
    @objc func Disconnected(notification: NSNotification){
        ScannerDrop.reloadAllComponents()
        ScannerDrop.reloadInputViews()
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
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
