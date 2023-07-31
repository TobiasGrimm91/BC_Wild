//
//  TestmodePopController.swift
//  Wild
//
//  Created by Tobias Schillinger on 24.07.23.
//  Copyright © 2023 Tobias Schillinger. All rights reserved.
//

import UIKit
import AVFoundation
import RSBarcodes_Swift

var Testresult = 0

class TestmodePopController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        BLE.centralManager.stopScan()
        //ScannerLabel.setTitle(global.ScannerChoosen, for: .normal)
        global.Progammingstate = 0
        Testresult = 0
        ProgrammingStatemachine(state: global.Progammingstate)
        //genBarcode(ean: "$POWER#OFF", BCView: barcodeView1)
        let purple1 = UIColor.lightGray // 1.0 alpha
        let semi1 = purple1.withAlphaComponent(0.7)
        self.view.backgroundColor = semi1
        NotificationCenter.default.addObserver(self, selector: #selector(ScanningDone), name: NSNotification.Name(rawValue: "Scanned"), object: nil)
       
    }
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            NotificationCenter.default.removeObserver(self, name: Notification.Name("Scanned"), object: nil)
          
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
    
    @IBOutlet weak var Text1: UIButton!
    @IBOutlet weak var Text2: UIButton!
    @IBOutlet weak var StepLabel: UIButton!
    @IBOutlet weak var ProgrammDescriptionLabel: UIButton!
    @IBOutlet weak var ScannerLabel: UIButton!
  
   
    @IBOutlet weak var Continue: UIButton!
    @IBOutlet weak var Back: UIButton!
    /// Outlets
    @IBOutlet weak var barcodeView: UIImageView!
    

    @IBAction func Continue(_ sender: Any) {
        
            global.Progammingstate = global.Progammingstate+1
            ProgrammingStatemachine(state: global.Progammingstate)
      
        
        

//        genBarcode(ean: "$POWER#OFF", BCView: barcodeView)
//        genBarcode(ean: "%BAT_VOL#", BCView: barcodeView)
    }
    
    /// Actions
    @IBAction func Back(_ sender: Any) {
        global.Progammingstate = 0
        global.ScanningAllowed1 = false
        global.ScanningAllowed2 = false
        global.ScanningAllowed3 = false
        global.ScanningAllowed4 = false
        global.ProduktArray1.removeAll()
        global.ProduktArray2.removeAll()
        global.ProduktArray3.removeAll()
        global.ProduktArray4.removeAll()
        removeAnimate()

    }
    @objc func ScanningDone(notification: NSNotification){
        print("Scan done")
        var produkte: [Products] = []
        if global.ScannerChoosen == "NT-1"{
            produkte = global.ProduktArray1
        }
        if global.ScannerChoosen == "NT-2"{
            produkte = global.ProduktArray2
        }
        if global.ScannerChoosen == "NT-3"{
            produkte = global.ProduktArray3
        }
        if global.ScannerChoosen == "NT-4"{
            produkte = global.ProduktArray4
        }
    
        
        
        if(produkte.count > 0 && global.Barcodes.count > 0)
        {
            if(produkte[0].EAN == global.Barcodes[0].EAN)
            {
                global.Progammingstate = 0
                global.ProduktArray1.removeAll()
                global.ProduktArray2.removeAll()
                global.ProduktArray3.removeAll()
                global.ProduktArray4.removeAll()
                Text1.isHidden = false
                ProgrammDescriptionLabel.setTitle(" > Scannertest erfolgreich!", for: .normal)
                let text = " > EAN-13 Testcode: 4260283487998 \n > Scanergebnis: " + produkte[0].EAN
                Text1.setTitle(text, for: .normal)
                Continue.setTitle("Weiter", for: .normal)
                Continue.isEnabled = true
                Continue.backgroundColor = .systemGreen
                Testresult = 1
            }else{
                global.Progammingstate = 0
                global.ProduktArray1.removeAll()
                global.ProduktArray2.removeAll()
                global.ProduktArray3.removeAll()
                global.ProduktArray4.removeAll()
                Text1.isHidden = false
                ProgrammDescriptionLabel.setTitle(" > Scannertest fehlgeschlagen", for: .normal)
                let text = " > EAN-13 Testcode: 4260283487998 \n > Scanergebnis: " + produkte[0].EAN
                Text1.setTitle(text, for: .normal)
                Continue.setTitle("Beenden", for: .normal)
                Continue.backgroundColor = .systemRed
                Continue.isEnabled = true
                Testresult = 2
            }
        }

    }
    
    /// Programming State machine
    ///
    func ProgrammingStatemachine(state: Int){
        switch(state){
        case -1:
            removeAnimate()
            global.Progammingstate = 0
            global.ScanningAllowed1 = false
            global.ScanningAllowed2 = false
            global.ScanningAllowed3 = false
            global.ScanningAllowed4 = false
            break
            //Scanner an und grün?
        case 0:
            Continue.setTitle("Funktion nicht verifiziert", for: .normal)
            Continue.backgroundColor = .systemRed
            Continue.isEnabled = false
            ScannerLabel.setTitle(global.ScannerChoosen, for: .normal)
            StepLabel.setTitle(" Scanner Funktionstest", for: .normal)
            Back.setTitle("X", for: .normal)
            Continue.setTitle("Weiter", for: .normal)
            print(global.ScannerChoosen)
            Text1.isHidden = false
            Text1.setTitle("> EAN-13 Testcode: 4260283487998", for: .normal)
            ScannerLabel.setTitle(global.ScannerChoosen, for: .normal)
            ProgrammDescriptionLabel.setTitle(" Bitte scannen Sie den Testbarcode:", for: .normal)
            //genBarcode(ean: "4260283487998", BCView: barcodeView)
            genBarcode(ean: "4260283487998", BCView: barcodeView) // working via Bluethooth
           
            break
        case 1:
            if(Testresult == 1)
            {
                StepLabel.setTitle("Scanner ausschalten", for: .normal)
                Back.setTitle("X", for: .normal)
                Continue.backgroundColor = .systemGreen
                Continue.setTitle("Beenden", for: .normal)
                ScannerLabel.setTitle(global.ScannerChoosen, for: .normal)
                ProgrammDescriptionLabel.setTitle("Scanner ausschalten:", for: .normal)
                Text1.isHidden = false
                let text = " > Scanner-Funktionstest war erfolgreich! \n > Ist das Label: " + global.ScannerChoosen + " aufgeklebt?"
                Text1.setTitle(text, for: .normal)
                barcodeView.isHidden = false
                genBarcode(ean: "$POWER#OFF", BCView: barcodeView)
                
            }else if(Testresult == 2)
            {
                StepLabel.setTitle("Scanner zurücksetzen", for: .normal)
                Back.setTitle("X", for: .normal)
                Continue.backgroundColor = .systemRed
                Continue.setTitle("Beenden", for: .normal)
                ScannerLabel.setTitle(global.ScannerChoosen, for: .normal)
                ProgrammDescriptionLabel.setTitle("Scanner zurücksetzen:", for: .normal)
                Text1.isHidden = false
                Text1.setTitle(" > Scannertest ist fehlgeschlagen \n bitte setzen Sie den Scanner zurück und beginnen die Einrichtung von vorne.", for: .normal)
                barcodeView.isHidden = false
                genBarcode(ean: "000B0", BCView: barcodeView)
                
            }
 // working via Bluethooth
            break
        case 2:
            removeAnimate()
            global.Progammingstate = 0
            Testresult = 0
            global.ScanningAllowed1 = false
            global.ScanningAllowed2 = false
            global.ScanningAllowed3 = false
            global.ScanningAllowed4 = false
            break

        default: break
        }
        
    }
    
    
    
    
    /// Functions
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
