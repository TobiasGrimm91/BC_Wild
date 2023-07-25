//
//  Globals.swift
//  Wild
//
//  Created by Tobias Schillinger on 07.10.19.
//  Copyright © 2019 Tobias Schillinger. All rights reserved.
//

import Foundation
import CoreBluetooth
import UIKit

class Global{
    // MARK: BLE
    var ScanningAllowed1 = true
    var ScanningAllowed2 = true
    var ScanningAllowed3 = true
    var ScanningAllowed4 = true
    var AppName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String

    var barcodescanner: [String] = []
    var Seller: [[String]] = [["",""],["",""],["",""],["",""]]
    var Producer: [String] = ["Abfueller","Produktionsleiter","Scannername"]
    
    var SumUpUsed = true

    var Markt = ""
   
    var user: [String] = []
    var Barcode: [EANs] = []

    var SellerUsed: [Int] = [0,0,0,0]
    var BenutzerKassenstand: Double = 0.0
    var Wechselgeld: Double = 0.0
    var WechselgeldVortag: Double = 0.0
    var BenutzerKassenentnahme: Double = 0.0
    var Benutzer: String = ""
    var ScannerName: String = ""
    var GesamtBetrag: Double = 0.0
    var ProduktArray1: [Products] = []
    var ProduktArray11: [Products] = []
    var ProduktArray12: [Products] = []
    var ProduktArray13: [Products] = []
    
    var ProduktArray2: [Products] = []
    var ProduktArray21: [Products] = []
    var ProduktArray22: [Products] = []
    var ProduktArray23: [Products] = []
    
    var ProduktArray3: [Products] = []
    var ProduktArray31: [Products] = []
    var ProduktArray32: [Products] = []
    var ProduktArray33: [Products] = []
    
    var ProduktArray4: [Products] = []
    var ProduktArray41: [Products] = []
    var ProduktArray42: [Products] = []
    var ProduktArray43: [Products] = []
    
    var Progammingstate: Int = 0
    var ScannerChoosen: String = ""
    var HistoryProduktArray: [Verkauf] = []
    var BatteryNT1: String = ""
    var BatteryNT2: String = ""
    var BatteryNT3: String = ""
    var BatteryNT4: String = ""
    var PopUp = ""
    
    var Barumsatz: Double = 0.0
    var ECUmsatz: Double = 0.0
    
    
    // MARK: QUEUEs
    var SerialNetworkingQueue = DispatchQueue(label: "")
    var SerialProductsQueue = DispatchQueue(label: "Products")
    var SerialVKQueue = DispatchQueue(label: "LastVKsArray")
    // MARK: Networking
    var FailedRequests: [URLRequest] = []
    
    
    // MARK: Lager und Staende
    var Staende: [String] = ["",""]
    var VerfuegBareLager:[String] = ["",""]
    var Lager: String = ""
    var Stand: String = ""
    var AbfuellProdukte: [Abfuellprodukt] = []
    var Abfuelldetails = AbfuellDetails(AbfuellungsID: "", FuellMengenKonrolle: "", ProduktionsKontrolle: "", Reinhaltung: "", BesondereVorfaelle: "")
    
    var AbfuellProdukte1: [Abfuellprodukt] = []
    var Abfuelldetails1 = AbfuellDetails(AbfuellungsID: "", FuellMengenKonrolle: "", ProduktionsKontrolle: "", Reinhaltung: "", BesondereVorfaelle: "")
    
    var AbfuellungsDaten: [Abfuellungen] = []
    
    var ProduktionsEinheiten: [ProduktionsEinheit] = []
    var ProduktionsEinheitenExport: [ProduktionsEinheit] = []
    var Barcodes: [EANs] = []
    var EditBarcode: EANs = EANs(EAN: "", ProduktName: "", Preis: "", TankNr: "", Rubrik: "")
    var EditRohBarcode: RohEANs = RohEANs(EAN: "", ProduktName: "", TankNr: "", IstBestand: "", LosNr: "")
    var RohBarcodes: [RohEANs] = []
    var Infrastructuren: [Infrastructures] = []
    
