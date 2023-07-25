//
//  LieferListeTableViewCell.swift
//  Wild_Lager
//
//  Created by Tobias Schillinger on 11/07/2020.
//  Copyright © 2020 Tobias Schillinger. All rights reserved.
//

import UIKit

class LieferListeTableViewCell: UITableViewCell {
    @IBOutlet weak var Geliefert: UILabel!

    
    @IBOutlet weak var EAN: UILabel!
    @IBOutlet weak var ProduktName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setLieferListe(Lieferung: Lieferungen){
        Geliefert.text = String(Lieferung.Geliefert)
        EAN.text = Lieferung.EAN
        ProduktName.text = Lieferung.Produktname
    }
}
