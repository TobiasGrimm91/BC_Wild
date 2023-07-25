//
//  GesamtRueckTableViewCell.swift
//  Wild_Lager
//
//  Created by Tobias Schillinger on 14.10.20.
//  Copyright © 2020 Tobias Schillinger. All rights reserved.
//

import UIKit

class GesamtRueckTableViewCell: UITableViewCell {

    @IBOutlet weak var GesamtFehl: UILabel!
    @IBOutlet weak var LagerIst: UILabel!
    @IBOutlet weak var Produkt: UILabel!
    @IBOutlet weak var EAN: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func SetProducts(produkt: Products){
        //istbestand = Lagerist
        //Sollbestand = maerkte soll-ist (also der fehlbestand)
        //Array wird nur genutzt um alles anzuzeigen
        if produkt.Istbestand <= 0{
            LagerIst.textColor = .red
            LagerIst.text = String(produkt.Istbestand)
        }else{
            LagerIst.textColor = .black
            LagerIst.text = String(produkt.Istbestand)
        }
        if produkt.Istbestand >= produkt.Sollbestand{
            GesamtFehl.textColor = .black
            GesamtFehl.text = String(produkt.Sollbestand)
        }else{
            GesamtFehl.textColor = .red
            GesamtFehl.text = String(produkt.Sollbestand)
        }
        EAN.text = produkt.EAN
        Produkt.text = produkt.Produkt
        
        
        
        
    }

}
