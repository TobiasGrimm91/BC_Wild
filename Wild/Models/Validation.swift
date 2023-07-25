//
//  Validation.swift
//  Wild_Lager
//
//  Created by Tobias Schillinger on 18/10/2020.
//  Copyright © 2020 Tobias Schillinger. All rights reserved.
//

import Foundation
import UIKit

class Validation {
    /*
     let nameRegex = "^\\w{3,18}$" // Length be 18 characters max and 3 characters minimum, you can always modify.
     let productNameRegex = "^[6-9]\\d{9}$"
     let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
     let passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$" //Minimum 8 characters at least 1 Alphabet and 1 Number:
     */
    
   public func validateEAN(ean: String) ->Bool {
      // Length be 18 characters max and 3 characters minimum, you can always modify.
      let ean13Regex = "\\d{13}"
      let validateName = NSPredicate(format: "SELF MATCHES %@", ean13Regex)
      let isValidateName = validateName.evaluate(with: ean)
      var proof = true
      
    if isValidateName == true{
        
        for i in 0...global.Barcodes.count-1{
            
            if ean == global.Barcodes[i].EAN{
                DispatchQueue.main.async {
                    self.showMessage(title: "Fehler!", msg: "Barcode bereits vergeben an " + String(global.Barcodes[i].ProduktName))
                }
                proof = false
                break
            }
            
        }
    }else{
        proof = false
    }
        
      return proof
   }
   public func validateProductname(productName: String) -> Bool {
      let productNameRegex = ".+\\s{1}\\d{1,2}%\\s{1}[0-9]{1}.[0-9]{0,2}[l]"
      let validatePhone = NSPredicate(format: "SELF MATCHES %@", productNameRegex)
      let isValidPhone = validatePhone.evaluate(with: productName)
      return isValidPhone
   }
   public func validatePrice(price: String) -> Bool {
      let priceRegEx = "[0-9]{1,}\\.[0-9]{0,2}"
      //let trimmedString = password.trimmingCharacters(in: .whitespaces)
      let validateEmail = NSPredicate(format:"SELF MATCHES %@", priceRegEx)
      let isValidateEmail = validateEmail.evaluate(with: price)
      return isValidateEmail
   }
    
    
    
    func showMessage(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
        }
}
