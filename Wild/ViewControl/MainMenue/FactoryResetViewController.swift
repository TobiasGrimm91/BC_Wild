//
//  FactoryResetViewController.swift
//  Wild
//
//  Created by Tobias Schillinger on 27.07.23.
//  Copyright © 2023 Tobias Schillinger. All rights reserved.
//

import UIKit
import AVFoundation
import RSBarcodes_Swift

class FactoryResetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        genBarcode(ean: "000B0", BCView: barcodeView1)
        genBarcode(ean: "000601", BCView: barcodeView2)
        genBarcode(ean: "000706", BCView: barcodeView3)
        genBarcode(ean: "%#IFSN0$B", BCView: barcodeView4)
        genBarcode(ean: "$USB#KEY", BCView: barcodeView5)
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var barcodeView1: UIImageView!
    @IBOutlet weak var barcodeView2: UIImageView!
    @IBOutlet weak var barcodeView3: UIImageView!
    @IBOutlet weak var barcodeView4: UIImageView!
    @IBOutlet weak var barcodeView5: UIImageView!
    
    
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
