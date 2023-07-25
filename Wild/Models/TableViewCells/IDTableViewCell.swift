//
//  IDTableViewCell.swift
//  Wild_Lager
//
//  Created by Tobias Schillinger on 11/07/2020.
//  Copyright © 2020 Tobias Schillinger. All rights reserved.
//

import UIKit

class IDTableViewCell: UITableViewCell {

    @IBOutlet weak var Ursprung: UILabel!
    @IBOutlet weak var Ziel: UILabel!
    @IBOutlet weak var Kartons: UILabel!
    @IBOutlet weak var Datum: UILabel!
    @IBOutlet weak var Status: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func SetLieferung(LieferungLog: LieferungenLog){
        let UrsprungText = LieferungLog.LieferID.components(separatedBy: "__")
        let korrektDatum = LieferungLog.Lieferdatum.components(separatedBy: "_")
        
        Ursprung.text = UrsprungText[0]
        Ziel.text = LieferungLog.LieferZiel
        Kartons.text = String(LieferungLog.LieferMengeKartons)
        Datum.text = korrektDatum[0] + " " + korrektDatum[1] + ":" + korrektDatum[2]
        Status.text = LieferungLog.Lieferstatus
    }
}
