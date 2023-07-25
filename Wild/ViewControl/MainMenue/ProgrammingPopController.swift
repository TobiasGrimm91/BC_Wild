//
//  SingleBCViewController.swift
//  Wild
//
//  Created by Tobias Schillinger on 07.11.20.
//  Copyright © 2020 Tobias Schillinger. All rights reserved.
//

import UIKit
import AVFoundation
import RSBarcodes_Swift


class ProgrammingPopController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        global.Progammingstate = 0
        ProgrammingStatemachine(state: global.Progammingstate)
        //ScannerLabel.setTitle(global.ScannerChoosen, for: .normal)
        
        //genBarcode(ean: "$POWER#OFF", BCView: barcodeView1)
        let purple1 = UIColor.lightGray // 1.0 alpha
        let semi1 = purple1.withAlphaComponent(0.7)
        self.view.backgroundColor = semi1
       
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

    @IBOutlet weak var TextBC: UIButton!
    @IBOutlet weak var StepLabel: UIButton!
    @IBOutlet weak var ProgrammDescriptionLabel: UIButton!
    @IBOutlet weak var ScannerLabel: UIButton!
    @IBOutlet weak var Continue: UIButton!
    @IBOutlet weak var Back: UIButton!
    /// Outlets
    @IBOutlet weak var barcodeView: UIImageView!
    
    @IBOutlet weak var PictureView: UIImageView!
    
    @IBOutlet weak var EulenView: UIImageView!
    
    @IBAction func Continue(_ sender: Any) {
        global.Progammingstate = global.Progammingstate+1
       
        ProgrammingStatemachine(state: global.Progammingstate)
//        genBarcode(ean: "$POWER#OFF", BCView: barcodeView)
//        genBarcode(ean: "%BAT_VOL#", BCView: barcodeView)
    }
    @IBAction func Cancel(_ sender: Any) {
        removeAnimate()
        global.Progammingstate = 0
    }
    
    /// Actions
    @IBAction func Back(_ sender: Any) {
        global.Progammingstate = global.Progammingstate-1
        
        ProgrammingStatemachine(state: global.Progammingstate)
    }
    
    
    /// Programming State machine
    ///
    func ProgrammingStatemachine(state: Int){
        switch(state){
        case -1:
            removeAnimate()
            global.Progammingstate = 0
            break
            //Scanner an und grün?
        case 0:
            ScannerLabel.setTitle(global.ScannerChoosen, for: .normal)
            StepLabel.setTitle(" Schritt 1 von 6:", for: .normal)
            Back.setTitle("Abbrechen", for: .normal)
            Continue.setTitle("Weiter", for: .normal)
            print(global.ScannerChoosen)
            ScannerLabel.setTitle(global.ScannerChoosen, for: .normal)
            ProgrammDescriptionLabel.setTitle(" > Bitte den Scanner auf Funktion prüfen:", for: .normal)
            barcodeView.isHidden = true
            PictureView.isHidden = false
            EulenView.isHidden = true
            let Img: UIImage? = UIImage(named: "ScannerBatterie")
            self.PictureView.image = Img
        
            //Text2.setTitle("  > Scanner ist geladen (grüne LED)?", for: .normal)
            Text1.isHidden = true
            TextBC.isHidden = true
          
            
            //genBarcode(ean: "%#IFSNO$4#", BCView: barcodeView) // working via Bluethooth
           
            break
        case 1:
            StepLabel.setTitle(" Schritt 2 von 6:", for: .normal)
            Back.setTitle("Zurück", for: .normal)
            Continue.setTitle("Weiter", for: .normal)
            ScannerLabel.setTitle(global.ScannerChoosen, for: .normal)
            ProgrammDescriptionLabel.setTitle(" > Einstellung Bluethooth", for: .normal)
            Text1.isHidden = true
            TextBC.isHidden = false
            TextBC.setTitle(" > BC: %#IFSNO$4", for: .normal)
            PictureView.isHidden = true
            barcodeView.isHidden = false
            EulenView.isHidden = true
            genBarcode(ean: "%#IFSNO$4", BCView: barcodeView) // working via Bluethooth
            break
        case 2:
            StepLabel.setTitle(" Schritt 3 von 6:", for: .normal)
            Back.setTitle("Zurück", for: .normal)
            Continue.setTitle("Weiter", for: .normal)
            ScannerLabel.setTitle(global.ScannerChoosen, for: .normal)
            ProgrammDescriptionLabel.setTitle(" > Schlafmodus deaktivieren", for: .normal)
            Text1.isHidden = true
            TextBC.isHidden = false
            TextBC.setTitle(" > BC: $RF#ST00", for: .normal)
            PictureView.isHidden = true
            barcodeView.isHidden = false
            EulenView.isHidden = true
            genBarcode(ean: "$RF#ST00", BCView: barcodeView) // working via Bluethooth
            break
        case 3:
            StepLabel.setTitle(" Schritt 4 von 6:", for: .normal)
            Back.setTitle("Zurück", for: .normal)
            Continue.setTitle("Weiter", for: .normal)
            ScannerLabel.setTitle(global.ScannerChoosen, for: .normal)
            ProgrammDescriptionLabel.setTitle(" > Scannername einstellen", for: .normal)
            Text1.isHidden = true
            TextBC.isHidden = false
            
            PictureView.isHidden = true
            barcodeView.isHidden = false
            let ScannerName = "AT+NAME= " + global.ScannerChoosen
            let text = " > BC: " + ScannerName
            TextBC.setTitle(text, for: .normal)
            genBarcode(ean: ScannerName, BCView: barcodeView) // working via Bluethooth
            break
        case 4:
            StepLabel.setTitle(" Schritt 5 von 6:", for: .normal)
            Back.setTitle("Zurück", for: .normal)
            Continue.setTitle("Weiter", for: .normal)
            ScannerLabel.setTitle(global.ScannerChoosen, for: .normal)
            ProgrammDescriptionLabel.setTitle(" > Einstellungen speichern", for: .normal)
            Text1.isHidden = true
            TextBC.isHidden = false
            TextBC.setTitle(" > BC: AT+MOBE=3", for: .normal)
            PictureView.isHidden = true
            barcodeView.isHidden = false
            EulenView.isHidden = true
            genBarcode(ean: "AT+MOBE=3", BCView: barcodeView) // working via Bluethooth
            break
        case 5:
            StepLabel.setTitle(" Schritt 6 von 6:", for: .normal)
            Back.setTitle("Zurück", for: .normal)
            Continue.setTitle("Weiter", for: .normal)
            ScannerLabel.setTitle(global.ScannerChoosen, for: .normal)
            ProgrammDescriptionLabel.setTitle(" > Scanner bitte wie gezeigt beschriften:", for: .normal)
            PictureView.isHidden = false
            let Img: UIImage? = UIImage(named: "ScannerLabel")
            self.PictureView.image = Img
            barcodeView.isHidden = true
            Text1.isHidden = true
            TextBC.isHidden = true
            EulenView.isHidden = true
       
        case 6:
            StepLabel.setTitle(" Glückwunsch!", for: .normal)
            Back.setTitle("Zurück", for: .normal)
            Continue.setTitle("Weiter", for: .normal)
            ScannerLabel.setTitle(global.ScannerChoosen, for: .normal)
            ProgrammDescriptionLabel.setTitle(" Programmieren ist abgeschlossen! ", for: .normal)
            barcodeView.isHidden = true
            PictureView.isHidden = true
            let Img: UIImage? = UIImage(named: "ItunesArtwork")
            self.EulenView.image = Img
            EulenView.isHidden = false
            
            let OutputResult = " > Scanner " + global.ScannerChoosen + " ist programmiert! \n > Weiter geht's zum Testmodus"
            Text1.setTitle(OutputResult, for: .normal)
            Text1.isHidden = false
          
        case 7:
            EulenView.isHidden = true
            removeAnimate()
            global.Progammingstate = 0
            //BLE.centralManager.scanForPeripherals(withServices: [BLE.ScannerIDs])
            print(global.barcodescanner)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ProgrammingDone"), object: nil)
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
