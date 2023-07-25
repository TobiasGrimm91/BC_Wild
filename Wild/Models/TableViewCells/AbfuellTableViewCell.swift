//
//  AbfuellTableViewCell.swift
//  Wild_Lager
//
//  Created by Tobias Schillinger on 22.09.20.
//  Copyright © 2020 Tobias Schillinger. All rights reserved.
//

import UIKit

class AbfuellTableViewCell: UITableViewCell,UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var Produktname: UITextField!
    @IBOutlet weak var ProduLinie: UITextField!
    @IBOutlet weak var Falschengr: UITextField!
    @IBOutlet weak var Alk: UITextField!
    @IBOutlet weak var TankNr: UITextField!
    @IBOutlet weak var LosNr: UITextField!
    @IBOutlet weak var AbfuellMenge: UITextField!
    @IBOutlet weak var Flaschenanzahl: UITextField!
    @IBOutlet weak var Datum: UITextField!
    @IBOutlet weak var BruchVoll: UITextField!
    @IBOutlet weak var BruchLeer: UITextField!
    @IBOutlet weak var Rueckstellprobe: UITextField!
    @IBOutlet weak var Reinigung: UITextField!
    @IBOutlet weak var Fuellstand: UIButton!
    
    var textChanged: ((String) -> Void)?
   
    override func awakeFromNib() {
        super.awakeFromNib()
        ProduLinie.delegate = self
        Produktname.delegate = self
        Falschengr.delegate = self
        Alk.delegate = self
        TankNr.delegate = self
        LosNr.delegate = self
        AbfuellMenge.delegate = self
        Flaschenanzahl.delegate = self
        Datum.delegate = self
        BruchLeer.delegate = self
        BruchVoll.delegate = self
        Rueckstellprobe.delegate = self
        Reinigung.delegate = self
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func ProduLinieACTION(_ sender: UITextField) {
        textChanged?(ProduLinie.text!)

    }
    @IBAction func ProduktnameAKTION(_ sender: UITextField) {
        textChanged?(Produktname.text!)
    }
    
    @IBAction func FlaschengrAKTION(_ sender: UITextField) {
        textChanged?(Falschengr.text!)
    }
    
    @IBAction func AlkAKTION(_ sender: UITextField) {
        textChanged?(Alk.text!)
    }
    
    @IBAction func TankNRAKTION(_ sender: UITextField) {
        textChanged?(TankNr.text!)
    }
    
    @IBAction func LosNRAKTION(_ sender: UITextField) {
        textChanged?(LosNr.text!)
    }
    
    @IBAction func AbgMengeAKTION(_ sender: UITextField) {
        textChanged?(AbfuellMenge.text!)
    }
    @IBAction func FlaschenanzahlAKTION(_ sender: UITextField) {
        textChanged?(Flaschenanzahl.text!)
    }
    
    @IBAction func DatumAKTION(_ sender: UITextField) {
        textChanged?(Datum.text!)
    }
    @IBAction func vollAKTION(_ sender: UITextField) {
        textChanged?(BruchVoll.text!)
    }
    @IBAction func leerAKTION(_ sender: UITextField){
        textChanged?(BruchLeer.text!)
    }
    @IBAction func RueckstellAKTION(_ sender: UITextField) {
        textChanged?(Rueckstellprobe.text!)
    }
    
    @IBAction func ReinigungAKTION(_ sender: UITextField) {
        textChanged?(Reinigung.text!)
    }
    
    func textChanged(action: @escaping (String) -> Void) {
        self.textChanged = action
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For mobile numer validation
        if textField == AbfuellMenge {
            let allowedCharacters = CharacterSet(charactersIn:"0123456789.")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        if textField == Falschengr {
            let allowedCharacters = CharacterSet(charactersIn:".0123456789")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        if textField == Datum {
            let allowedCharacters = CharacterSet(charactersIn:".0123456789")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        if textField == Flaschenanzahl {
            let allowedCharacters = CharacterSet(charactersIn:"0123456789")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        if textField == BruchVoll {
            let allowedCharacters = CharacterSet(charactersIn:"NneiJja")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        if textField == BruchLeer {
            let allowedCharacters = CharacterSet(charactersIn:"NneiJja")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        if textField == Reinigung {
            let allowedCharacters = CharacterSet(charactersIn:"NneiJja")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        if textField == Rueckstellprobe {
            let allowedCharacters = CharacterSet(charactersIn:"NneiJja")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        
        return true
    }
    func SetAbfuellProdukte(produkt: Abfuellprodukt){
            self.ProduLinie.text = produkt.ProdLinie
            self.Produktname.text = produkt.ProduktName
            self.Falschengr.text = produkt.Flaschengr
            self.Alk.text = produkt.Alk
            self.TankNr.text = produkt.tankNr
            self.LosNr.text = produkt.LosNr
            self.AbfuellMenge.text = produkt.AbfuellMenge
            self.Flaschenanzahl.text = produkt.Flaschenanzahl
            self.Datum.text = produkt.Datum
            self.BruchVoll.text = produkt.Voll
            self.BruchLeer.text = produkt.Leer
            self.Rueckstellprobe.text = produkt.Rueckstell
            self.Reinigung.text = produkt.Reinigung
            
        
        if produkt.tankNr.isEmpty || produkt.tankNr == "0"{
            
        }else{
            
            let Stand = findStand(TankNr: produkt.tankNr)
            self.Fuellstand.setTitle(Stand, for: .normal)
        }
       
    }
    func findStand(TankNr: String) -> String{
        var Fuellstand = ""
        for i in 0...global.RohBarcodes.count-1{
            if TankNr == global.RohBarcodes[i].TankNr{
                Fuellstand = global.RohBarcodes[i].IstBestand
            }
        }
        return Fuellstand
    }
    
}