    // MARK: Delivery System
    var ProduktArray = [Products]()
    var LagerProduktArray = [Products]()
    var Marktbestaende = [AllProducts]()
    var LieferungsArray: [Lieferungen] = []
    var Lieferungenlog: [LieferungenLog] = []

    // MARK: Bilanzen
    var BilanzArray = [Bilanzen]()
    // MARK: Verkauf
    
    
    //MARK: Inventur
    var VerkaufsArray = [Verkauf]()
    var GesamtVKArray = [GesamtVerkaeufe]()
    var Verkaufsstände = [String]()
    var InventurBestand = [Bestaende]()
    var BenutzerInventurBestand = [Bestaende]()
    var InventurLog = [Inventur]()
    
    var Modus = ""
    var Mitarbeiter: [String] = []
    var LieferID = ""
    
    var RabattModus = ""
    var RabbatPreis = 0.0
    var RabbatIndex = 0
    func FindAlkPercentage(Produkname: String)-> String{
        print(Produkname)
        var indizie = 0
        var AlkString = ""
        let produktname = Array(Produkname)
        for i in 0...produktname.count-1{
            if produktname[i] == "%"{
                indizie = i
            }
            if indizie > 0{
                AlkString = Produkname[(i-2)..<i]
                print(AlkString)
                break
            }
        }
        return AlkString
    }
    func FindBottleSize(Produkname: String)-> String{
        print(Produkname)

        var Bottlesize = ""
        if Produkname.contains("0.35"){
            Bottlesize = "0.35"
        }else if Produkname.contains("0.7"){
            Bottlesize = "0.7"
        }else if Produkname.contains("0.1"){
            Bottlesize = "0.1"
        }else if Produkname.contains("0.5"){
            Bottlesize = "0.5"
        }else if Produkname.contains("1.0l"){
            Bottlesize = "1"
        }else if Produkname.contains("1 l"){
            Bottlesize = "1"
        }else if Produkname.contains("1l"){
            Bottlesize = "1"
        }else if Produkname.contains("0.2"){
            Bottlesize = "0.2"
        }else{
            print("keine Literangabe vorhanden")
            Bottlesize = "0"
        }
    
        return Bottlesize
    }
    func GetKartonKapa(product: [Bestaende]) -> Double
    {
        
        var kartons = 0.0
        if product.count >= 1{
            for i in 0...product.count - 1 {
                if product[i].VPE == 0{
                    
                }else{
                kartons = kartons + Double(product[i].Sollbestand / product[i].VPE)
                }
            }
        }

        return kartons.rounded()
    }
    
    func GetKartonStand(product: [Bestaende]) -> Double
    {
        var kartons = 0.0
        if product.count >= 1{
            for i in 0...product.count - 1 {
                if product[i].VPE == 0{
                    
                }else{
                kartons = kartons + Double(product[i].Istbestand / product[i].VPE)
                }
            }
        }

        return kartons.rounded()
    }
    
    func GetKartonLifer(product: [Bestaende]) -> Double
    {
        var kartons = 0.0
        if product.count >= 1{
            for i in 0...product.count - 1 {
                if product[i].VPE == 0{
                    
                }else{
                kartons = kartons + Double(product[i].FlaschenSend / product[i].VPE)
                }
            }
        }

        return kartons.rounded()
    }
    
