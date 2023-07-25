//
//  LagerTableViewCell.swift
//  Wild_Lager
//
//  Created by Tobias Schillinger on 06.10.20.
//  Copyright © 2020 Tobias Schillinger. All rights reserved.
//

import UIKit

class LagerTableViewCell: UITableViewCell {

    @IBOutlet weak var IstBestand: UILabel!
    @IBOutlet weak var SollBestand: UILabel!
    @IBOutlet weak var Fehlbestand: UILabel!
    @IBOutlet weak var Produktname: UILabel!
    @IBOutlet weak var EAN: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func SetProducts(produkt: Products)
    {
        if produkt.Istbestand <= 0{
            IstBestand.textColor = .red
            IstBestand.text = String(produkt.Istbestand)
        }else{
            IstBestand.textColor = .black
            IstBestand.text = String(produkt.Istbestand)
        }
        

        
        let Datastring1 = String(produkt.Produkt)
        
        let Datastring2 =  String(produkt.EAN)
        
        Produktname.text = Datastring1
        EAN.text = Datastring2
        
    }
}
