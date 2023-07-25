//
//  BillTableViewCell.swift
//  Wild
//
//  Created by Tobias Schillinger on 08.10.19.
//  Copyright © 2019 Tobias Schillinger. All rights reserved.
//

import UIKit

class BillTableViewCell: UITableViewCell {

    @IBOutlet weak var OverView: UILabel!
    @IBOutlet weak var Ist: UILabel!
    @IBOutlet weak var Liefer: UILabel!
    
    @IBOutlet weak var LagerIst: UILabel!
    @IBOutlet weak var Prodkte: UILabel!
    @IBOutlet weak var EAN: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    var yourobj : (() -> Void)? = nil
    var Kartons: ((Int?)-> Void)? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 500
        stepper.minimumValue = -500
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func StepperValuechanged(_ sender: UIStepper) {
        print(Int(sender.value))
        if let StepperValuechanged = self.yourobj
        {
            Kartons!(Int(sender.value))
            StepperValuechanged()
        }
        ShowMyArray()
    }
    func setLagerBestand(Standprodukt: Products){
        for i in 0...global.LagerProduktArray.count-1{
            if global.LagerProduktArray[i].EAN == Standprodukt.EAN
            {
                    LagerIst.text = String(global.LagerProduktArray[i].Istbestand)
            }
        }
    }
    
    func setProducts(produkt: Products){
        OverView.text = String(produkt.Istbestand)
        Ist.text =  String(produkt.Sollbestand)
        Liefer.text = String(produkt.FlaschenSend)
        
        let Datastring1 = String(produkt.Produkt)
        
        let Datastring2 =  String(produkt.Karton)
        
        stepper.value = Double(produkt.Karton)
         
        Prodkte.text = Datastring1
        EAN.text = Datastring2

    }
    func ShowMyArray(){
        for i in 0...global.ProduktArray.count-1{
            print(global.ProduktArray[i])
        }
    }

//    
//    func setProductsColor(produkt: Products){
//        Produkt.textColor = .red
//        Preis.textColor = .red
//        Menge.textColor = .red
//        Produkt.text = produkt.product
//        Preis.text = produkt.price + "€"
//        Menge.text = String(produkt.ammount)
//    }
    
}