    func ConvertBattery(ByteArray: [UInt8]) -> String{
        let A = String(UnicodeScalar(UInt8(ByteArray[8])))
        let B = String(UnicodeScalar(UInt8(ByteArray[9])))
        let C = String(UnicodeScalar(UInt8(ByteArray[10])))
        return A + B + C
    }
    
    
    func GetTodayDate()-> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        return result
        
    }
    
    
    func GetDateAndTime() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "dd.MM.yyyy_HH:mm"
        let result = formatter.string(from: date)
        return result
    }
    func GetDateAndTimeSeconds() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "dd.MM.yyyy_HH:mm:ss"
        let result = formatter.string(from: date)
        return result
    }

    func PutDataToArray(BarCode: [UInt8], Produkte: [Products]) -> [Products]{
        var indukte: [Products] = []
        indukte = Produkte
        var equal = 0
        let CodeString = String(bytes: BarCode, encoding: .utf8)
        let FilteredString = String(CodeString!.filter { !" \n\t\r".contains($0) })

        let tempProdukt = Products(product: "", price: "", ammount: 0, EAN: "")
        for n in 0...Barcode.count-1{

            if FilteredString == Barcode[n].EAN{
                if indukte.count == 0 {
                    tempProdukt.ammount = 1
                    tempProdukt.price = Barcode[n].Preis
                    tempProdukt.product = Barcode[n].ProduktName
                    tempProdukt.EAN = Barcode[n].EAN
                    indukte.append(tempProdukt)
                    break
                }else if indukte.count >= 1{

                    for i in 0...indukte.count-1{
                        
                        if indukte[i].EAN == Barcode[n].EAN {
                            indukte[i].ammount += 1
                            equal = 1
                            print( indukte[i].EAN + indukte[i].product)
                        }

                    }
                    if equal == 0{
                    tempProdukt.ammount = 1
                    tempProdukt.price = Barcode[n].Preis
                    tempProdukt.product = Barcode[n].ProduktName
                    tempProdukt.EAN = Barcode[n].EAN
                    indukte.append(tempProdukt)
                    
                    break
                    }else if equal == 1{
                    break
                    }
                }

                
            }
        }

        return indukte
    }
    
    
    

}



extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

struct Abfuellprodukt{
    var ProdLinie: String
    var ProduktName: String
    var EAN: String
    var AbfuellMenge: String
    var Flaschenanzahl: String
    var Datum: String
    var Flaschengr: String
    var Alk: String
    var tankNr: String
    var LosNr: String
    var Voll: String
    var Leer: String
    var Rueckstell: String
    var Reinigung: String
    init(ProdLinie: String,ProduktName: String,EAN: String, AbfuellMenge: String,Flaschenanzahl: String,Datum: String,Flaschengr: String,Alk: String,tankNr: String,LosNr: String,Voll: String,Leer: String,Rueckstell: String, Reinigung: String){
        self.ProdLinie = ProdLinie
        self.ProduktName = ProduktName
        self.EAN = EAN
        self.AbfuellMenge = AbfuellMenge
        self.Flaschenanzahl = Flaschenanzahl
        self.Datum = Datum
        self.Flaschengr = Flaschengr
        self.Alk = Alk
        self.tankNr = tankNr
        self.LosNr = LosNr
        self.Voll = Voll
        self.Leer = Leer
        self.Rueckstell = Rueckstell
        self.Reinigung = Reinigung
    }
    
    
}

struct ProduktionsEinheit{
    var LfDNr: String?
    var ArtAlkErzeugnisse: String
    var MengeAlkErzeugnisse: String
    
    var HergestelltProdukt: String
    var MengeHergestelltProdukt: String
    var TankNr: String
    var LosNr: String
    var EAN: String

    var Inhaltsstoffe: String
    var Sensorik: String
    var Rueckstell: String
    var Reinigung: String
    var TankLeer: String
    var Datum: String
    
    init(ArtAlkErzeugnisse: String, MengeAlkErzeugnisse: String,HergestelltProdukt: String, MengeHergestelltProdukt: String,TankNr: String,LosNr: String,EAN: String,Inhaltsstoffe: String,Sensorik: String,Rueckstell: String, Reinigung: String, TankLeer: String, Datum: String){
        
        self.ArtAlkErzeugnisse = ArtAlkErzeugnisse
        self.MengeAlkErzeugnisse = MengeAlkErzeugnisse
        
        self.HergestelltProdukt = HergestelltProdukt
        self.MengeHergestelltProdukt = MengeHergestelltProdukt
        self.TankNr = TankNr
        self.LosNr = LosNr
        self.EAN = EAN
        self.Inhaltsstoffe = Inhaltsstoffe
        self.Sensorik = Sensorik
        self.Rueckstell = Rueckstell
        self.Reinigung = Reinigung
        self.TankLeer = TankLeer
        self.Datum = Datum
    }
    
    
}

