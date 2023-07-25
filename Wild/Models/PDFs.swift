//
//  PDFs.swift
//  Wild_Lager
//
//  Created by Tobias Schillinger on 23/06/2020.
//  Copyright © 2020 Tobias Schillinger. All rights reserved.
//

import Foundation
import PDFKit
class PDF{
    func SavePDFAllRueck(){

        let tableBegin = "<table border=" + String(1) + ">"
        let tableEnd = "</table>"
        let RowBegin = "<tr>"
        let RowEnd = "</tr>"
        let RowElStart = "<th>"
        let RowElEnd = "</th>"
        
        let IstB = "IstB. "
        let SollB = "SollB."
        let FehlB = "Fehlbest.\t"
        let Produ = "\t\t\t\t\t\t Produktname \t\t\t\t\t\t"
        
        let EAN = "\t EAN \t"
        var Text = "<font size=" + String(10) + ">" + "Rückstand in: \t" + global.Lager + "\t" + global.GetDateAndTime() + " " + "</font>" + "<br />"
        
        Text = Text + tableBegin + RowBegin + RowElStart + "\(IstB)" + RowElEnd + RowElStart + "\(FehlB)" + RowElEnd + RowElStart + "\(Produ)" + RowElEnd + RowElStart + "\(EAN)" + RowElEnd + RowEnd + "<br />"
        

            for i in 0...global.ProduktArray.count - 1{
                if global.ProduktArray[i].Karton != 0{
                Text.append(RowBegin)
                Text.append(RowElStart)
                Text.append(String(global.ProduktArray[i].Istbestand))
                Text.append(RowElEnd)
                Text.append(RowElStart)
                Text.append(String(global.ProduktArray[i].Sollbestand))
                Text.append(RowElEnd)
                Text.append(RowElStart)
                Text.append(String(global.ProduktArray[i].Produkt))
                Text.append(RowElEnd)
                Text.append(RowElStart)
                Text.append(String(global.ProduktArray[i].EAN))
                Text.append(RowElEnd)
                Text.append(RowEnd)
                }
            }
        

        Text.append(tableEnd)
  
        
        let textWithNewCarriageReturns = Text.replacingOccurrences(of: "\t", with: "&ensp;")

        
        
        // UIPrintInteractionController presents a user interface and manages the printing
        let printController = UIPrintInteractionController.shared

        // UIPrintInfo contains information about the print job
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.outputType = .general
        printInfo.jobName = "myPrintJob"
        printController.printInfo = printInfo
                       


        let format = UIMarkupTextPrintFormatter(markupText: textWithNewCarriageReturns)

        format.perPageContentInsets.top = 30
        format.perPageContentInsets.bottom = 30
        format.perPageContentInsets.left = 72
        format.perPageContentInsets.right = 30

        let render = UIPrintPageRenderer()
        render.addPrintFormatter(format, startingAtPageAt: 0)

        // 3. Assign paperRect and printableRect
        let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4, 72 dpi
        render.setValue(page, forKey: "paperRect")
        render.setValue(page, forKey: "printableRect")

        // 4. Create PDF context and draw
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)

        for i in 0..<render.numberOfPages {
            UIGraphicsBeginPDFPage();
            render.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
        }

        UIGraphicsEndPDFContext();
          let Filename = "Lieferung_" + global.Stand + global.GetDateAndTimeSeconds()
        // 5. Save PDF file
        guard let outputURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(Filename).appendingPathExtension("pdf")
            else { fatalError("Destination URL not created") }

