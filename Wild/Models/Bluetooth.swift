//
//  Bluetooth.swift
//  Wild_Lager
//
//  Created by Tobias Schillinger on 22.09.20.
//  Copyright © 2020 Tobias Schillinger. All rights reserved.
//

import Foundation
import CoreBluetooth
import UIKit
var BLE = Blue()


extension AppDelegate: CBCentralManagerDelegate{
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("central.state is .unknown")
        case .resetting:
            print("central.state is .resetting")
        case .unsupported:
            print("central.state is .unsupported")
        case .unauthorized:
            print("central.state is .unauthorized")
        case .poweredOff:
            print("central.state is .poweredOff")
        case .poweredOn:
            print("central.state is .poweredOn")
            
            BLE.centralManager.scanForPeripherals(withServices: [BLE.ScannerIDs])
            
        @unknown default:
            print("Error")
        }
    }
    
    
    
    public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral,
                               advertisementData: [String: Any], rssi RSSI: NSNumber) {
        
        
        if peripheral.name == " NT-1"{
            BLE.BLEPeripheral = peripheral
            BLE.BLEPeripheral.delegate = self
            
            BLE.centralManager.connect(BLE.BLEPeripheral)
            print(BLE.BLEPeripheral as Any)
            
            if global.barcodescanner.contains(" NT-1")
            {
                
            }else{
                global.barcodescanner.append(" NT-1")
            }
            
        }
        if peripheral.name == " NT-2"{
            BLE.BLEPeripheral1 = peripheral
            BLE.BLEPeripheral1.delegate = self
            
            BLE.centralManager.connect(BLE.BLEPeripheral1)
            print(BLE.BLEPeripheral1 as Any)
            
            if global.barcodescanner.contains(" NT-2")
            {
                
            }else{
                global.barcodescanner.append(" NT-2")
            }
        }
        if peripheral.name == " NT-3"{
            BLE.BLEPeripheral2 = peripheral
            BLE.BLEPeripheral2.delegate = self
            
            BLE.centralManager.connect(BLE.BLEPeripheral2)
            print(BLE.BLEPeripheral2 as Any)
            
            if global.barcodescanner.contains(" NT-3")
            {
                
            }else{
                global.barcodescanner.append(" NT-3")
            }        }
        if peripheral.name == " NT-4"{
            BLE.BLEPeripheral3 = peripheral
            BLE.BLEPeripheral3.delegate = self
            
            BLE.centralManager.connect(BLE.BLEPeripheral3)
            print(BLE.BLEPeripheral3 as Any)
            
            if global.barcodescanner.contains(" NT-4")
            {
                
            }else{
                global.barcodescanner.append(" NT-4")
            }
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Disconnect"), object: nil)
    }
    
    public func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Connected!")
        print("Peripheral Name: \(String(describing: peripheral.name))")
        peripheral.discoverServices([BLE.ScannerIDs])
        
    }
    
    func centralManager(_ central: CBCentralManager,
                        didDisconnectPeripheral peripheral: CBPeripheral,
                        error: Error?){
        print(global.barcodescanner)
        if peripheral.name == " NT-1"{
            for i in 0...global.barcodescanner.count-1
            {
                if global.barcodescanner[i] == " NT-1"
                {
                    global.barcodescanner.remove(at: i)
                    break
                }
            }
            
            
        }
        if peripheral.name == " NT-2"{
            for i in 0...global.barcodescanner.count-1
            {
                if global.barcodescanner[i] == " NT-2"
                {
                    global.barcodescanner.remove(at: i)
                    break
                }
            }
        }
        if peripheral.name == " NT-3"{
            for i in 0...global.barcodescanner.count-1
            {
                if global.barcodescanner[i] == " NT-3"
                {
                    global.barcodescanner.remove(at: i)
                    break
                }
            }
        }
        if peripheral.name == " NT-4"{
            for i in 0...global.barcodescanner.count-1
            {
                if global.barcodescanner[i] == " NT-4"
                {
                    global.barcodescanner.remove(at: i)
                    break
                    
                }
            }
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Disconnect"), object: nil)
    }
}