struct AbfuellDetails {
    var AbfuellungsID: String
    var FuellMengenKonrolle: String
    var ProduktionsKontrolle: String
    var Reinhaltung: String
    var BesondereVorfaelle: String
    init(AbfuellungsID: String,FuellMengenKonrolle: String,ProduktionsKontrolle: String,Reinhaltung: String,BesondereVorfaelle: String){
        self.AbfuellungsID = AbfuellungsID
        self.FuellMengenKonrolle = FuellMengenKonrolle
        self.ProduktionsKontrolle = ProduktionsKontrolle
        self.Reinhaltung = Reinhaltung
        self.BesondereVorfaelle = BesondereVorfaelle
    }
}


class Products{
    
    var product: String
    var price: String
    var ammount: Int
    var EAN: String
    init(product: String, price: String, ammount: Int, EAN: String){
        self.product = product
        self.price = price
        self.ammount = ammount
        self.EAN = EAN
    }
    func getAmmount() -> Int{
        return ammount
    }

}
class Inventur{
    
    var InventurID: String
    var InventurMarkt: String
    var FlaschenDiff: String
    var WertDiff: String
    var Datum: String
    init(InventurID: String, InventurMarkt: String, FlaschenDiff: String, WertDiff: String, Datum: String){
        self.InventurID = InventurID
        self.InventurMarkt = InventurMarkt
        self.FlaschenDiff = FlaschenDiff
        self.WertDiff = WertDiff
        self.Datum = Datum
    }

}
// Eigentlich Products
struct Bestaende{
    
    var Istbestand: Int
    var Sollbestand: Int
    var Fehlbestand: Int
    var FlaschenSend: Int! = nil
    var Karton: Int
    var VPE: Int
    var EAN: String
    var Produkt: String
    
    
    init(Istbestand: Int, Sollbestand: Int, Karton: Int, VPE: Int, EAN: String, Produkt: String){
        self.Istbestand = Istbestand
        self.Sollbestand = Sollbestand
        self.Fehlbestand = Sollbestand - Istbestand
        self.Karton = Karton
        self.EAN = EAN
        self.VPE = VPE
        self.FlaschenSend = (Karton * VPE)
        self.Produkt = Produkt
        
    }
    
}

//struct Products{
//
//    var Istbestand: Int
//    var Sollbestand: Int
//    var Fehlbestand: Int
//    var FlaschenSend: Int! = nil
//    var Karton: Int
//    var VPE: Int
//    var EAN: String
//    var Produkt: String
//
//
//    init(Istbestand: Int, Sollbestand: Int, Karton: Int, VPE: Int, EAN: String, Produkt: String){
//        self.Istbestand = Istbestand
//        self.Sollbestand = Sollbestand
//        self.Fehlbestand = Sollbestand - Istbestand
//        self.Karton = Karton
//        self.EAN = EAN
//        self.VPE = VPE
//        self.FlaschenSend = (Karton * VPE)
//        self.Produkt = Produkt
//
//    }
//
//}

struct Verkauf {
    var VKMenge: Int
    var EAN: String
    var Produktname: String
    var Buchungsart: String
    var Mitarbeiter: String
    var Datum_Uhrzeit: String
    var VKPreis: String
    var Rubrik: String?
    
