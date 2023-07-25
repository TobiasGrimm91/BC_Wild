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
    var VPNStatus = true
    var ScanningAllowed1 = true
    var ScanningAllowed2 = true
    var ScanningAllowed3 = true
    var ScanningAllowed4 = true
    var Markt = ""
    var VPNName = ""
    var user: [String] = []
    var Barcode: [EANs] = []
    var barcodescanner: [String] = ["-"]
    var Seller: [[String]] = [["",""],["",""],["",""],["",""]]
    var SellerUsed: [Int] = [0,0,0,0]
    var BenutzerKassenstand: Double = 0.0
    var Wechselgeld: Double = 0.0
    var WechselgeldVortag: Double = 0.0
    var BenutzerKassenentnahme: Double = 0.0
    var Benutzer: String = ""
    var ScannerName: String = ""
    var GesamtBetrag: Double = 0.0
    var ProduktArray1: [Products] = []
    var ProduktArray2: [Products] = []
    var ProduktArray3: [Products] = []
    var ProduktArray4: [Products] = []
    var BatteryNT1: String = ""
    var BatteryNT2: String = ""
    var BatteryNT3: String = ""
    var BatteryNT4: String = ""
    var PopUp = ""
    
    var Barumsatz: Double = 0.0
    var ECUmsatz: Double = 0.0
    var localBC: [[String]] = [["4260283489473","2016 Grauburgunder trocken Herzstück","12.5"],
    ["4260283489503","2016 Muskateller Sekt extra trocken","12.5"],
    ["4260283489466","2016 Riesling trocken Herzstück","12.5"],
    ["4260283489565","2017 Spätburgunder trocken","10.5"],
    ["4260283489589","2018 Gewürztraminer","9.5"],
    ["4260283489541","2018 Grauburgunder trocken","8.5"],
    ["4260283489602","2018 Heimat Cuvée","8.5"],
    ["4260283489497","2018 Muskateller trocken","12.5"],
    ["4260283489534","2018 Riesling alte Reben","8.5"],
    ["4260283489572","2018 Riesling feinherb","8.5"],
    ["4260283489527","2018 Rivaner trocken","6.5"],
    ["4260283489558","2018 Rosé Sommer Cuvée","7.9"],
    ["4260283489589","2018 Secco Rosé wild & fruchtig","6.9"],
    ["4260283489510","2018 Secco wild & frisch trocken","6.9"],
    ["4260283489480","2018 Spätburgunder Herzstück","17.5"],
    ["4260283489596","2018 Weißburgunder trocken ","8.5"],
    ["4260283480494","Aprikose-Gold 35% 0.2l","9.5"],
    ["4260283480449","Aprikose-Gold 35% 0.7l","19.5"],
    ["4260283480746","Cöxle-Gold 35% 0.2l","8.5"],
    ["4260283480555","Cöxle-Gold 35% 0.7l","15.5"],
    ["4260283480760","Cöxle-Gold 35% 1 l","19.5"],
    ["4260283480531","Haselnuss-Gold 35% 0.2l","9.5"],
    ["4260283480524","Haselnuss-Gold 35% 0.7l","19.5"],
    ["4260283481927","Kirsch-Vanille.Gold 35%.7l","19.5"],
    ["4260283481774","Mirabelle-Gold 35% 0.2l","19.5"],
    ["4260283480081","Mirabelle-Gold 35% 0.7l","19.5"],
    ["4260283481361","Quitte-Gold 35% 0.2l","19.5"],
    ["4260283480586","Quitte-Gold 35% 0.7l","19.5"],
    ["4260283480869","Waldhimbeer-Gold 35% 0.2l","9.5"],
    ["4260283480593","Waldhimbeer-Gold 35% 0.7l","19.5"],
    ["4260283481354","Weinbergpfirsich-Gold 35% 0.2l","9.5"],
    ["4260283480500","Weinbergpfirsich-Gold 35% 0.7l","19.5"],
    ["4260283481026","Williams-Gold 0.1l","6.5"],
    ["4260283480357","Williams-Gold 35% 0.2l","9.5"],
    ["4260283480371","Williams-Gold 35% 0.7l","19.5"],
    ["4260283481781","Williams-Gold 35% 1l","24.5"],
    ["4260283481798","Zibärtle-Gold 35% 0.2l","11.5"],
    ["4260283480203","Zibärtle-Gold 35% 0.7l","21.5"],
    ["4260283480975","Zwetschge-Gold 35% 0.2l","9.5"],
    ["4260283480753","Zwetschge-Gold 35% 0.7l","19.5"],
    ["4260283481651","Altes Pflümliwasser 0.2l","9.5"],
    ["4260283480104","Altes Pflümliwasser 0.7l","19.5"],
    ["4260283480470","Apfelbrand Gravensteiner 40% 0.2l","8.5"],
    ["4260283480487","Apfelbrand Gravensteiner 40% 0.7l","17.5"],
    ["4260283480968","Aprikosenbrand 40% 0.2l","9.5"],
    ["4260283481828","Aprikosenbrand 40% 0.7l","19.5"],
    ["4260283481668","Brombeerbrand M+D 40% 0.2l","19.5"],
    ["4260283480111","Brombeerbrand M+D 40% 0.7l","39"],
    ["4260283481835","Brombeergeist 40% 0.2l","8.5"],
    ["4260283480333","Brombeergeist 40% 0.7l","17.5"],
    ["4260283481675","Erdbeerbrand 40% 0.2l M+D","19.5"],
    ["4260283480036","Erdbeerbrand 40% 0.7l M+D","39"],
    ["4260283481682","Erdbeergeist 40% 0.2l","9.5"],
    ["4260283480050","Erdbeergeist 40% 0.7l","19.5"],
    ["4260283481842","Haferpflaumenbrand 40% 0.2l","8.5"],
    ["4260283480913","Haferpflaumenbrand 40% 0.7l","17.5"],
    ["4260283481699","Hagebuttenbrand 0.2l","12.5"],
    ["4260283480067","Hagebuttenbrand 0.7l","24.5"],
    ["4260283481859","Haselnussgeist 40% 0.2l","14.5"],
    ["4260283481118","Haselnussgeist 40% 0.7l","27.5"],
    ["4260283481873","Holunderbrand 40% 0.2l","14.5"],
    ["4260283480272","Holunderbrand 40% 0.7l","27.5"],
    ["4260283481729","Kirschwasser 40% 0.1l","6.5"],
    ["4260283480005","Kirschwasser 40% 0.2l","8.5"],
    ["4260283480012","Kirschwasser 40% 0.7l","15"],
    ["4260283481736","Kirschwasser 40% 1l","18"],
    ["4260283481545","Kirschwasser Vanille 0.7l","19.5"],
    ["4260283480159","Kornelkirschbrand 40% 0.7l","39"],
    ["4260283480517","Kräuterbrand 40% 0.7l","13"],
    ["4260283481033","Löhrs Pflaumenbrand 40% 0.7l","17.5"],
    ["4260283480562","Marc Gewürztraminer 40% 0.2l","8.5"],
    ["4260283480579","Marc Gewürztraminer 40% 0.7l","17.5"],
    ["4260283480173","Marc Rosen-Muskateller 40% 0.7l","18.5"],
    ["4260283480258","Marc Sauvignon Blanc et Gris 40% 0.7l","18.5"],
    ["4260283480227","Marc Scheurebe 0.7l","18.5"],
    ["4260283480074","Mirabellenwasser 40% 0.2l","8.5"],
    ["4260283480098","Mirabellenwasser 40% 0.7l","15"],
    ["4260283481880","Mirabellenwasser 40% 1l","18"],
    ["4260283481064","Mispelbrand 40% 0.7l","24.5"],
    ["4260283480463","Nägele's Birnenbrand 40% 0.7l","19.5"],
    ["4260283480425","Obstbrand 40% 0.7l","10.5"],
    ["4260283480180","Palmisch Birnenbrand 40% 0.7l","19.5"],
    ["4260283480241","Quittenbrand 40% 0.7l","19.5"],
    ["4260283480883","Reneklodenbrand 0.7l","18.5"],
    ["4260283480654","Roter Topinambur 38% 0.2l","7"],
    ["4260283480661","Roter Topinambur 38% 0.7l","11.5"],
    ["4260283480234","Roter Weinbergpfirsichbrand 40% 0.7","19.5"],
    ["4260283480166","Sauerkirschwasser 40% 0.7l","19.5"],
    ["4260283480807","Schlehenbrand M+D 40% 0.7l","39"],
    ["4260283480777","Schlehengeist 40% 0.2l","9.5"],
    ["4260283480784","Schlehengeist 40% 0.7l","19.5"],
    ["4260283481705","Schwarzer Johannisbeerbrand 40% M+D 0.2l","19.5"],
    ["4260283480128","Schwarzer Johannisbeerbrand 40% M+D 0.7l","39"],
    ["4260283481712","Schwarzer Johannisbeergeist 40% 0.2l","9.5"],
    ["4260283480142","Schwarzer Johannisbeergeist 40% 0.7l","19.5"],
    ["4260283480890","Steinpilzspirituose 40% 0.2l","12.5"],
    ["4260283480319","Steinpilzspirituose 40% 0.7l","24.5"],
    ["4260283480456","Topinambur 40% 0.7l","10.5"],
    ["4260283480265","Vogelbeerbrand 40% M+D 0.7l","39"],
    ["4260283480814","Vogelbeergeist 40% 0.2l","9.5"],
    ["4260283480821","Vogelbeergeist 40% 0.7l","19.5"],
    ["4260283480029","Wahlsche Birnenbrand 40% 0.7l","19.5"],
    ["4260283480289","Waldhimbeerbrand M+D 40% 0.7l","39"],
    ["4260283481743","Waldhimbeergeist 40% 0.1l","6.5"],
    ["4260283480296","Waldhimbeergeist 40% 0.2l","8.5"],
    ["4260283480302","Waldhimbeergeist 40% 0.7l","16"],
    ["4260283481897","Waldhimbeergeist 40% 1l","20"],
    ["4260283480548","Weinhefebrand 40% 0.7l","10.5"],
    ["4260283480937","Wildkirschbrand 40% 0.2","12.5"],
    ["4260283480944","Wildkirschbrand 40% 0.7","24.5"],
    ["4260283480364","Williams-Christ-Birne 40% 0.2l","8.5"],
    ["4260283480388","Williams-Christ-Birne 40% 0.7l","16"],
    ["4260283481750","Williams-Christ-Birne 40% 1l","20"],
    ["4260283480197","Zibärtle Wildpflaumenbrand 40% 0.2l","9.5"],
    ["4260283480210","Zibärtle Wildpflaumenbrand 40% 0.7l","19.5"],
    ["4260283480043","Zwetschgenwasser 40% 0.7l","19.5"],
    ["4260283481101","Aprikosenlikör 17% 0.2l","8.5"],
    ["4260283480609","Aprikosenlikör 17% 0.7l","17.5"],
    ["4260283481606","Bratapfellikör 0.2l","8.5"],
    ["4260283481538","Bratapfellikör 0.7l","17.5"],
    ["4260283481156","Brombeerlikör 17% 0.2l","8.5"],
    ["4260283481170","Brombeerlikör 17% 0.7l","17.5"],
    ["4260283481217","Heidelbeerlikör 17% 0.2l","8.5"],
    ["4260283481187","Heidelbeerlikör 17% 0.7l","17.5"],
    ["4260283481262","Pflaumenlikör 17% 0.2l","8.5"],
    ["4260283480623","Pflaumenlikör 17% 0.7l","17.5"],
    ["4260283481330","Quittenlikör 17% 0.2l","8.5"],
    ["4260283480630","Quittenlikör 17% 0.7l","17.5"],
    ["4260283481057","Sauerkirschlikör 17% 0.1","6.5"],
    ["4260283481163","Sauerkirschlikör 17% 0.2l","8.5"],
    ["4260283481149","Sauerkirschlikör 17% 0.7l","17.5"],
    ["4260283481767","Sauerkirschlikör 17% 1l","22.5"],
    ["4260283481903","Schlehenlikör 17% 0.2l","8.5"],
    ["4260283481200","Schlehenlikör 17% 0.7l","17.5"],
    ["4260283482924","Schwarzer Johannisbeerlikör 17% 0.2l","8.5"],
    ["4260283481224","Schwarzer Johannisbeerlikör 17% 0.7l","17.5"],
    ["4260283480876","Waldhimbeerlikör 17% 0.2l","8.5"],
    ["4260283481194","Waldhimbeerlikör 17% 0.7l","17.5"],
    ["4260283481231","Weinbergpfirsichlikör 0.2","17.5"],
    ["4260283480616","Weinbergpfirsichlikör 0.7","17.5"],
    ["4260283481347","Zibärtlelikör 0.7","17.5"],
    ["4260283481125","Erdbeerlimes 15% 0.35l","8.5"],
    ["4260283481132","Erdbeerlimes 15% 0.7l","12.5"],
    ["4260283487783","Himbeerlimes 15% 0.35l","8.5"],
    ["4260283480647","Himbeerlimes 15% 0.7l","12.5"],
    ["4260283483006","Eier-Haselnuss-Likör 17% 0.35l","9"],
    ["4260283483013","Eier-Haselnuss-Likör 17% 0.7l","13.5"],
    ["4260283481293","Eier-Himbeer-Likör 17% 0.35l","9"],
    ["4260283481309","Eier-Himbeer-Likör 17% 0.7l","13.5"],
    ["4260283481279","Eier-Kirsch-Likör 17% 0.35l","9"],
    ["4260283481286","Eier-Kirsch-Likör 17% 0.7l","13.5"],
    ["4260283480838","Eier-Rum-Likör 17% 0.35l","9.5"],
    ["4260283480791","Eier-Rum-Likör 17% 0.7l","14.5"],
    ["4260283480852","Eier-Weihnachts-Likör 17% 0.35l","9"],
    ["4260283480845","Eier-Weihnachts-Likör 17% 0.7l","13.5"],
    ["4260283481316","Eier-Williams-Likör 17% 0.35l","9"],
    ["4260283481323","Eier-Williams-Likör 17% 0.7l","13.5"],
    ["4260283480326","Apfelbrand Gravensteiner fassgelagert 42% 0.7l","19.5"],
    ["4260283481378","Haferpflaumenbrand fassgelagert 42% 0.2l","12.5"],
    ["4260283481095","Haferpflaumenbrand fassgelagert 42% 0.7l","24.5"],
    ["4260283480685","Marc Gewürztraminer fassgelagert 42% 0.2l","9.5"],
    ["4260283480692","Marc Gewürztraminer fassgelagert 42% 0.7l","19.5"],
    ["4260283481910","Marc Rosenmuskateller fassgelagert 0.2l","12.5"],
    ["4260283480401","Marc Rosenmuskateller fassgelagert 0.7l","24.5"],
    ["4260283481613","Marc Sauvignon Blanc et Gris fassgelagert 42% 0.2l","12.5"],
    ["4260283480395","Marc Sauvignon Blanc et Gris fassgelagert 42% 0.7l","24.5"],
    ["4260283481811","Marc Scheurebe fassgelagert 0.2l","12.5"],
    ["4260283480432","Marc Scheurebe fassgelagert 0.7l","24.5"],
    ["4260283481620","Topinambur fassgelagert 42% 0.2l","9.5"],
    ["4260283480418","Topinambur fassgelagert 42% 0.7l","19.5"],
    ["4260283481637","Weinhefebrand fassgelagert 42% 0.2l","9.5"],
    ["4260283480722","Weinhefebrand fassgelagert 42% 0.7l","19.5"],
    ["4260283481644","Williams-Christ-Birne fassgelagert 42% 0.2l","12.5"],
    ["4260283480340","Williams-Christ-Birne fassgelagert 42% 0.7l","24.5"],
    ["4260283482948","Zwetschge fassgelagert 42% 0.2l","9.5"],
    ["4260283482955","Zwetschge fassgelagert 42% 0.7l","19.5"],
    ["4260283483020","Wild Gin 45% 0.2l","14.5"],
    ["4260283483037","Wild Gin 45% 0.5l","29.5"],
    ["4260283481941","Wild Whisky Single Malt 42% 0.1l","9.5"],
    ["4260283482580","Wild Whisky Single Malt 42% 0.2l","14.5"],
    ["4260283482603","Wild Whisky Single Malt 42% 0.5l","29.5"],
    ["4260283480739","Orange-Ingwer-Likör 35% 0.2l","9.5"],
    ["4260283480715","Orange-Ingwer-Likör 35% 0.7l","19.5"],
    ["4260283481248","Schwarzwälder Wurzelfeuer 40% 0.2l","7.5"],
    ["4260283481255","Schwarzwälder Wurzelfeuer 40% 0.7l","14"],
    ["4260283487776","Wildkräuter Kräutergarten Likör 0.35l","8.2"],
    ["4260283481804","Wildkräuterlikör 36% 0.2l","9.5"],
    ["4260283480708","Wildkräuterlikör 36% 0.7l","19.5"],
    ["4260283487882","Blackforest Wild Gin 45% 0.2l","17.5"],
    ["4260283487837","Blackforest Wild Gin 45% 0.5l","34.5"],
    ["4260283487820","Blackforest Wild Rum Baredition 0.5l","29.5"],
    ["4260283487868","Blackforest Wild Rum Barrique 42% 0.2l","17.5"],
    ["4260283487813","Blackforest Wild Rum Barrique 42% 0.5l","34.5"],
    ["4260283487905","Blackforest Wild Vodka 40% 0.2l","12.5"],
    ["4260283487851","Blackforest Wild Vodka 40% 0.5l","24.5"],
    ["4260283487899","Blackforest Wild Whisky 42% 0.2l","19.5"],
    ["4260283487844","Blackforest Wild Whisky 42% 0.5l","39.5"],
    ["4260283488018","Wild Aprikose-Gold 35% 0.5L","13.99"],
    ["4260283488025","Wild Cöxle-Gold 35% 0.5L","13.99"],
    ["4260283487950","Wild Eierlikör-Haselnuss 17% 0.5L","9.99"],
    ["4260283487967","Wild Eierlikör-Himbeer 17% 0.5L","9.99"],
    ["4260283487974","Wild Eierlikör-Traditionell 17% 0.5L","9.49"],
    ["4260283487998","Wild Haselnuss-Gold 35% 0.5L","13.99"],
    ["4260283488049","Wild Sauerkirschlikör 17% 0.5L","11.99"],
    ["4260283488032","Wild Schwarzer Johannisbeerlikör 17% 0.5L","11.99"],
    ["4260283487981","Wild Williams-Gold 35% 0.5L","13.99"],
    ["4260283488001","Wild Zwetschge-Gold 35% 0.5L","13.99"],
    ["4260283481507","Apfelbrand Gravensteiner fassgelagert 0.5l","24.5"],
    ["4260283480999","Apfel-Zimt-Likör 0.2l","8.5"],
    ["4260283480982","Apfel-Zimt-Likör 0.7l","17.5"],
    ["4260283487929","Blackforest Wild Gin 0.05l","0.0"],
    ["4260283487912","Blackforest Wild Rum 0.05l","0.0"],
    ["4260283487936","Blackforest Wild Vodka 0.05l","0.0"],
    ["4260283489619","Müller-Thurgau 1l","0.0"],
    ["4260283481484","Schwarzwald Marie ohne Korb","41.5"],
    ["4260283481491","Secco Geschenktüte","0"],
    ["4260283489626","Sommer Cuvee für Finnland","0"],
    ["4260283481453","Zapf Eier-Haselnuss 0.35","0"],
    ["4260283481446","Zapf Eier-Haselnuss 0.7","0"],
    ["4260283481415","Zapf Eier-Himbeer 0.35","0"],
    ["4260283481408","Zapf Eier-Himbeer 0.7","0"],
    ["4260283481392","Zapf Eier-Kirsch 0.35","0"],
    ["4260283481385","Zapf Eier-Kirsch 0.7","0"],
    ["4260283481477","Zapf Eier-Spekulatius 0.35","0"],
    ["4260283481460","Zapf Eier-Spekulatius 0.7","0"],
    ["4260283481439","Zapf Eier-Willi 0.35","0"],
    ["4260283481422","Zapf Eier-Willi 0.7","0"],
    ["4260283488070","Blackforest Wild Gin 0.5l Edeka Karton","0"],
    ["4260283488056","Blackforest Wild Rum 0.5l Edeka Karton","0"],
    ["4260283488087","Blackforest Wild Vodka 0.5l Edeka Karton","0"],
    ["4260283488063","Blackforest Wild Whisky 0.5l Edeka Karton","0"],
    ["4260283488155","Aprikose-Gold Edeka 0.5l Karton","0"],
    ["4260283488162","Cöxle-Gold Edeka 0.5l Karton","0"],
    ["4260283488094","Eier-Haselnuss-Edeka 0.5 KARTON","0"],
    ["4260283488100","Eier-Himbeer-Edeka 0.5 KARTON","0"],
    ["4260283488117","Eier-Traditionell-Edeka 0.5 KARTON","0"],
    ["4260283488131","Haselnuss-Gold Edeka 0.5 KARTON","0"],
    ["4260283488186","Sauerkirschlikör Edeka 0.5l KARTON","0"],
    ["4260283488179","Schwarzer Johannisbeerlikör Edeka 0.5l KARTON","0"],
    ["4260283488124","Williams-Gold Edeka 0.5 KARTON","0"],
    ["4260283488148","Zwetschge-Gold Edeka 0.5 KARTON","0"],
    ["4260283481590","Geschenkbox Cocktail (mit Inhalt)","54.5"],
    ["4260283480135","Geschenkbox BFWS (mit Inhalt)","69.5"],
    ["4260283481576","Likör/Schnaps zum da trinken (2.50)","2.5"],
    ["4260283481583","Schmuckflaschen","49.5"],
    ["4260283481569","Wild Spirituosenglas","2.5"],
    ["4260283480906","Geschenkkorb blanko","3"],
    ["4260283480920","Geschenkbox doppelt","3"],
    ["4260283480951","Geschenkbox einzeln","2"],
    ["4260283482023","Wild Gin 0.5l (create your own)","29.5"],
    ["4260283481996","1 Flavour (create your own Gin)","4"],
    ["4260283482009","2 Flavour (create your own Gin)","7"],
    ["4260283482016","3 Flavour (create your own Gin)","10"],
    ["4260283481972","Divers(Preis verändern)","0"],
    ["4260283481989","Geschenkbox(Wild/BFWS) Blanko","5"],
    ["4260283482283","Plüsch Bollenhut","2.5"]]
    
    func ConvertBattery(ByteArray: [UInt8]) -> String{
        let A = String(UnicodeScalar(UInt8(ByteArray[8])))
        let B = String(UnicodeScalar(UInt8(ByteArray[9])))
        let C = String(UnicodeScalar(UInt8(ByteArray[10])))
        return A + B + C
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

    
    
    func LoadBarcode()
    {
        print("Barcodes geladen")
        let fileName = "Barcode"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        //print("FilePath: \(fileURL.path)")
        
        let FileExist = FileManager().fileExists(atPath: fileURL.path)
        //print("Status der datei: " + (String(FileExist)))
        
        if FileExist == true
        {
            //Auslesen der Infodatei und auslesen der User
            var readString = "" // Used to store the file contents
            do {
                // Read the file contents
                readString = try String(contentsOf: fileURL)
            } catch let error as NSError {
                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
            }
            //print("File Text: " + (readString))
            
            if readString.contains("Tausche")
            {
              
                //Kill App because first time of Using
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        exit(0)
                    }
                }
                
            }else{
                var Barcodes: [[String]] = []
                Barcodes = CSwiftV(with: readString,separator: ",", headers:["EAN_Code","Artikelbezeichung","BruttoPreis"]).rows

                for i in 1...Barcodes.count - 1 {
                     let eans = EANs(EAN: Barcodes[i][0], ProduktName: Barcodes[i][1], Preis: Barcodes[i][2])
                    global.Barcode.append(eans)
               
                }
                
                //print(global.Barcode)
                //print(global.Barcode[1][1])
            }
        }
        if FileExist == false
        {
            
            
            //Falls datei nicht existiert
            let writeString = "Tausche diese Datei aus um die Barcodes zu aktualisieren Format:EAN_Code,Artikelbezeichung,BruttoPreis\n"
            do {
                // Write to the file
                try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            } catch let error as NSError {
                print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
            }
            //Kill App because first time of Using
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    exit(0)
                }
            }
        }
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


class EANs{
    
    var EAN: String
    var ProduktName: String
    var Preis: String
    init(EAN: String, ProduktName: String, Preis: String){
        self.EAN = EAN
        self.ProduktName = ProduktName
        self.Preis = Preis
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


}