extension AppDelegate: CBPeripheralDelegate {
    
    
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else {return}
        for service in services{
            print(service)
            peripheral.discoverCharacteristics(nil, for: service)
        }
        
    }
    
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService,
                           error: Error?) {
        guard let characteristics = service.characteristics else { return }
        
        for characteristic in characteristics {
            print(characteristic)
            if characteristic.properties.contains(.read) {
                print("\(characteristic.uuid): properties contains .read")
            }
            if characteristic.properties.contains(.notify) {
                print("\(characteristic.uuid): properties contains .notify")
                peripheral.setNotifyValue(true, for: characteristic)
                
                
            }
        }
    }
    func ConvertBattery(ByteArray: [UInt8]) -> String{
        let A = String(UnicodeScalar(UInt8(ByteArray[8])))
        let B = String(UnicodeScalar(UInt8(ByteArray[9])))
        let C = String(UnicodeScalar(UInt8(ByteArray[10])))
        return A + B + C
    }
    

    
    public func PutDataToArray(BarCode: [UInt8]) -> Products{
        let ProduktScan: Products = Products(product: "", price: "", ammount: 0, EAN: "")
        let CodeString = String(bytes: BarCode, encoding: .utf8)
        let FilteredString = String(CodeString!.filter { !" \n\t\r".contains($0) })

            if FilteredString == global.Barcodes[0].EAN{
                ProduktScan.ammount = 1
                ProduktScan.price = global.Barcodes[0].Preis
                ProduktScan.product = global.Barcodes[0].ProduktName
                ProduktScan.EAN = global.Barcodes[0].EAN
                }
        return ProduktScan
    }
    
    
    
    public func GetData(from characteristic: CBCharacteristic) -> [UInt8]{
        guard let characteristicData = characteristic.value else { return [UInt8(1)] }
        let byteArray = [UInt8](characteristicData)
        print(byteArray)
        NotificationCenter.default.post(name:NSNotification.Name(rawValue: "Notify"), object: nil)
        //print(byteArray)
        return byteArray
    }
    
    public func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic,
                           error: Error?) {
        switch characteristic.uuid {
        case BLE.ScannerService1:
            
            
            if peripheral.name == " NT-1"{
                let byteArray = GetData(from: characteristic)
                
                if byteArray.count < 14 && byteArray.count >= 12{
                    
                    global.BatteryNT1 = global.ConvertBattery(ByteArray: byteArray)
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "bat"), object: nil)
                }else{
                    if global.ScanningAllowed1 == true{
                        global.ProduktArray1.removeAll()
                        let product = PutDataToArray(BarCode: byteArray)
                        global.ProduktArray1.append(product)
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Scanned"), object: nil)
                        
                    }
                    
                }
                
            }
            if peripheral.name == " NT-2"{
                let byteArray = GetData(from: characteristic)
                
                if byteArray.count < 14 && byteArray.count >= 12{
                    
                    global.BatteryNT2 = global.ConvertBattery(ByteArray: byteArray)
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "bat"), object: nil)
                }else{
                    if global.ScanningAllowed2 == true{
                        global.ProduktArray2.removeAll()
                        let product = PutDataToArray(BarCode: byteArray)
                        global.ProduktArray2.append(product)
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Scanned"), object: nil)
                        
                    }
                    
                }
                
            }
            if peripheral.name == " NT-3"{
                let byteArray = GetData(from: characteristic)
                
                if byteArray.count < 14 && byteArray.count >= 12{
                    
                    global.BatteryNT3 = global.ConvertBattery(ByteArray: byteArray)
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "bat"), object: nil)
                }else{
                    if global.ScanningAllowed3 == true{
                        global.ProduktArray3.removeAll()
                        let product = PutDataToArray(BarCode: byteArray)
                        global.ProduktArray3.append(product)
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Scanned"), object: nil)
                        
                    }
                    
                }
                
            }
            if peripheral.name == " NT-4"{
                let byteArray = GetData(from: characteristic)
                
                if byteArray.count < 14 && byteArray.count >= 12{
                    
                    global.BatteryNT4 = global.ConvertBattery(ByteArray: byteArray)
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "bat"), object: nil)
                }else{
                    if global.ScanningAllowed4 == true{
                        global.ProduktArray4.removeAll()
                        let product = PutDataToArray(BarCode: byteArray)
                        global.ProduktArray4.append(product)
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Scanned"), object: nil)
                        
                    }
                    
                }
                
            }
            
            
        
            
            
        default:
            print("Unhandled Characteristic UUID: \(characteristic.uuid)")
        }
    }
    
    func showMessage(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
        }
}


extension UIApplication {

    static func topViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }

        return base
    }
}