    init(VKMenge: Int,EAN: String,Produktname: String,Buchungsart: String,Mitarbeiter: String,Datum_Uhrzeit: String,VKPreis: String) {
        self.VKMenge = VKMenge
        self.EAN = EAN
        self.Produktname = Produktname
        self.Buchungsart = Buchungsart
        self.Mitarbeiter = Mitarbeiter
        self.Datum_Uhrzeit = Datum_Uhrzeit
        self.VKPreis = VKPreis
       
    }
}
struct GesamtVerkaeufe{
    var Stand: String
    var Verkaeufe: [Verkauf]
    init(Stand: String, Verkaeufe: [Verkauf]){
        self.Stand = Stand
        self.Verkaeufe = Verkaeufe
    }
    
    
}
struct Abfuellungen {
    var FiD: String
    var ProdLinie: String
    var Prodktbezeichnung: String
    var EAN: String
    var FlaschenGroesse: String
    var Alk: String
    var TankNr: String
    var LosNr: String
    var AbgMenge: String
    var FlaschenAnz: String
    var BruchVoll: String
    var BruchLeer: String
    var RueckStellProbe: String
    var Reinigung: String
    var FuellMengenKont: String
    var ProduktionsKont: String
    var Reinhaltung: String
    var Abfueller: String
    var ProduLeiter: String
    var VorfaelleText: String
    
    init(FiD:String,ProdLinie: String,Prodktbezeichnung: String,EAN: String,FlaschenGroesse: String,Alk: String,TankNr: String,LosNr: String,AbgMenge: String,FlaschenAnz: String,BruchVoll: String,BruchLeer: String,RueckStellProbe: String,Reinigung: String,FuellMengenKont: String,ProduktionsKont: String,Reinhaltung: String,Abfueller: String,ProduLeiter: String,VorfaelleText: String){
        self.FiD = FiD
        self.ProdLinie = ProdLinie
        self.Prodktbezeichnung = Prodktbezeichnung
        self.EAN = EAN
        self.FlaschenGroesse = FlaschenGroesse
        self.Alk = Alk
        self.TankNr = TankNr
        self.LosNr = LosNr
        self.AbgMenge = AbgMenge
        self.FlaschenAnz = FlaschenAnz
        self.BruchVoll = BruchVoll
        self.BruchLeer = BruchLeer
        self.RueckStellProbe = RueckStellProbe
        self.Reinigung = Reinigung
        self.FuellMengenKont = FuellMengenKont
        self.ProduktionsKont = ProduktionsKont
        self.Reinhaltung = Reinhaltung
        self.Abfueller = Abfueller
        self.ProduLeiter = ProduLeiter
        self.VorfaelleText = VorfaelleText
    }
    
}


class VKProducts{
    
    var product: String
    var price: String
    var ammount: Int
    var EAN: String
    init(product: String, price: String, ammount: Int, EAN: String){
        self.product = product
        self.price = price
        self.ammount = ammount
        self.EAN = EAN
    }
    func getAmmount() -> Int{
        return ammount
    }

}


struct Lieferungen{
        
    var BestandBevor: Int
    var BestandDanach: Int
    var Geliefert: Int
    var EAN: String
    var Produktname: String
    
    init(BestandBevor: Int, BestandDanach: Int, Geliefert: Int, EAN: String, Produktname: String ){
        self.BestandBevor = BestandBevor
        self.BestandDanach = BestandDanach
        self.Geliefert = Geliefert
        self.EAN = EAN
        self.Produktname = Produktname
        
    }
    
}

struct LieferungenLog{
    var LieferID: String
    var LieferUrsprung: String
    var LieferZiel: String
    var LieferMengeKartons: Double
    var Lieferdatum: String
    var Lieferstatus: String
    init(LieferID: String, LieferUrsprung: String, LieferZiel: String, LieferMengeKartons: Double,Lieferdatum: String,Lieferstatus: String)
    {
        self.LieferID = LieferID
        self.LieferUrsprung = LieferUrsprung
        self.LieferZiel = LieferZiel
        self.LieferMengeKartons = LieferMengeKartons
        self.Lieferdatum = Lieferdatum
        self.Lieferstatus = Lieferstatus
    }
}

