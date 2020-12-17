//
//  FacturaViewController.swift
//  examen1
//
//  Created by klevert herrera sanchez on 12/17/20.
//

import UIKit

class FacturaViewController: UIViewController {

    @IBOutlet var vistaWeb: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostrarRecurso()
        habilitarZoom()

        // Do any additional setup after loading the view.
    }
    
    func mostrarRecurso(){
        var nombrepdf = "factura"
        let direccionRecurso = URL(fileURLWithPath: Bundle.main.path(forResource: nombrepdf, ofType: "pdf", inDirectory: "RECURSOS")!)
        let datos = try? Data(contentsOf: direccionRecurso)
        
        vistaWeb.load(datos! , mimeType: "application/pdf", textEncodingName: "utf-8", baseURL: direccionRecurso)
    }
    
    func habilitarZoom(){
        vistaWeb.scalesPageToFit = true
    }
    
    
    

}
