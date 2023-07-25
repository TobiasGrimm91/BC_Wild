//
//  Alertservice.swift
//  Wild_Lager
//
//  Created by Tobias Schillinger on 09/06/2020.
//  Copyright © 2020 Tobias Schillinger. All rights reserved.
//

import UIKit

class AlertService {
    
    func alert(message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        
        return alert
    }
    
    
}