struct LieferungenComplete{
    var Lieferungenlog : LieferungenLog
    var Lieferungliste : Lieferungen
    init(Lieferungenlog: LieferungenLog, Lieferungliste : Lieferungen)
    {
        self.Lieferungenlog = Lieferungenlog
        self.Lieferungliste = Lieferungliste
    }
}


struct AllProducts{
    var StandName: String
    var Bestand: [Products]
    
    init(StandName: String, Bestand: [Products])
    {
        self.StandName = StandName
        self.Bestand = Bestand
    }
    
}

struct Bilanzen{
    
    var Datum_Uhrzeit: String
    var DBGUmsatz: String
    var DBKasse: String
    var BenutzerKasse: String
    var BenutzerEntnahme: String
    var DBEC: String
    var DBDifferenz: String
    var Mitarbeiter: String

    
    
    init(Datum_Uhrzeit: String, DBGUmsatz: String , DBKasse: String, BenutzerKasse: String, BenutzerEntnahme: String, DBEC: String, DBDifferenz: String, Mitarbeiter: String){
        self.Datum_Uhrzeit = Datum_Uhrzeit
        self.DBGUmsatz = DBGUmsatz
        self.DBKasse = DBKasse
        self.BenutzerKasse = BenutzerKasse
        self.BenutzerEntnahme = BenutzerEntnahme
        self.DBEC = DBEC
        self.DBDifferenz = DBDifferenz
        self.Mitarbeiter = Mitarbeiter

    }
    





}

class EANs{
    
    var EAN: String
    var ProduktName: String
    var Preis: String
    var TankNr: String
    var Rubrik: String
    init(EAN: String, ProduktName: String, Preis: String, TankNr: String, Rubrik: String){
        self.EAN = EAN
        self.ProduktName = ProduktName
        self.Preis = Preis
        self.TankNr = TankNr
        self.Rubrik = Rubrik
    }
}
class RohEANs{
    
    var EAN: String
    var ProduktName: String
    var TankNr: String
    var IstBestand: String
    var LosNr: String
    init(EAN: String, ProduktName: String, TankNr: String, IstBestand: String, LosNr: String){
        self.EAN = EAN
        self.ProduktName = ProduktName
        self.TankNr = TankNr
        self.IstBestand = IstBestand
        self.LosNr = LosNr
    }
}

class Infrastructures{
    
    var Lager: String
    var Staende: [String]
    var Mitarbeiter: [String]
    init(Lager: String, Staende: [String], Mitarbeiter: [String]){
        self.Lager = Lager
        self.Staende = Staende
        self.Mitarbeiter = Mitarbeiter
    }
}


class Blue{
    
        var centralManager: CBCentralManager!
        var ScannerIDs = CBUUID(string: "0xFFF0")
        var ScannerService1 = CBUUID(string: "0xFFF1")
        var ScannerService2 = CBUUID(string: "0xFFF2")
        var NetumUUID = UUID?.self
        var BLEPeripheral: CBPeripheral!
        var BLEPeripheral1: CBPeripheral!
        var BLEPeripheral2: CBPeripheral!
        var BLEPeripheral3: CBPeripheral!

   public func ActivateScanner(Scanner: String){
        if Scanner == " NT-1"{
            global.ScanningAllowed1 = true
            global.ScanningAllowed2 = false
            global.ScanningAllowed3 = false
            global.ScanningAllowed4 = false
        }
        if Scanner == " NT-2"{
            global.ScanningAllowed1 = false
            global.ScanningAllowed2 = true
            global.ScanningAllowed3 = false
            global.ScanningAllowed4 = false
        }
        if Scanner == " NT-3"{
            global.ScanningAllowed1 = false
            global.ScanningAllowed2 = false
            global.ScanningAllowed3 = true
            global.ScanningAllowed4 = false
        }
        if Scanner == " NT-4"{
            global.ScanningAllowed1 = false
            global.ScanningAllowed2 = false
            global.ScanningAllowed3 = false
            global.ScanningAllowed4 = true
        }
        
    }

}





