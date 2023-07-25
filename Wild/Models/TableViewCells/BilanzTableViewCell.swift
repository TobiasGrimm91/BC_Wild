//
//  BilanzTableViewCell.swift
//  Wild_Lager
//
//  Created by Tobias Schillinger on 11.11.19.
//  Copyright © 2019 Tobias Schillinger. All rights reserved.
//

import UIKit

class BilanzTableViewCell: UITableViewCell {

    @IBOutlet weak var DAtum: UILabel!
    @IBOutlet weak var DBGUmsatz: UILabel!
    @IBOutlet weak var DBKasse: UILabel!
    @IBOutlet weak var BenutzerKassew: UILabel!
    @IBOutlet weak var Benutzerentnahme: UILabel!
    @IBOutlet weak var Dbdif: UILabel!
    @IBOutlet weak var DBEC: UILabel!
    @IBOutlet weak var Mitarbeiter: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setBilanzen(bilanzen: Bilanzen){
//        var Datastring = "|  " + bilanzen.Datum_Uhrzeit + "  |  "
//        Datastring = Datastring + String(bilanzen.DBGUmsatz) + "  | \t"
//        Datastring = Datastring + String(bilanzen.DBKasse)
//
//        let Datastring1 = " |\t" + String(bilanzen.BenutzerKasse)
//
//        let Datastring2 =  "\t|\t\t" + String(bilanzen.BenutzerEntnahme)

        DAtum.text =  bilanzen.Datum_Uhrzeit
        DBGUmsatz.text = bilanzen.DBGUmsatz
        DBKasse.text = bilanzen.DBKasse
        BenutzerKassew.text = bilanzen.BenutzerKasse
        Benutzerentnahme.text = bilanzen.BenutzerEntnahme
        DBEC.text = bilanzen.DBEC
        if Double(bilanzen.DBDifferenz) ?? 0 < 0{
            Dbdif.textColor = .red
            Dbdif.text = bilanzen.DBDifferenz
        }else{
            Dbdif.textColor = .black
            Dbdif.text = bilanzen.DBDifferenz
        }
        
        Mitarbeiter.text = bilanzen.Mitarbeiter
   
        print("ich habe die liste erstellt")
    }
}