        pdfData.write(to: outputURL, atomically: true)
  }
    func PrintPDFAllRueck(){

          let tableBegin = "<table border=" + String(1) + ">"
          let tableEnd = "</table>"
          let RowBegin = "<tr>"
          let RowEnd = "</tr>"
          let RowElStart = "<th>"
          let RowElEnd = "</th>"
          
          let IstB = "Istbestand"
            let FehlB = "Fehlbest."
          let Produ = "\t\t\t\t\t\t Produktname \t\t\t\t\t\t"
          
        let EAN = "\t EAN \t"
        var Text = "<font size=" + String(10) + ">" + "Rückstand in: \t" + global.Lager + "\t" + global.GetDateAndTime() + " " + "</font>" + "<br />"
        
        Text = Text + tableBegin + RowBegin + RowElStart + "\(IstB)" + RowElEnd + RowElStart + "\(FehlB)" + RowElEnd + RowElStart + "\(Produ)" + RowElEnd + RowElStart + "\(EAN)" + RowElEnd + RowEnd + "<br />"
        

            for i in 0...global.ProduktArray.count - 1{
                if global.ProduktArray[i].Karton != 0{
                Text.append(RowBegin)
                Text.append(RowElStart)
                Text.append(String(global.ProduktArray[i].Istbestand))
                Text.append(RowElEnd)
                Text.append(RowElStart)
                Text.append(String(global.ProduktArray[i].Sollbestand))
                Text.append(RowElEnd)
                Text.append(RowElStart)
                Text.append(String(global.ProduktArray[i].Produkt))
                Text.append(RowElEnd)
                Text.append(RowElStart)
                Text.append(String(global.ProduktArray[i].EAN))
                Text.append(RowElEnd)
                Text.append(RowEnd)
                }
            }
          

          Text.append(tableEnd)
    
          
          let textWithNewCarriageReturns = Text.replacingOccurrences(of: "\t", with: "&ensp;")

          
          
          // UIPrintInteractionController presents a user interface and manages the printing
          let printController = UIPrintInteractionController.shared

          // UIPrintInfo contains information about the print job
          let printInfo = UIPrintInfo(dictionary: nil)
          printInfo.outputType = .general
          printInfo.jobName = "myPrintJob"
          printController.printInfo = printInfo
                         


          let format = UIMarkupTextPrintFormatter(markupText: textWithNewCarriageReturns)

          format.perPageContentInsets.top = 30
          format.perPageContentInsets.bottom = 30
          format.perPageContentInsets.left = 72
          format.perPageContentInsets.right = 30
          printController.printFormatter = format

         // formatter.perPageContentInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
          printController.printFormatter = format
                   
       // Present print controller like usual view controller. Also completionHandler is available if needed.
          printController.present(animated: true)
      }
    func SavePDFAll(){

        let tableBegin = "<table border=" + String(1) + ">"
        let tableEnd = "</table>"
        let RowBegin = "<tr>"
        let RowEnd = "</tr>"
        let RowElStart = "<th>"
        let RowElEnd = "</th>"
        
        let IstB = "IstB. "
        let SollB = "SollB."
        let FehlB = "Liefern\t"
        let Produ = "\t\t\t\t\t\t Produktname \t\t\t\t\t\t"
        
        let EAN = "\t EAN \t"
        var Text = "<font size=" + String(10) + ">" + "Bestand in: \t" + " OG_LADEN " + "\t" + global.GetDateAndTime() + " " + "</font>" + "<br />"
        
        Text = Text + tableBegin + RowBegin + RowElStart + "\(IstB)" + RowElEnd + RowElStart + "\(Produ)" + RowElEnd + RowElStart + "\(EAN)" + RowElEnd + RowEnd + "<br />"
        

            for i in 0...global.ProduktArray.count - 1{
                if global.ProduktArray[i].Karton != 0{
                Text.append(RowBegin)
                Text.append(RowElStart)
                Text.append(String(global.ProduktArray[i].Istbestand))
                Text.append(RowElEnd)

                Text.append(RowElStart)
                Text.append(String(global.ProduktArray[i].Produkt))
                Text.append(RowElEnd)
                Text.append(RowElStart)
                Text.append(String(global.ProduktArray[i].EAN))
                Text.append(RowElEnd)
                Text.append(RowEnd)
                }
            }
        

        Text.append(tableEnd)
  
        
        let textWithNewCarriageReturns = Text.replacingOccurrences(of: "\t", with: "&ensp;")

        
        
        // UIPrintInteractionController presents a user interface and manages the printing
        let printController = UIPrintInteractionController.shared

        // UIPrintInfo contains information about the print job
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.outputType = .general
        printInfo.jobName = "myPrintJob"
        printController.printInfo = printInfo
                       


        let format = UIMarkupTextPrintFormatter(markupText: textWithNewCarriageReturns)

        format.perPageContentInsets.top = 30
        format.perPageContentInsets.bottom = 30
        format.perPageContentInsets.left = 72
        format.perPageContentInsets.right = 30

        let render = UIPrintPageRenderer()
        render.addPrintFormatter(format, startingAtPageAt: 0)

        // 3. Assign paperRect and printableRect
        let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4, 72 dpi
        render.setValue(page, forKey: "paperRect")
        render.setValue(page, forKey: "printableRect")

        // 4. Create PDF context and draw
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)

        for i in 0..<render.numberOfPages {
            UIGraphicsBeginPDFPage();
            render.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
        }

        UIGraphicsEndPDFContext();
          let Filename = "Lieferung_" + global.Stand + global.GetDateAndTimeSeconds()
        // 5. Save PDF file
        guard let outputURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(Filename).appendingPathExtension("pdf")
            else { fatalError("Destination URL not created") }

        pdfData.write(to: outputURL, atomically: true)
  }
    func PrintPDFAll(){

          let tableBegin = "<table border=" + String(1) + ">"
          let tableEnd = "</table>"
          let RowBegin = "<tr>"
          let RowEnd = "</tr>"
          let RowElStart = "<th>"
          let RowElEnd = "</th>"
          
          let IstB = "Istbestand"
          let Produ = "\t\t\t\t\t\t Produktname \t\t\t\t\t\t"
          
          let EAN = "\t EAN \t"
          var Text = "<font size=" + String(10) + ">" + "Bestand in: \t" + " OG_LADEN " + "\t" + global.GetDateAndTime() + " " + "</font>" + "<br />"
          
          Text = Text + tableBegin + RowBegin + RowElStart + "\(IstB)" + RowElEnd + RowElStart + "\(Produ)" + RowElEnd + RowElStart + "\(EAN)" + RowElEnd + RowEnd + "<br />"
          

              for i in 0...global.ProduktArray.count - 1{
                  if global.ProduktArray[i].Karton != 0{
                  Text.append(RowBegin)
                  Text.append(RowElStart)
                  Text.append(String(global.ProduktArray[i].Istbestand))
                  Text.append(RowElEnd)

                  Text.append(RowElStart)
                  Text.append(String(global.ProduktArray[i].Produkt))
                  Text.append(RowElEnd)
                  Text.append(RowElStart)
                  Text.append(String(global.ProduktArray[i].EAN))
                  Text.append(RowElEnd)
                  Text.append(RowEnd)
                  }
              }
          

          Text.append(tableEnd)
    
          
          let textWithNewCarriageReturns = Text.replacingOccurrences(of: "\t", with: "&ensp;")

          
          
          // UIPrintInteractionController presents a user interface and manages the printing
          let printController = UIPrintInteractionController.shared

          // UIPrintInfo contains information about the print job
          let printInfo = UIPrintInfo(dictionary: nil)
          printInfo.outputType = .general
          printInfo.jobName = "myPrintJob"
          printController.printInfo = printInfo
                         


          let format = UIMarkupTextPrintFormatter(markupText: textWithNewCarriageReturns)

          format.perPageContentInsets.top = 30
          format.perPageContentInsets.bottom = 30
          format.perPageContentInsets.left = 72
          format.perPageContentInsets.right = 30
          printController.printFormatter = format

         // formatter.perPageContentInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
          printController.printFormatter = format
                   
       // Present print controller like usual view controller. Also completionHandler is available if needed.
          printController.present(animated: true)
      }
    
    func PrintPDF(){

          let tableBegin = "<table border=" + String(1) + ">"
          let tableEnd = "</table>"
          let RowBegin = "<tr>"
          let RowEnd = "</tr>"
          let RowElStart = "<th>"
          let RowElEnd = "</th>"
          
          let IstB = "IstB. "
          let SollB = "SollB."
          let FehlB = "Liefern\t"
          let Produ = "\t\t\t\t\t\t Produktname \t\t\t\t\t\t"
          
          let EAN = "\t Kartons \t"
          var Text = "<font size=" + String(20) + ">" + "Lieferung: \t" + global.Stand + "\t" + global.GetDateAndTime() + " " + "</font>" + "<br />"
          
          Text = Text + tableBegin + RowBegin + RowElStart + "\(IstB)" + RowElEnd + RowElStart + "\(SollB)" + RowElEnd + RowElStart + "\(FehlB)" + RowElEnd + RowElStart + "\(Produ)" + RowElEnd + RowElStart + "\(EAN)" + RowElEnd + RowEnd + "<br />"
          
          
          if global.ProduktArray.count >= 1{

              for i in 0...global.ProduktArray.count - 1{
                  if global.ProduktArray[i].Karton != 0{
                  Text.append(RowBegin)
                  Text.append(RowElStart)
                  Text.append(String(global.ProduktArray[i].Istbestand))
                  Text.append(RowElEnd)
                  Text.append(RowElStart)
                  Text.append(String(global.ProduktArray[i].Sollbestand))
                  Text.append(RowElEnd)
                  Text.append(RowElStart)
                  Text.append(String(global.ProduktArray[i].FlaschenSend))
                  Text.append(RowElEnd)
                  Text.append(RowElStart)
                  Text.append(String(global.ProduktArray[i].Produkt))
                  Text.append(RowElEnd)
                  Text.append(RowElStart)
                  Text.append(String(global.ProduktArray[i].Karton))
                  Text.append(RowElEnd)
                  Text.append(RowEnd)
                  }
              }
          }

          Text.append(tableEnd)
    
          
          let textWithNewCarriageReturns = Text.replacingOccurrences(of: "\t", with: "&ensp;")

          
          
          // UIPrintInteractionController presents a user interface and manages the printing
          let printController = UIPrintInteractionController.shared

          // UIPrintInfo contains information about the print job
          let printInfo = UIPrintInfo(dictionary: nil)
          printInfo.outputType = .general
          printInfo.jobName = "myPrintJob"
          printController.printInfo = printInfo
                         


          let format = UIMarkupTextPrintFormatter(markupText: textWithNewCarriageReturns)

          format.perPageContentInsets.top = 30
          format.perPageContentInsets.bottom = 30
          format.perPageContentInsets.left = 72
          format.perPageContentInsets.right = 30
          printController.printFormatter = format

         // formatter.perPageContentInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
          printController.printFormatter = format
                   
       // Present print controller like usual view controller. Also completionHandler is available if needed.
          printController.present(animated: true)
      }
      
        func SavePDF(){

            let tableBegin = "<table border=" + String(1) + ">"
            let tableEnd = "</table>"
            let RowBegin = "<tr>"
            let RowEnd = "</tr>"
            let RowElStart = "<th>"
            let RowElEnd = "</th>"
            
            let IstB = "IstB. "
            let SollB = "SollB."
            let FehlB = "Liefern\t"
            let Produ = "\t\t\t\t\t\t Produktname \t\t\t\t\t\t"
            
            let EAN = "\t Kartons \t"
            var Text = "<font size=" + String(20) + ">" + "Lieferung: \t" + global.Stand + "\t" + global.GetDateAndTime() + " " + "</font>" + "<br />"
            
            Text = Text + tableBegin + RowBegin + RowElStart + "\(IstB)" + RowElEnd + RowElStart + "\(SollB)" + RowElEnd + RowElStart + "\(FehlB)" + RowElEnd + RowElStart + "\(Produ)" + RowElEnd + RowElStart + "\(EAN)" + RowElEnd + RowEnd + "<br />"
            
            
            if global.ProduktArray.count >= 1{

                for i in 0...global.ProduktArray.count - 1{
                if global.ProduktArray[i].Karton != 0{
                    Text.append(RowBegin)
                    Text.append(RowElStart)
                    Text.append(String(global.ProduktArray[i].Istbestand))
                    Text.append(RowElEnd)
                    Text.append(RowElStart)
                    Text.append(String(global.ProduktArray[i].Sollbestand))
                    Text.append(RowElEnd)
                    Text.append(RowElStart)
                    Text.append(String(global.ProduktArray[i].FlaschenSend))
                    Text.append(RowElEnd)
                    Text.append(RowElStart)
                    Text.append(String(global.ProduktArray[i].Produkt))
                    Text.append(RowElEnd)
                    Text.append(RowElStart)
                    Text.append(String(global.ProduktArray[i].Karton))
                    Text.append(RowElEnd)
                    Text.append(RowEnd)
                    }
                }
            }

            Text.append(tableEnd)
      
            
            let textWithNewCarriageReturns = Text.replacingOccurrences(of: "\t", with: "&ensp;")

            
            
            // UIPrintInteractionController presents a user interface and manages the printing
            let printController = UIPrintInteractionController.shared

            // UIPrintInfo contains information about the print job
            let printInfo = UIPrintInfo(dictionary: nil)
            printInfo.outputType = .general
            printInfo.jobName = "myPrintJob"
            printController.printInfo = printInfo
                           


            let format = UIMarkupTextPrintFormatter(markupText: textWithNewCarriageReturns)

            format.perPageContentInsets.top = 30
            format.perPageContentInsets.bottom = 30
            format.perPageContentInsets.left = 72
            format.perPageContentInsets.right = 30

            let render = UIPrintPageRenderer()
            render.addPrintFormatter(format, startingAtPageAt: 0)

            // 3. Assign paperRect and printableRect
            let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4, 72 dpi
            render.setValue(page, forKey: "paperRect")
            render.setValue(page, forKey: "printableRect")

            // 4. Create PDF context and draw
            let pdfData = NSMutableData()
            UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)

            for i in 0..<render.numberOfPages {
                UIGraphicsBeginPDFPage();
                render.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
            }

            UIGraphicsEndPDFContext();
              let Filename = "Lieferung_" + global.Stand + global.GetDateAndTimeSeconds()
            // 5. Save PDF file
            guard let outputURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(Filename).appendingPathExtension("pdf")
                else { fatalError("Destination URL not created") }

            pdfData.write(to: outputURL, atomically: true)
      }
    
    
    func PrintAbfuellProtokollPDF(produkte: [Abfuellprodukt], details: AbfuellDetails){
    
        let textWithNewCarriageReturns = GenerateAbfuellprotokoll(produkte: produkte, details: details)
            
        //print(textWithNewCarriageReturns)
        // UIPrintInteractionController presents a user interface and manages the printing
        let printController = UIPrintInteractionController.shared
        printController.showsPaperSelectionForLoadedPapers = true
        //printController.showsPageRange = true
        // UIPrintInfo contains information about the print job
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.outputType = .general
        printInfo.orientation = .landscape
        printInfo.jobName = "Druck des Abfüllprotkolls"
        printController.printInfo = printInfo

        let format = UIMarkupTextPrintFormatter(markupText: textWithNewCarriageReturns)

        format.perPageContentInsets.top = 10
        format.perPageContentInsets.bottom = 0
        format.perPageContentInsets.left = 10
        format.perPageContentInsets.right = 0
        

        printController.printFormatter = format
  
   
     // Present print controller like usual view controller. Also completionHandler is available if needed.
        printController.present(animated: true)
    }
    
    
    func SaveAbfuellProtokollPDF(produkte: [Abfuellprodukt], details: AbfuellDetails){


        let textWithNewCarriageReturns = GenerateAbfuellprotokoll(produkte: produkte, details: details)

        
        
        // UIPrintInteractionController presents a user interface and manages the printing
        let printController = UIPrintInteractionController.shared

        // UIPrintInfo contains information about the print job
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.outputType = .general
        printInfo.orientation = .landscape
        printInfo.jobName = "myPrintJob"
        printController.printInfo = printInfo
                       


        let format = UIMarkupTextPrintFormatter(markupText: textWithNewCarriageReturns)

        format.perPageContentInsets.top = 10
        format.perPageContentInsets.bottom = 0
        format.perPageContentInsets.left = 10
        format.perPageContentInsets.right = 0

        let render = UIPrintPageRenderer()
        render.addPrintFormatter(format, startingAtPageAt: 0)

        // 3. Assign paperRect and printableRect
        let page = CGRect(x: 0, y: 0, width: 792, height: 612) // A4, 72 dpi
        render.setValue(page, forKey: "paperRect")
        render.setValue(page, forKey: "printableRect")

        // 4. Create PDF context and draw
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, CGRect(x: 0, y: 0, width: 792, height: 612), nil)

        for i in 0..<render.numberOfPages {
            UIGraphicsBeginPDFPage();
            render.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
        }

        UIGraphicsEndPDFContext();
          let Filename = "Abfuellung_" + global.GetDateAndTimeSeconds()
        // 5. Save PDF file
        guard let outputURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(Filename).appendingPathExtension("pdf")
            else { fatalError("Destination URL not created") }

        pdfData.write(to: outputURL, atomically: true)
  }
    func SaverohlagerPDF(produkte: [RohEANs]){


        let textWithNewCarriageReturns = GenerateTableRohlager(Lager: produkte)

        
        
        // UIPrintInteractionController presents a user interface and manages the printing
        let printController = UIPrintInteractionController.shared

        // UIPrintInfo contains information about the print job
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.outputType = .general
        printInfo.orientation = .landscape
        printInfo.jobName = "myPrintJob"
        printController.printInfo = printInfo
                       


        let format = UIMarkupTextPrintFormatter(markupText: textWithNewCarriageReturns)

        format.perPageContentInsets.top = 10
        format.perPageContentInsets.bottom = 0
        format.perPageContentInsets.left = 10
        format.perPageContentInsets.right = 0

        let render = UIPrintPageRenderer()
        render.addPrintFormatter(format, startingAtPageAt: 0)

        // 3. Assign paperRect and printableRect
        let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8)
        render.setValue(page, forKey: "paperRect")
        render.setValue(page, forKey: "printableRect")

        // 4. Create PDF context and draw
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, CGRect(x: 0, y: 0, width: 420.0, height: 595.0), nil)

        for i in 0..<render.numberOfPages {
            UIGraphicsBeginPDFPage();
            render.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
        }

        UIGraphicsEndPDFContext();
          let Filename = "Rohlager_Stand_" + global.GetDateAndTimeSeconds()
        // 5. Save PDF file
        guard let outputURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(Filename).appendingPathExtension("pdf")
            else { fatalError("Destination URL not created") }

        pdfData.write(to: outputURL, atomically: true)
  }
    
    func PrintRohlagerPDF(produkte: [RohEANs]){
    
        let textWithNewCarriageReturns = GenerateTableRohlager(Lager: produkte)
            
        //print(textWithNewCarriageReturns)
        // UIPrintInteractionController presents a user interface and manages the printing
        let printController = UIPrintInteractionController.shared
        printController.showsPageRange = false
       // printController.showsPaperSelectionForLoadedPapers = true
        //printController.showsPageRange = true
        // UIPrintInfo contains information about the print job
        let printInfo = UIPrintInfo(dictionary: nil)
        
        printInfo.outputType = .general
        printInfo.orientation = .portrait
        printInfo.jobName = "Druck des Rohlagers"
        printController.printInfo = printInfo

        let format = UIMarkupTextPrintFormatter(markupText: textWithNewCarriageReturns)

        format.perPageContentInsets.top = 10
        format.perPageContentInsets.bottom = 0
        format.perPageContentInsets.left = 10
        format.perPageContentInsets.right = 0
        

        printController.printFormatter = format
  
   
     // Present print controller like usual view controller. Also completionHandler is available if needed.
        printController.present(animated: true)
    }
    
    func PrintProduktionen(produktionen: [ProduktionsEinheit]){
        let textWithNewCarriageReturns = GenerateTableVerarbeitungsbuch(produs: produktionen)
            
        //print(textWithNewCarriageReturns)
        // UIPrintInteractionController presents a user interface and manages the printing
        let printController = UIPrintInteractionController.shared
        printController.showsPaperSelectionForLoadedPapers = true
        //printController.showsPageRange = true
        // UIPrintInfo contains information about the print job
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.outputType = .general
        printInfo.orientation = .landscape
        printInfo.jobName = "Druck des Verarbeitungsbuches"
        printController.printInfo = printInfo

        let format = UIMarkupTextPrintFormatter(markupText: textWithNewCarriageReturns)

        format.perPageContentInsets.top = 0
        format.perPageContentInsets.bottom = 0
        format.perPageContentInsets.left = 0
        format.perPageContentInsets.right = 0
        

        printController.printFormatter = format
  
   
     // Present print controller like usual view controller. Also completionHandler is available if needed.
        printController.present(animated: true)
        
    }
    
    func SaveProduktionen(produktionen: [ProduktionsEinheit]){
        let textWithNewCarriageReturns = GenerateTableVerarbeitungsbuch(produs: produktionen)

        
        
        // UIPrintInteractionController presents a user interface and manages the printing
        let printController = UIPrintInteractionController.shared

        // UIPrintInfo contains information about the print job
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.outputType = .general
        printInfo.orientation = .landscape
        printInfo.jobName = "myPrintJob"
        printController.printInfo = printInfo
                       


        let format = UIMarkupTextPrintFormatter(markupText: textWithNewCarriageReturns)

        format.perPageContentInsets.top = 5
        format.perPageContentInsets.bottom = 0
        format.perPageContentInsets.left = 5
        format.perPageContentInsets.right = 0

        let render = UIPrintPageRenderer()
        render.addPrintFormatter(format, startingAtPageAt: 0)

        // 3. Assign paperRect and printableRect
        let page = CGRect(x: 0, y: 0, width: 792, height: 612) // A4, 72 dpi
        render.setValue(page, forKey: "paperRect")
        render.setValue(page, forKey: "printableRect")

        // 4. Create PDF context and draw
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, CGRect(x: 0, y: 0, width: 792, height: 612), nil)

        for i in 0..<render.numberOfPages {
            UIGraphicsBeginPDFPage();
            render.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
        }

        UIGraphicsEndPDFContext();
          let Filename = "Verarbeitungsbuch_" + global.GetDateAndTimeSeconds()
        // 5. Save PDF file
        guard let outputURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(Filename).appendingPathExtension("pdf")
            else { fatalError("Destination URL not created") }

        pdfData.write(to: outputURL, atomically: true)

        
    }
    func SaveProduktionenExcel(produktionen: [ProduktionsEinheit]){
        let textWithNewCarriageReturns = GenerateTableVerarbeitungsbuch(produs: produktionen)
        writeToDocumentsFile(fileName: "VV.xls", value: textWithNewCarriageReturns)
        
//
//        // UIPrintInteractionController presents a user interface and manages the printing
//        let printController = UIPrintInteractionController.shared
//
//        // UIPrintInfo contains information about the print job
//        let printInfo = UIPrintInfo(dictionary: nil)
//        printInfo.outputType = .general
//        printInfo.orientation = .landscape
//        printInfo.jobName = "myPrintJob"
//        printController.printInfo = printInfo
//
//
//
//        let format = UIMarkupTextPrintFormatter(markupText: textWithNewCarriageReturns)
//
//        format.perPageContentInsets.top = 5
//        format.perPageContentInsets.bottom = 0
//        format.perPageContentInsets.left = 5
//        format.perPageContentInsets.right = 0
//
//        let render = UIPrintPageRenderer()
//        render.addPrintFormatter(format, startingAtPageAt: 0)
//
//        // 3. Assign paperRect and printableRect
//        let page = CGRect(x: 0, y: 0, width: 792, height: 612) // A4, 72 dpi
//        render.setValue(page, forKey: "paperRect")
//        render.setValue(page, forKey: "printableRect")
//
//        // 4. Create PDF context and draw
//        let pdfData = NSMutableData()
//        UIGraphicsBeginPDFContextToData(pdfData, CGRect(x: 0, y: 0, width: 792, height: 612), nil)
//
//        for i in 0..<render.numberOfPages {
//            UIGraphicsBeginPDFPage();
//            render.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
//        }
//
//        UIGraphicsEndPDFContext();
//          let Filename = "Verarbeitungsbuch_" + global.GetDateAndTimeSeconds()
//        // 5. Save PDF file
//        guard let outputURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(Filename).appendingPathExtension("pdf")
//            else { fatalError("Destination URL not created") }
//
//        pdfData.write(to: outputURL, atomically: true)

        
    }
    func writeToDocumentsFile(fileName:String,value:String) {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString?
        let path = documentsPath?.appendingPathComponent(fileName)

        do {
            try value.write(toFile: path!, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("ERROR : writing to file \(path) : \(error.localizedDescription)")
        }
    }
    func GenerateTableVerarbeitungsbuch(produs: [ProduktionsEinheit])-> String{
        let Header =
        """
        <html xmlns:o="urn:schemas-microsoft-com:office:office"
        xmlns:x="urn:schemas-microsoft-com:office:excel"
        xmlns="http://www.w3.org/TR/REC-html40">
        <head>
        <meta http-equiv=Content-Type content="text/html; charset=utf-8">
        <meta name=ProgId content=Excel.Sheet>
        <meta name=Generator content="Microsoft Excel 15">
        <link rel=File-List href="Verarbeitungsbuch.fld/filelist.xml">
        <style id="Verarbeitungsbuch_25517_Styles">
        <!--table
        {mso-displayed-decimal-separator:\",\";
        mso-displayed-thousand-separator:\".\";}
        @page
            {margin:.79in .7in .79in .7in;
            mso-header-margin:.3in;
            mso-footer-margin:.3in;
            mso-page-orientation:landscape;}
        tr
            {mso-height-source:auto;}
        col
            {mso-width-source:auto;}
        br
            {mso-data-placement:same-cell;}
        .style0
            {mso-number-format:General;
            text-align:general;
            vertical-align:bottom;
            white-space:nowrap;
            mso-rotate:0;
            mso-background-source:auto;
            mso-pattern:auto;
            color:black;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:Calibri, sans-serif;
            mso-font-charset:0;
            border:none;
            mso-protection:locked visible;
            mso-style-name:Normal;
            mso-style-id:0;}
        td
            {mso-style-parent:style0;
            padding-top:1px;
            padding-right:1px;
            padding-left:1px;
            mso-ignore:padding;
            color:black;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:Calibri, sans-serif;
            mso-font-charset:0;
            mso-number-format:General;
            text-align:general;
            vertical-align:bottom;
            border:none;
            mso-background-source:auto;
            mso-pattern:auto;
            mso-protection:locked visible;
            white-space:nowrap;
            mso-rotate:0;}
        .xl65
            {mso-style-parent:style0;
            text-align:center;}
        .xl66
            {mso-style-parent:style0;
            font-weight:700;
            text-align:center;
            vertical-align:middle;
            background:#2F75B5;
            mso-pattern:black none;}
        .xl67
            {mso-style-parent:style0;
            font-weight:700;
            text-align:center;
            vertical-align:middle;
            background:#2F75B5;
            mso-pattern:black none;
            white-space:normal;}
        .xl68
            {mso-style-parent:style0;
            mso-number-format:"Short Date";
            text-align:center;}
        .xl69
            {mso-style-parent:style0;
            mso-number-format:General;
            text-align:center;}
        .xl70
            {mso-style-parent:style0;
            font-weight:700;
            mso-number-format:General;
            text-align:center;
            vertical-align:middle;
            background:#2F75B5;
            mso-pattern:black none;
            white-space:normal;}
        .xl71
            {mso-style-parent:style0;
            font-size:48.0pt;
            text-align:center;}
        .xl72
            {mso-style-parent:style0;
            font-size:9.0pt;
            font-weight:700;
            text-align:center;
            vertical-align:middle;
            background:#2F75B5;
            mso-pattern:black none;
            white-space:normal;}
        .xl73
            {mso-style-parent:style0;
            font-size:8.0pt;
            font-weight:700;
            text-align:center;
            vertical-align:middle;
            background:#2F75B5;
            mso-pattern:black none;
            white-space:normal;}
        .xl74
            {mso-style-parent:style0;
            font-size:10.0pt;
            font-weight:700;
            mso-number-format:Fixed;
            text-align:center;
            vertical-align:middle;
            background:#2F75B5;
            mso-pattern:black none;}
        .xl75
            {mso-style-parent:style0;
            font-size:8.0pt;
            font-weight:700;
            text-align:center;
            vertical-align:middle;
            background:#2F75B5;
            mso-pattern:black none;}
        -->
        </style>
        </head>

        <body link="#0563C1" vlink="#954F72">
        <!--[if !excel]>&nbsp;&nbsp;<![endif]-->
        <!--The following information was generated by Microsoft Excel's Publish as Web
        Page wizard.-->
        <!--If the same item is republished from Excel, all information between the DIV
        tags will be replaced.-->
        <!----------------------------->
        <!--START OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD -->
        <!----------------------------->

        <div id="Verarbeitungsbuch_25517" align=center x:publishsource="Excel">

        <table border=0 cellpadding=0 cellspacing=0 width=1495 style='border-collapse:
         collapse;table-layout:fixed;width:1120pt'>
         <col class=xl65 width=40 style='mso-width-source:userset;mso-width-alt:1280;
         width:30pt'>
         <col class=xl65 width=87 style='width:65pt'>
         <col class=xl65 width=243 style='mso-width-source:userset;mso-width-alt:7765;
         width:182pt'>
         <col class=xl69 width=97 style='mso-width-source:userset;mso-width-alt:3114;
         width:73pt'>
         <col class=xl65 width=273 style='mso-width-source:userset;mso-width-alt:8746;
         width:205pt'>
         <col class=xl65 width=75 style='mso-width-source:userset;mso-width-alt:2389;
         width:56pt'>
         <col class=xl65 width=97 style='mso-width-source:userset;mso-width-alt:3114;
         width:73pt'>
         <col class=xl65 width=151 style='mso-width-source:userset;mso-width-alt:4821;
         width:113pt'>
         <col class=xl65 width=84 style='mso-width-source:userset;mso-width-alt:2688;
         width:63pt'>
         <col class=xl65 width=87 span=4 style='mso-width-source:userset;mso-width-alt:
         2773;width:65pt'>
         <tr height=79 style='mso-height-source:userset;height:59.0pt'>
          <td colspan=4 height=79 class=xl71 width=467 style='height:59.0pt;width:350pt'>Verarbeitungsbuch</td>
          <td class=xl65 width=273 style='width:205pt'></td>
          <td class=xl65 width=75 style='width:56pt'></td>
          <td class=xl65 width=97 style='width:73pt'></td>
          <td class=xl65 width=151 style='width:113pt'></td>
          <td class=xl65 width=84 style='width:63pt'></td>
          <td class=xl65 width=87 style='width:65pt'></td>
          <td class=xl65 width=87 style='width:65pt'></td>
          <td class=xl65 width=87 style='width:65pt'></td>
          <td class=xl65 width=87 style='width:65pt'></td>
         </tr>
         <tr height=73 style='mso-height-source:userset;height:55.0pt'>
          <td height=73 class=xl67 width=40 style='height:55.0pt;width:30pt;font-size:
          11.0pt;color:white;font-weight:700;text-decoration:none;text-underline-style:
          none;text-line-through:none;font-family:Calibri, sans-serif;border-top:1.0pt solid black;
          border-right:.5pt solid black;border-bottom:1.0pt solid black;border-left:
          .5pt solid black;background:#2F75B5;mso-pattern:black none'>Lfd. Nr.</td>
          <td class=xl66 style='font-size:11.0pt;color:white;font-weight:700;
          text-decoration:none;text-underline-style:none;text-line-through:none;
          font-family:Calibri, sans-serif;border-top:1.0pt solid black;border-right:
          .5pt solid black;border-bottom:1.0pt solid black;border-left:.5pt solid black;
          background:#2F75B5;mso-pattern:black none'>Datum</td>
          <td class=xl66 style='font-size:11.0pt;color:white;font-weight:700;
          text-decoration:none;text-underline-style:none;text-line-through:none;
          font-family:Calibri, sans-serif;border-top:1.0pt solid black;border-right:
          .5pt solid black;border-bottom:1.0pt solid black;border-left:.5pt solid black;
          background:#2F75B5;mso-pattern:black none'>Art eingesetzten alk. Erzeugnisse</td>
          <td class=xl70 width=97 style='width:73pt;font-size:11.0pt;color:white;
          font-weight:700;text-decoration:none;text-underline-style:none;text-line-through:
          none;font-family:Calibri, sans-serif;border-top:1.0pt solid black;border-right:
          .5pt solid black;border-bottom:1.0pt solid black;border-left:.5pt solid black;
          background:#2F75B5;mso-pattern:black none'>Alk. Erzeugnisse in LA</td>
          <td class=xl66 style='font-size:11.0pt;color:white;font-weight:700;
          text-decoration:none;text-underline-style:none;text-line-through:none;
          font-family:Calibri, sans-serif;border-top:1.0pt solid black;border-right:
          .5pt solid black;border-bottom:1.0pt solid black;border-left:.5pt solid black;
          background:#2F75B5;mso-pattern:black none'>Art hergestellter
          Trinkbranntweine<span style='mso-spacerun:yes'> </span></td>
          <td class=xl67 width=75 style='width:56pt;font-size:11.0pt;color:white;
          font-weight:700;text-decoration:none;text-underline-style:none;text-line-through:
          none;font-family:Calibri, sans-serif;border-top:1.0pt solid black;border-right:
          .5pt solid black;border-bottom:1.0pt solid black;border-left:.5pt solid black;
          background:#2F75B5;mso-pattern:black none'>Tank-Nr. Rohlager</td>
          <td class=xl72 width=97 style='width:73pt;font-size:9.0pt;color:white;
          font-weight:700;text-decoration:none;text-underline-style:none;text-line-through:
          none;font-family:Calibri, sans-serif;border-top:1.0pt solid black;border-right:
          .5pt solid black;border-bottom:1.0pt solid black;border-left:.5pt solid black;
          background:#2F75B5;mso-pattern:black none'>Hergestellte Menge in LA</td>
          <td class=xl75 style='font-size:8.0pt;color:white;font-weight:700;text-decoration:
          none;text-underline-style:none;text-line-through:none;font-family:Calibri, sans-serif;
          border-top:1.0pt solid black;border-right:.5pt solid black;border-bottom:
          1.0pt solid black;border-left:.5pt solid black;background:#2F75B5;mso-pattern:
          black none'>Zusätzliche Inhaltsstoffe</td>
          <td class=xl74 style='font-size:10.0pt;color:white;font-weight:700;
          text-decoration:none;text-underline-style:none;text-line-through:none;
          font-family:Calibri, sans-serif;border-top:1.0pt solid black;border-right:
          .5pt solid black;border-bottom:1.0pt solid black;border-left:.5pt solid black;
          background:#2F75B5;mso-pattern:black none'>Losnummer</td>
          <td class=xl73 width=87 style='width:65pt;font-size:8.0pt;color:white;
          font-weight:700;text-decoration:none;text-underline-style:none;text-line-through:
          none;font-family:Calibri, sans-serif;border-top:1.0pt solid black;border-right:
          .5pt solid black;border-bottom:1.0pt solid black;border-left:.5pt solid black;
          background:#2F75B5;mso-pattern:black none'>Sensorik für Produktfreigabe</td>
          <td class=xl72 width=87 style='width:65pt;font-size:9.0pt;color:white;
          font-weight:700;text-decoration:none;text-underline-style:none;text-line-through:
          none;font-family:Calibri, sans-serif;border-top:1.0pt solid black;border-right:
          .5pt solid black;border-bottom:1.0pt solid black;border-left:.5pt solid black;
          background:#2F75B5;mso-pattern:black none'>Gegenstände sauber?</td>
          <td class=xl73 width=87 style='width:65pt;font-size:8.0pt;color:white;
          font-weight:700;text-decoration:none;text-underline-style:none;text-line-through:
          none;font-family:Calibri, sans-serif;border-top:1.0pt solid black;border-right:
          .5pt solid black;border-bottom:1.0pt solid black;border-left:.5pt solid black;
          background:#2F75B5;mso-pattern:black none'>Rückstellprobe entnommen</td>
          <td class=xl73 width=87 style='width:65pt;font-size:8.0pt;color:white;
          font-weight:700;text-decoration:none;text-underline-style:none;text-line-through:
          none;font-family:Calibri, sans-serif;border-top:1.0pt solid black;border-right:
          .5pt solid black;border-bottom:1.0pt solid black;border-left:.5pt solid black;
          background:#2F75B5;mso-pattern:black none'>Tank vollständig entleert?</td>
         </tr>
        """
        var TableContent = ""
        if produs.count >= 1{
            for i in 0...produs.count-1{
                if i % 2 == 0 {
                    TableContent.append(
                    """
                             <tr height=20 style='height:15.0pt'>
                              <td height=20 class=xl65 style='height:15.0pt;font-size:11.0pt;color:black;
                              font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
                              none;font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                              mso-pattern:#D9D9D9 none'>\(String(produs[i].LfDNr ?? ""))</td>
                              <td class=xl69 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                              mso-pattern:#D9D9D9 none'>\(String(produs[i].Datum))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                              mso-pattern:#D9D9D9 none'>\(String(produs[i].ArtAlkErzeugnisse))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                              mso-pattern:#D9D9D9 none'>\(String(produs[i].MengeAlkErzeugnisse))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                              mso-pattern:#D9D9D9 none'>\(String(produs[i].HergestelltProdukt))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                              mso-pattern:#D9D9D9 none'>\(String(produs[i].TankNr))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                              mso-pattern:#D9D9D9 none'>\(String(produs[i].MengeHergestelltProdukt))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                              mso-pattern:#D9D9D9 none'>\(String(produs[i].Inhaltsstoffe))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                              mso-pattern:#D9D9D9 none'>\(String(produs[i].LosNr))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                              mso-pattern:#D9D9D9 none'>\(String(produs[i].Sensorik))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                              mso-pattern:#D9D9D9 none'>\(String(produs[i].Reinigung))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                              mso-pattern:#D9D9D9 none'>\(String(produs[i].Rueckstell))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                              mso-pattern:#D9D9D9 none'>\(String(produs[i].TankLeer))</td>
                             </tr>

                    """)
                  print("\(i) is even number")
                } else {
                    TableContent.append(
                        """
                             <tr height=20 style='height:15.0pt'>
                              <td height=20 class=xl65 style='height:15.0pt;font-size:11.0pt;color:black;
                              font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
                              none;font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(produs[i].LfDNr ?? ""))</td>
                              <td class=xl69 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(produs[i].Datum))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(produs[i].ArtAlkErzeugnisse))<span
                              style='mso-spacerun:yes'> </span></td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(produs[i].MengeAlkErzeugnisse))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(produs[i].HergestelltProdukt))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(produs[i].TankNr))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(produs[i].MengeHergestelltProdukt))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(produs[i].Inhaltsstoffe))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(produs[i].LosNr))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(produs[i].Sensorik))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(produs[i].Reinigung))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(produs[i].Rueckstell))</td>
                              <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                              text-decoration:none;text-underline-style:none;text-line-through:none;
                              font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(produs[i].TankLeer))</td>
                             </tr>
                       """
                    )
                  print("\(i) is odd number")
                }
                
            }
        }else{
            
        }

   

           let footer =
            """
          <![if supportMisalignedColumns]>
         <tr height=0 style='display:none'>
          <td width=56 style='width:42pt'></td>
          <td width=87 style='width:65pt'></td>
          <td width=284 style='width:213pt'></td>
          <td width=104 style='width:78pt'></td>
          <td width=97 style='width:73pt'></td>
          <td width=389 style='width:292pt'></td>
          <td width=75 style='width:56pt'></td>
          <td width=133 style='width:100pt'></td>
          <td width=229 style='width:172pt'></td>
          <td width=97 style='width:73pt'></td>
          <td width=139 style='width:104pt'></td>
          <td width=168 style='width:126pt'></td>
          <td width=140 style='width:105pt'></td>
          <td width=87 style='width:65pt'></td>
         </tr>
         <![endif]>
        </table>
        </div>
        </body>
        </html>
        """
        
        let textWithNewCarriageReturns = Header + TableContent + footer
        return textWithNewCarriageReturns
        
    }
    
    func GenerateTableRohlager(Lager: [RohEANs])-> String{
        var textWithNewCarriageReturns = ""
        let Header =
        """
        <html xmlns:o="urn:schemas-microsoft-com:office:office"
        xmlns:x="urn:schemas-microsoft-com:office:excel"
        xmlns="http://www.w3.org/TR/REC-html40">
        <head>
        <meta http-equiv=Content-Type content="text/html; charset=utf-8">
        <meta name=ProgId content=Excel.Sheet>
        <meta name=Generator content="Microsoft Excel 15">
        <link rel=File-List href="RohlagerHTML.fld/filelist.xml">
        <style id="RohlagerHTML_17235_Styles">
        <!--table
        {mso-displayed-decimal-separator:\",\";
        mso-displayed-thousand-separator:\".\";}
        @page
            {margin:0in 0in 0in 0in;
            mso-header-margin:.31in;
            mso-footer-margin:.31in;
            mso-page-orientation:landscape;}
        tr
            {mso-height-source:auto;}
        col
            {mso-width-source:auto;}
        br
            {mso-data-placement:same-cell;}
        .style0
            {mso-number-format:General;
            text-align:general;
            vertical-align:bottom;
            white-space:nowrap;
            mso-rotate:0;
            mso-background-source:auto;
            mso-pattern:auto;
            color:black;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:Calibri, sans-serif;
            mso-font-charset:0;
            border:none;
            mso-protection:locked visible;
            mso-style-name:Normal;
            mso-style-id:0;}
        td
            {mso-style-parent:style0;
            padding-top:1px;
            padding-right:1px;
            padding-left:1px;
            mso-ignore:padding;
            color:black;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:Calibri, sans-serif;
            mso-font-charset:0;
            mso-number-format:General;
            text-align:general;
            vertical-align:bottom;
            border:none;
            mso-background-source:auto;
            mso-pattern:auto;
            mso-protection:locked visible;
            white-space:nowrap;
            mso-rotate:0;}
        .xl65
            {mso-style-parent:style0;
            text-align:center;}
        .xl66
            {mso-style-parent:style0;
            font-weight:700;
            text-align:center;
            vertical-align:middle;
            background:#2F75B5;
            mso-pattern:black none;}
        .xl67
            {mso-style-parent:style0;
            mso-number-format:"Short Date";
            text-align:center;}
        .xl68
            {mso-style-parent:style0;
            font-weight:700;
            mso-number-format:General;
            text-align:center;
            vertical-align:middle;
            background:#2F75B5;
            mso-pattern:black none;}
        .xl69
            {mso-style-parent:style0;
            mso-number-format:General;
            text-align:center;}
        .xl70
            {mso-style-parent:style0;
            mso-number-format:General;}
        .xl71
            {mso-style-parent:style0;
            mso-number-format:"mmm\\ yy";
            text-align:center;}
        .xl72
            {mso-style-parent:style0;
            font-size:24.0pt;
            mso-number-format:General;
            text-align:center;}
        -->
        </style>
        </head>
        <body link="#0563C1" vlink="#954F72">
        <div id="RohlagerHTML_17235" align=center x:publishsource="Excel">
        <table border=0 cellpadding=0 cellspacing=0 width=810 style='border-collapse:
         collapse;table-layout:fixed;width:608pt'>
         <col class=xl70 width=133 style='mso-width-source:userset;mso-width-alt:4266;
         width:100pt'>
         <col width=400 style='mso-width-source:userset;mso-width-alt:12800;width:300pt'>
         <col width=77 style='mso-width-source:userset;mso-width-alt:2474;width:58pt'>
         <col width=87 style='mso-width-source:userset;mso-width-alt:2773;width:65pt'>
         <col width=113 style='mso-width-source:userset;mso-width-alt:3626;width:85pt'>
         <col width=87 span=2 style='width:65pt'>
         <col width=208 style='mso-width-source:userset;mso-width-alt:6656;width:156pt'>
         <col width=327 style='mso-width-source:userset;mso-width-alt:10453;width:245pt'>
         <col width=103 style='mso-width-source:userset;mso-width-alt:3285;width:77pt'>
         <col width=119 style='mso-width-source:userset;mso-width-alt:3797;width:89pt'>
         <col width=120 style='mso-width-source:userset;mso-width-alt:3840;width:90pt'>
         <tr height=20 style='height:15.0pt'>
          <td colspan=3 rowspan=2 height=41 class=xl72 width=610 style='height:40.0pt;
          width:458pt'>Rohlager Stand:  \(String(global.GetDateAndTime()))</td>
          <td class=xl65 width=87 style='width:65pt'></td>
          <td class=xl65 width=113 style='width:85pt'></td>
         </tr>
         <tr height=21 style='height:16.0pt'>
          <td height=21 class=xl65 style='height:16.0pt'></td>
          <td class=xl65></td>
         </tr>
         <tr height=21 style='height:16.0pt'>
          <td height=21 class=xl68 style='height:16.0pt;font-size:11.0pt;color:white;
          font-weight:700;text-decoration:none;text-underline-style:none;text-line-through:
          none;font-family:Calibri, sans-serif;border-top:1.0pt solid black;border-right:
          .5pt solid black;border-bottom:1.0pt solid black;border-left:.5pt solid black;
          background:#2F75B5;mso-pattern:black none'>EAN</td>
          <td class=xl66 style='font-size:11.0pt;color:white;font-weight:700;
          text-decoration:none;text-underline-style:none;text-line-through:none;
          font-family:Calibri, sans-serif;border-top:1.0pt solid black;border-right:
          .5pt solid black;border-bottom:1.0pt solid black;border-left:.5pt solid black;
          background:#2F75B5;mso-pattern:black none'>Produktbezeichnung</td>
          <td class=xl66 style='font-size:11.0pt;color:white;font-weight:700;
          text-decoration:none;text-underline-style:none;text-line-through:none;
          font-family:Calibri, sans-serif;border-top:1.0pt solid black;border-right:
          .5pt solid black;border-bottom:1.0pt solid black;border-left:.5pt solid black;
          background:#2F75B5;mso-pattern:black none'>TankNr.</td>
          <td class=xl66 style='font-size:11.0pt;color:white;font-weight:700;
          text-decoration:none;text-underline-style:none;text-line-through:none;
          font-family:Calibri, sans-serif;border-top:1.0pt solid black;border-right:
          .5pt solid black;border-bottom:1.0pt solid black;border-left:.5pt solid black;
          background:#2F75B5;mso-pattern:black none'>Füllstand</td>
          <td class=xl66 style='font-size:11.0pt;color:white;font-weight:700;
          text-decoration:none;text-underline-style:none;text-line-through:none;
          font-family:Calibri, sans-serif;border-top:1.0pt solid black;border-right:
          .5pt solid black;border-bottom:1.0pt solid black;border-left:.5pt solid black;
          background:#2F75B5;mso-pattern:black none'>Losnummer</td>
         </tr>
        """
        var TableContent = ""
        if Lager.count >= 1{
            for i in 0...Lager.count-1{
                if i % 2 == 0 {
                    TableContent.append(
                    """
                     <tr height=20 style='height:15.0pt'>
                      <td height=20 class=xl69 style='height:15.0pt;font-size:11.0pt;color:black;
                      font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
                      none;font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                      mso-pattern:#D9D9D9 none'> \(String(Lager[i].EAN))</td>
                      <td class=xl67 style='font-size:11.0pt;color:black;font-weight:400;
                      text-decoration:none;text-underline-style:none;text-line-through:none;
                      font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                      mso-pattern:#D9D9D9 none'>\(String(Lager[i].ProduktName))</td>
                      <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                      text-decoration:none;text-underline-style:none;text-line-through:none;
                      font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                      mso-pattern:#D9D9D9 none'>\(String(Lager[i].TankNr))</td>
                      <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                      text-decoration:none;text-underline-style:none;text-line-through:none;
                      font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                      mso-pattern:#D9D9D9 none'>\(String(Lager[i].IstBestand))</td>
                      <td class=xl71 style='font-size:11.0pt;color:black;font-weight:400;
                      text-decoration:none;text-underline-style:none;text-line-through:none;
                      font-family:Calibri, sans-serif;border:.5pt solid black;background:#D9D9D9;
                      mso-pattern:#D9D9D9 none'>\(String(Lager[i].LosNr))</td>
                     </tr>
                    """)
                  print("\(i) is even number")
                } else {
                    TableContent.append(
                        """
                                <tr height=20 style='height:15.0pt'>
                                 <td height=20 class=xl69 style='height:15.0pt;font-size:11.0pt;color:black;
                                 font-weight:400;text-decoration:none;text-underline-style:none;text-line-through:
                                 none;font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(Lager[i].EAN))</td>
                                 <td class=xl67 style='font-size:11.0pt;color:black;font-weight:400;
                                 text-decoration:none;text-underline-style:none;text-line-through:none;
                                 font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(Lager[i].ProduktName))</td>
                                 <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                                 text-decoration:none;text-underline-style:none;text-line-through:none;
                                 font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(Lager[i].TankNr))</td>
                                 <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                                 text-decoration:none;text-underline-style:none;text-line-through:none;
                                 font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(Lager[i].IstBestand))</td>
                                 <td class=xl65 style='font-size:11.0pt;color:black;font-weight:400;
                                 text-decoration:none;text-underline-style:none;text-line-through:none;
                                 font-family:Calibri, sans-serif;border:.5pt solid black'>\(String(Lager[i].LosNr))</td>
                                </tr>
                       """
                    )
                  print("\(i) is odd number")
                }
                
            }
        }else{
            
        }

        let Footer = """
         <![if supportMisalignedColumns]>
         <tr height=0 style='display:none'>
          <td width=133 style='width:100pt'></td>
          <td width=199 style='width:149pt'></td>
          <td width=77 style='width:58pt'></td>
          <td width=87 style='width:65pt'></td>
          <td width=113 style='width:85pt'></td>
         </tr>
         <![endif]>
        </table>
        </div>
        </body>
        </html>
        """

        
        textWithNewCarriageReturns = Header + TableContent + Footer
        return textWithNewCarriageReturns
    }
    
    func GenerateAbfuellprotokoll(produkte: [Abfuellprodukt], details: AbfuellDetails)-> String{
        var textWithNewCarriageReturns = ""
        let Header = """
        <html xmlns:o=\"urn:schemas-microsoft-com:office:office\"
        xmlns:x=\"urn:schemas-microsoft-com:office:excel\"
        xmlns=\"http://www.w3.org/TR/REC-html40\">
        <head>
        <meta http-equiv=Content-Type content=\"text/html; charset=utf-8\">
        <meta name=ProgId content=Excel.Sheet>
        <meta name=Generator content=\"Microsoft Excel 15\">
        <link rel=File-List href=\"Füllplan_final.fld/filelist.xml\">
        <style id=\"Füllplan_final_12304_Styles\">
        <!--table
            {mso-displayed-decimal-separator:\",\";
            mso-displayed-thousand-separator:\".\";}
        @page
            {mso-footer-data:\"&L&F&CFreigegeben: Maximilian Wild\";
            margin:.51in .2in .39in .2in;
            mso-header-margin:.51in;
            mso-footer-margin:.51in;
            mso-page-orientation:landscape;
            mso-horizontal-page-align:center;}
        tr
            {mso-height-source:auto;}
        col
            {mso-width-source:auto;}
        br
            {mso-data-placement:same-cell;}
        .style0
            {mso-number-format:General;
            text-align:general;
            vertical-align:bottom;
            white-space:nowrap;
            mso-rotate:0;
            mso-background-source:auto;
            mso-pattern:auto;
            color:windowtext;
            font-size:10.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:Arial;
            mso-generic-font-family:auto;
            mso-font-charset:0;
            border:none;
            mso-protection:locked visible;
            mso-style-name:Normal;
            mso-style-id:0;}
        .style17
            {mso-number-format:0%;
            mso-style-name:\"Per cent\";
            mso-style-id:5;}
        .style18
            {mso-number-format:General;
            text-align:general;
            vertical-align:bottom;
            white-space:nowrap;
            mso-rotate:0;
            mso-background-source:auto;
            mso-pattern:auto;
            color:windowtext;
            font-size:12.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            border:none;
            mso-protection:locked visible;
            mso-style-name:Standard_Tabelle1;}
        td
            {mso-style-parent:style0;
            padding-top:1px;
            padding-right:1px;
            padding-left:1px;
            mso-ignore:padding;
            color:windowtext;
            font-size:10.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:Arial;
            mso-generic-font-family:auto;
            mso-font-charset:0;
            mso-number-format:General;
            text-align:general;
            vertical-align:bottom;
            border:none;
            mso-background-source:auto;
            mso-pattern:auto;
            mso-protection:locked visible;
            white-space:nowrap;
            mso-rotate:0;}
        .xl67
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;}
        .xl68
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            border:.5pt solid windowtext;}
        .xl69
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:Fixed;}
        .xl70
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:none;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl71
            {mso-style-parent:style18;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:Fixed;
            text-align:center;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:none;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl72
            {mso-style-parent:style18;
            font-size:8.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:none;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl73
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:none;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl74
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            border:.5pt solid windowtext;}
        .xl75
            {mso-style-parent:style17;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:\"0.0%\";
            text-align:center;
            border:.5pt solid windowtext;}
        .xl76
            {mso-style-parent:style18;
            font-size:8.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:0;
            text-align:center;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:none;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl77
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:0;
            text-align:right;}
        .xl78
            {mso-style-parent:style0;
            mso-number-format:0;}
        .xl79
            {mso-style-parent:style0;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:0;
            text-align:center;
            border:.5pt solid windowtext;}
        .xl80
            {mso-style-parent:style18;
            font-size:7.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:none;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl81
            {mso-style-parent:style0;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:0;
            text-align:center;
            border:.5pt solid windowtext;
            white-space:normal;}
        .xl82
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;}
        .xl83
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-style:italic;
            font-family:Arial, sans-serif;
            mso-font-charset:0;}
        .xl84
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:Fixed;}
        .xl85
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:0;
            text-align:right;
            border-top:none;
            border-right:none;
            border-bottom:1.0pt solid windowtext;
            border-left:none;}
        .xl86
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            border-top:none;
            border-right:none;
            border-bottom:1.0pt solid windowtext;
            border-left:none;}
        .xl87
            {mso-style-parent:style0;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;}
        .xl88
            {mso-style-parent:style0;
            text-align:center;
            vertical-align:middle;}
        .xl89
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            vertical-align:middle;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:none;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl90
            {mso-style-parent:style0;
            font-family:Arial, sans-serif;
            mso-font-charset:0;}
        .xl91
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:0;
            text-align:right;}
        .xl92
            {mso-style-parent:style18;
            font-family:Arial, sans-serif;
            mso-font-charset:0;}
        .xl93
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:left;
            vertical-align:top;
            border-top:1.0pt solid windowtext;
            border-right:none;
            border-bottom:1.0pt solid windowtext;
            border-left:1.0pt solid windowtext;}
        .xl94
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:left;
            vertical-align:top;
            border-top:1.0pt solid windowtext;
            border-right:none;
            border-bottom:1.0pt solid windowtext;
            border-left:none;}
        .xl95
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            border-top:.5pt solid windowtext;
            border-right:none;
            border-bottom:.5pt solid windowtext;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl96
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;
            border-left:none;
            background:white;
            mso-pattern:black none;}
        .xl97
            {mso-style-parent:style18;
            font-size:8.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:0;
            text-align:center;
            vertical-align:middle;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:none;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl98
            {mso-style-parent:style18;
            font-size:8.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:0;
            text-align:center;
            vertical-align:middle;
            border-top:none;
            border-right:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl99
            {mso-style-parent:style18;
            font-size:8.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            vertical-align:middle;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:none;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl100
            {mso-style-parent:style18;
            font-size:8.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            vertical-align:middle;
            border-top:none;
            border-right:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl101
            {mso-style-parent:style18;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:Fixed;
            text-align:center;
            vertical-align:middle;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:none;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl102
            {mso-style-parent:style18;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:Fixed;
            text-align:center;
            vertical-align:middle;
            border-top:none;
            border-right:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl103
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            vertical-align:middle;
            border-top:none;
            border-right:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl104
            {mso-style-parent:style18;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            vertical-align:middle;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:none;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl105
            {mso-style-parent:style18;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            vertical-align:middle;
            border-top:none;
            border-right:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl106
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:Fixed;
            border-top:none;
            border-right:none;
            border-bottom:1.0pt solid windowtext;
            border-left:none;}
        .xl107
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            border-top:.5pt solid windowtext;
            border-right:none;
            border-bottom:none;
            border-left:none;}
        .xl108
            {mso-style-parent:style18;
            font-size:8.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            vertical-align:middle;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:none;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;
            white-space:normal;}
        .xl109
            {mso-style-parent:style18;
            font-size:8.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            vertical-align:middle;
            border-top:none;
            border-right:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;
            white-space:normal;}
        .xl110
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:Fixed;
            border-top:none;
            text-align:center;
            border-right:1.0pt solid windowtext;
            border-bottom:1.0pt solid windowtext;
            border-left:1.0pt solid windowtext;}
        .xl111
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            mso-number-format:Fixed;
            border:1.0pt solid windowtext;}
        .xl112
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:left;
            vertical-align:top;
            border-top:1.0pt solid windowtext;
            border-right:1.0pt solid windowtext;
            border-bottom:1.0pt solid windowtext;
            border-left:none;}
        .xl113
            {mso-style-parent:style0;
            font-size:36.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:left;
            border-top:1.0pt solid windowtext;
            border-right:none;
            border-bottom:1.0pt solid windowtext;
            border-left:1.0pt solid windowtext;}
        .xl114
            {mso-style-parent:style0;
            font-size:36.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:left;
            border-top:1.0pt solid windowtext;
            border-right:none;
            border-bottom:1.0pt solid windowtext;
            border-left:none;}
        .xl115
            {mso-style-parent:style0;
            font-size:36.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:left;
            border-top:1.0pt solid windowtext;
            border-right:1.0pt solid windowtext;
            border-bottom:1.0pt solid windowtext;
            border-left:none;}
        .xl116
            {mso-style-parent:style18;
            font-size:14.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:left;
            border-top:1.0pt solid windowtext;
            border-right:none;
            border-bottom:.5pt solid windowtext;
            border-left:1.0pt solid windowtext;
            background:#00CCFF;
            mso-pattern:black none;}
        .xl117
            {mso-style-parent:style18;
            font-size:14.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:left;
            border-top:1.0pt solid windowtext;
            border-right:none;
            border-bottom:.5pt solid windowtext;
            border-left:none;
            background:#00CCFF;
            mso-pattern:black none;}
        .xl118
            {mso-style-parent:style18;
            font-size:14.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:left;
            border-top:1.0pt solid windowtext;
            border-right:1.0pt solid windowtext;
            border-bottom:.5pt solid windowtext;
            border-left:none;
            background:#00CCFF;
            mso-pattern:black none;}
        .xl119
            {mso-style-parent:style18;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            vertical-align:middle;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:none;
            border-left:1.0pt solid windowtext;
            background:white;
            mso-pattern:black none;
            white-space:normal;}
        .xl120
            {mso-style-parent:style18;
            font-size:8.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            vertical-align:middle;
            border-top:.5pt solid windowtext;
            border-right:1.0pt solid windowtext;
            border-bottom:none;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;
            white-space:normal;}
        .xl121
            {mso-style-parent:style18;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            vertical-align:middle;
            border-top:none;
            border-right:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;
            border-left:1.0pt solid windowtext;
            background:white;
            mso-pattern:black none;
            white-space:normal;}
        .xl122
            {mso-style-parent:style18;
            font-size:8.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            vertical-align:middle;
            border-top:none;
            border-right:1.0pt solid windowtext;
            border-bottom:.5pt solid windowtext;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;
            white-space:normal;}
        .xl123
            {mso-style-parent:style18;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;
            border-left:1.0pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl124
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            text-align:center;
            border-top:.5pt solid windowtext;
            border-right:1.0pt solid windowtext;
            border-bottom:.5pt solid windowtext;
            border-left:.5pt solid windowtext;
            background:white;
            mso-pattern:black none;}
        .xl125
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;
            border-left:1.0pt solid windowtext;}
        .xl126
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-weight:700;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            border-top:.5pt solid windowtext;
            border-right:1.0pt solid windowtext;
            border-bottom:.5pt solid windowtext;
            border-left:.5pt solid windowtext;}
        .xl127
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            border-top:.5pt solid windowtext;
            border-right:none;
            border-bottom:none;
            border-left:1.0pt solid windowtext;}
        .xl128
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            border-top:none;
            border-right:1.0pt solid windowtext;
            border-bottom:none;
            border-left:none;}
        .xl129
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            border-top:none;
            border-right:none;
            border-bottom:none;
            border-left:1.0pt solid windowtext;}
        .xl130
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            border-top:none;
            border-right:none;
            border-bottom:1.0pt solid windowtext;
            border-left:1.0pt solid windowtext;}
        .xl131
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            border-top:none;
            border-right:1.0pt solid windowtext;
            border-bottom:1.0pt solid windowtext;
            border-left:none;}
        .xl132
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            border-top:1.0pt solid windowtext;
            border-right:none;
            border-bottom:1.0pt solid windowtext;
            border-left:1.0pt solid windowtext;}
        .xl133
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            border-top:1.0pt solid windowtext;
            border-right:none;
            border-bottom:1.0pt solid windowtext;
            border-left:none;}
        .xl134
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:Fixed;
            border-top:1.0pt solid windowtext;
            border-right:none;
            border-bottom:1.0pt solid windowtext;
            border-left:none;}
        .xl135
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:0;
            text-align:right;
            border-top:1.0pt solid windowtext;
            border-right:none;
            border-bottom:1.0pt solid windowtext;
            border-left:none;}
        .xl136
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            border-top:1.0pt solid windowtext;
            border-right:1.0pt solid windowtext;
            border-bottom:1.0pt solid windowtext;
            border-left:none;}
        .xl137
            {mso-style-parent:style18;
            font-size:12.0pt;
            font-family:Arial, sans-serif;
            mso-font-charset:0;
            mso-number-format:Fixed;
            text-align:center;
            vertical-align:middle;}
        -->
        </style>
        </head>
        <body link=blue vlink=purple>
        <div id=\"Füllplan_final_12304\" align=center x:publishsource=\"Excel\">
        <table border=0 cellpadding=0 cellspacing=0 width=1500 style='border-collapse:
         collapse;table-layout:fixed;width:1124pt'>
         <col width=48 style='mso-width-source:userset;mso-width-alt:1536;width:36pt'>
         <col width=276 style='mso-width-source:userset;mso-width-alt:8832;width:207pt'>
         <col width=104 style='mso-width-source:userset;mso-width-alt:3328;width:78pt'>
         <col width=59 style='mso-width-source:userset;mso-width-alt:1877;width:44pt'>
         <col width=88 span=2 style='mso-width-source:userset;mso-width-alt:2816;
         width:66pt'>
         <col class=xl78 width=108 style='mso-width-source:userset;mso-width-alt:3456;
         width:81pt'>
         <col width=93 style='mso-width-source:userset;mso-width-alt:2986;width:70pt'>
         <col width=87 style='mso-width-source:userset;mso-width-alt:2773;width:65pt'>
         <col width=64 span=2 style='mso-width-source:userset;mso-width-alt:2048;
         width:48pt'>
         <col width=73 style='mso-width-source:userset;mso-width-alt:2346;width:55pt'>
         <col width=87 span=4 style='width:65pt'>
         <tr height=61 style='mso-height-source:userset;height:46.0pt'>
          <td colspan=12 height=61 class=xl113 width=1152 style='border-right:1.0pt solid black;
          height:46.0pt;width:864pt'><a name=\"Print_Area\">Abfüllprotokoll</a></td>
          <td width=87 style='width:65pt'></td>
          <td width=87 style='width:65pt'></td>
          <td width=87 style='width:65pt'></td>
          <td width=87 style='width:65pt'></td>
         </tr>
         <tr height=21 style='mso-height-source:userset;height:16.0pt'>
          <td colspan=12 height=21 class=xl116 style='border-right:1.0pt solid black;
          height:16.0pt'>Abgefüllt am: \(String(GetDateandTime(Date: details.AbfuellungsID)))</td>
          <td colspan=4 style='mso-ignore:colspan'></td>
         </tr>
         <tr height=21 style='height:16.0pt'>
          <td rowspan=2 height=42 class=xl119 width=48 style='border-bottom:.5pt solid black;
          height:32.0pt;border-top:none;width:36pt'>Prod. Linie</td>
          <td rowspan=2 class=xl104 style='border-bottom:.5pt solid black;border-top:
          none'>Produktname</td>
          <td rowspan=2 class=xl104 style='border-bottom:.5pt solid black;border-top:
          none'>Flaschengröße</td>
          <td rowspan=2 class=xl89 style='border-bottom:.5pt solid black;border-top:
          none'>% Vol.</td>
          <td rowspan=2 class=xl89 style='border-bottom:.5pt solid black;border-top:
          none'>Los-Nr.</td>
          <td rowspan=2 class=xl101 style='border-bottom:.5pt solid black;border-top:
          none'>Tank-Nr.</td>
          <td rowspan=2 class=xl97 style='border-bottom:.5pt solid black;border-top:
          none'>Abgefüllte Menge</td>
          <td rowspan=2 class=xl99 style='border-bottom:.5pt solid black;border-top:
          none'>Flaschenanzahl</td>
          <td rowspan=2 class=xl108 width=87 style='border-bottom:.5pt solid black;
          border-top:none;width:65pt'>Rückstellprobe entnommen</td>
          <td colspan=2 class=xl95 style='border-right:.5pt solid black;border-left:
          none'>Flaschenbruch</td>
          <td rowspan=2 class=xl120 width=73 style='border-bottom:.5pt solid black;
          border-top:none;width:55pt'>Abfüllanlage gereinigt</td>
          <td colspan=4 style='mso-ignore:colspan'></td>
         </tr>
         <tr class=xl88 height=21 style='height:16.0pt'>
          <td height=21 class=xl89 style='border-bottom:.5pt solid black;height:16.0pt;border-top:none;border-left:
          none'>leer</td>
          <td class=xl89 style='border-bottom:.5pt solid black;border-top:none;border-left:none'>voll</td>
          <td class=xl88></td>
          <td class=xl88></td>
          <td class=xl88></td>
          <td class=xl88></td>
         </tr>
        """
        
        var TableConten = ""
        if produkte.count > 0{
        for i in 0...produkte.count-1{
            let tablestring = """
         <tr height=21 style='height:16.0pt'>
          <td height=21 class=xl123 style='height:16.0pt;border-top:none'>\(produkte[i].ProdLinie)</td>
          <td class=xl70 style='border-bottom:.5pt solid black;border-top:none;border-left:none'>\(produkte[i].ProduktName)</td>
          <td class=xl73 style='border-bottom:.5pt solid black;border-top:none;border-left:none'>\(produkte[i].Flaschengr)</td>
          <td class=xl73 style='border-bottom:.5pt solid black;border-top:none;border-left:none'>\(produkte[i].Alk)</td>
          <td class=xl73 style='border-bottom:.5pt solid black;border-top:none;border-left:none'>\(produkte[i].LosNr)</td>
          <td class=xl73 style='border-bottom:.5pt solid black;border-top:none;border-left:none'>\(produkte[i].tankNr)</td>
          <td class=xl73 style='border-bottom:.5pt solid black;border-top:none;border-left:none'>\(produkte[i].AbfuellMenge)</td>
          <td class=xl73 style='border-bottom:.5pt solid black;border-top:none;border-left:none'>\(produkte[i].Flaschenanzahl)</td>
          <td class=xl73 style='border-bottom:.5pt solid black;border-top:none;border-left:none'>\(produkte[i].Rueckstell)</td>
          <td class=xl73 style='border-bottom:.5pt solid black;border-top:none;border-left:none'>\(produkte[i].Voll)</td>
          <td class=xl124 style='border-bottom:.5pt solid black;border-top:none;border-left:none'>\(produkte[i].Leer)</td>
          <td class=xl70 style='border-bottom:.5pt solid black;border-top:none;border-left:none'>\(produkte[i].Reinigung)</td>
          <td colspan=4 style='mso-ignore:colspan'></td>
         </tr>
        """
            TableConten.append(tablestring)
        }
        }
        
        let Footer = """
         <tr height=21 style='height:16.0pt'>
          <td colspan=5 height=21 class=xl127 style='height:16.0pt'>Name Abfüller
          : \(global.Producer[0])</td>
          <td class=xl84 colspan=3 style='mso-ignore:colspan'>Unterschrift:_______________</td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl128>&nbsp;</td>
          <td colspan=4 style='mso-ignore:colspan'></td>
         </tr>
         <tr height=21 style='height:16.0pt'>
          <td height=21 class=xl129 colspan=3 style='height:16.0pt;mso-ignore:colspan'>Produktionsleitername: \(global.Producer[1])<span
          style='mso-spacerun:yes'> </span></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl84 colspan=3 style='mso-ignore:colspan'>Unterschrift:_______________</td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl128>&nbsp;</td>
          <td colspan=4 style='mso-ignore:colspan'></td>
         </tr>
         <tr height=21 style='height:16.0pt'>
          <td height=21 class=xl129 colspan=3 style='height:16.0pt;mso-ignore:colspan'>Füllmengenkontrolle
          Bearbeiter: \(global.Producer[0])<span style='mso-spacerun:yes'> </span></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl84 colspan=3 style='mso-ignore:colspan'>Unterschrift:_______________</td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl128>&nbsp;</td>
          <td colspan=4 style='mso-ignore:colspan'></td>
         </tr>
         <tr height=23 style='height:17.0pt'>
          <td height=23 class=xl129 style='height:17.0pt'>&nbsp;</td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl137>Antwort:</td>
          <td class=xl91></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl128>&nbsp;</td>
          <td colspan=4 style='mso-ignore:colspan'></td>
         </tr>
         <tr height=23 style='height:17.0pt'>
          <td height=23 class=xl129 colspan=3 style='height:17.0pt;mso-ignore:colspan'>Füllmengenkontrolle-&gt;
          Ordnungsgemäße Ausführung?</td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl111>\(details.FuellMengenKonrolle)</td>
          <td class=xl91></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl128>&nbsp;</td>
          <td colspan=4 style='mso-ignore:colspan'></td>
         </tr>
         <tr height=24 style='mso-height-source:userset;height:18.75pt'>
          <td height=24 class=xl129 colspan=3 style='height:18.75pt;mso-ignore:colspan'>Produktionskontrolle-&gt;
          Ordnungsgemäße Ausführung?</td>
          <td class=xl92></td>
          <td class=xl82></td>
          <td class=xl111 style='border-top:none'>\(details.ProduktionsKontrolle)</td>
          <td class=xl91></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl128></td>
          <td colspan=4 style='mso-ignore:colspan'></td>
         </tr>
         <tr height=23 style='height:17.0pt'>
          <td height=23 class=xl129 colspan=3 style='height:17.0pt;mso-ignore:colspan'>Reinhaltung-&gt;
          Arbeitsplatz und Gerätschaft gereinigt?</td>
          <td class=xl92></td>
          <td class=xl82></td>
          <td class=xl110>\(details.Reinhaltung)</td>
          <td class=xl91></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl128>&nbsp;</td>
          <td colspan=4 style='mso-ignore:colspan'></td>
         </tr>
         <tr height=21 style='height:16.0pt'>
          <td height=21 class=xl129 colspan=6 style='height:16.0pt;mso-ignore:colspan'>Wenn
          NEIN angekreuzt wird, bitte sofort einen Bericht an die Geschäftsleitung
          einreichen!</td>
          <td class=xl91></td>
          <td class=xl92></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl82></td>
          <td class=xl128>&nbsp;</td>
          <td colspan=4 style='mso-ignore:colspan'></td>
         </tr>
         <tr height=23 style='height:17.0pt'>
          <td height=23 class=xl130 style='height:17.0pt'>&nbsp;</td>
          <td class=xl86>&nbsp;</td>
          <td class=xl86>&nbsp;</td>
          <td class=xl86>&nbsp;</td>
          <td class=xl86>&nbsp;</td>
          <td class=xl106>&nbsp;</td>
          <td class=xl85>&nbsp;</td>
          <td class=xl86>&nbsp;</td>
          <td class=xl86>&nbsp;</td>
          <td class=xl86>&nbsp;</td>
          <td class=xl86>&nbsp;</td>
          <td class=xl131>&nbsp;</td>
          <td colspan=4 style='mso-ignore:colspan'></td>
         </tr>
         <tr height=133 style='page-break-before:always;mso-height-source:userset;
          height:100.0pt'>
          <td colspan=12 height=133 class=xl93 style='border-right:1.0pt solid black;
          height:100.0pt'>Besondere Vorfälle:<br> \(details.BesondereVorfaelle)</td>
          <td colspan=4 style='mso-ignore:colspan'></td>
         </tr>
         <tr height=23 style='height:17.0pt'>
          <td height=23 class=xl132 colspan=6 style='height:17.0pt;mso-ignore:colspan'>Produktionsbericht
          überprüft und eingegeben von: \(global.Producer[0]) Unterschrift:_______________</td>
          <td class=xl135 style='border-top:none'>&nbsp;</td>
          <td class=xl133 style='border-top:none'>&nbsp;</td>
          <td class=xl133 style='border-top:none'>&nbsp;</td>
          <td class=xl133 style='border-top:none'>&nbsp;</td>
          <td class=xl133 style='border-top:none'>&nbsp;</td>
          <td class=xl136 style='border-top:none'>&nbsp;</td>
          <td></td>
          <td colspan=3 style='mso-ignore:colspan'></td>
         </tr>
         <tr height=21 style='height:16.0pt'>
          <td height=21 class=xl67 style='height:16.0pt'></td>
          <td class=xl67></td>
          <td class=xl67></td>
          <td class=xl67></td>
          <td class=xl67></td>
          <td class=xl69></td>
          <td class=xl77></td>
          <td class=xl67></td>
          <td class=xl67></td>
          <td class=xl67></td>
          <td class=xl67></td>
          <td class=xl67></td>
          <td colspan=4 style='mso-ignore:colspan'></td>
         </tr>
         <tr height=21 style='height:16.0pt'>
          <td height=21 class=xl67 style='height:16.0pt'></td>
          <td class=xl67></td>
          <td class=xl67></td>
          <td class=xl67></td>
          <td></td>
          <td class=xl69></td>
          <td class=xl77></td>
          <td class=xl67></td>
          <td class=xl67></td>
          <td class=xl67></td>
          <td class=xl67></td>
          <td class=xl67></td>
          <td colspan=4 style='mso-ignore:colspan'></td>
         </tr>
         <tr height=17 style='height:13.0pt'>
          <td height=17 colspan=6 style='height:13.0pt;mso-ignore:colspan'></td>
          <td class=xl78></td>
          <td colspan=9 style='mso-ignore:colspan'></td>
         </tr>
         <tr height=17 style='height:13.0pt'>
          <td height=17 class=xl87 style='height:13.0pt'></td>
          <td colspan=5 style='mso-ignore:colspan'></td>
          <td class=xl78></td>
          <td colspan=9 style='mso-ignore:colspan'></td>
         </tr>
         <![if supportMisalignedColumns]>
         <tr height=0 style='display:none'>
          <td width=48 style='width:36pt'></td>
          <td width=276 style='width:207pt'></td>
          <td width=104 style='width:78pt'></td>
          <td width=59 style='width:44pt'></td>
          <td width=88 style='width:66pt'></td>
          <td width=88 style='width:66pt'></td>
          <td width=108 style='width:81pt'></td>
          <td width=93 style='width:70pt'></td>
          <td width=87 style='width:65pt'></td>
          <td width=64 style='width:48pt'></td>
          <td width=64 style='width:48pt'></td>
          <td width=73 style='width:55pt'></td>
          <td width=87 style='width:65pt'></td>
          <td width=87 style='width:65pt'></td>
          <td width=87 style='width:65pt'></td>
          <td width=87 style='width:65pt'></td>
         </tr>
         <![endif]>
        </table>
        </div>
        </body>
        </html>
        """
        
        
        
        
        
        textWithNewCarriageReturns = Header + TableConten + Footer
        return textWithNewCarriageReturns
    }
    
    func GetDateandTime(Date: String) -> String{
        print(Date)
        var date = Array(Date)
        if date.isEmpty{
            return ""
        }else{
            print(date)
            var filterString = ""
            for i in 0...15{
                
                if i > 3{
                    filterString.append(date[i])
                    if i == 5{
                        filterString.append(".")
                    }
                    if i == 7{
                        filterString.append(".")
                    }
                    
                    if i == 11{
                        filterString.append(" ")
                    }
                    if i == 13{
                        filterString.append(":")
                    }
//                    if i == 15{
//                        filterString.append(":")
//                    }
                    
                }
                
            }
            print(filterString)
            return String(filterString)}

    }
}
