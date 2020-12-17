//
//  DetallesViewController.swift
//  examen1
//
//  Created by klevert herrera sanchez on 12/16/20.
//

import UIKit

class DetallesViewController: UIViewController {
    
    //objetos de la vista
    
    @IBOutlet weak var precioProductoTxt: UILabel!
    @IBOutlet weak var cantidadProductoTxt: UILabel!
    @IBOutlet weak var totalProductoTxt: UILabel!
    @IBOutlet weak var mensajeStockTxt: UILabel!
    @IBOutlet weak var nombreProductoTxt: UILabel!
    @IBOutlet weak var tallaProductoTxt: UILabel!
    
    //varibales para procesar datos
    var precioProducto:Double = 0
    var tallaProducto:String = "0"
    var cantidadProducto:Int = 0
    var nombreProducto:String = ""
    var modeloProducto:String = ""
    
    
    enum Tallaenum{
        case valido
        case tallaProducto(t:String)
    }
    
    
    @IBOutlet weak var txtPrecio: UILabel!
    

    override func viewDidLoad() {
        
        var total:Double = precioProducto * Double(cantidadProducto)
        
        super.viewDidLoad()
        var stock:Bool = true
        switch modeloProducto {
        case "00-A":
            stock = false
            break
        case "00-B":
            stock = true
            break
        
        case "00-C":
            stock = false
            break
        case "00-D":
            stock = true
            break
        default:
            print("No se ha seleccionado ningun modelo")
        }
        
        if !stock {
            let talla = Tallaenum.valido
            
            switch talla {
            case .valido:
                print("No tenemos stock")
                nombreProductoTxt.text = nombreProducto
                tallaProductoTxt.text = tallaProducto
                mensajeStockTxt.text = "NO TENEMOS STOCK"
                precioProductoTxt.text = String(precioProducto)
                cantidadProductoTxt.text = String(cantidadProducto)
                totalProductoTxt.text = String(total)
                break
            case .tallaProducto(t: _):
                print("Sin talla")
            }
            
            //Dibujamos el boton para regresar
            let botonRegresar = UIButton(frame: CGRect(x:80, y:730, width: 250, height: 50))
            botonRegresar.backgroundColor = .blue
            botonRegresar.tintColor = .darkGray
            botonRegresar.setTitle("Volver a catalogos", for: .normal)
            botonRegresar.addTarget(self, action: #selector(accionRegresar), for: .touchUpInside)
            self.view.addSubview(botonRegresar)
            
            
        }else{
            let talla = Tallaenum.tallaProducto(t: tallaProducto)
            switch talla {
            case .tallaProducto(t: let talla) where talla == "37":
                nombreProductoTxt.text = nombreProducto
                precioProductoTxt.text = String(precioProducto)
                cantidadProductoTxt.text = String(cantidadProducto)
                totalProductoTxt.text = String(total)
                tallaProductoTxt.text = tallaProducto
                break
            case .tallaProducto(t: let talla) where talla == "38":
                nombreProductoTxt.text = nombreProducto
                precioProductoTxt.text = String(precioProducto)
                cantidadProductoTxt.text = String(cantidadProducto)
                totalProductoTxt.text = String(total)
                tallaProductoTxt.text = tallaProducto
                
                break
            case .tallaProducto(t: let talla) where talla == "39":
                nombreProductoTxt.text = nombreProducto
                precioProductoTxt.text = String(precioProducto)
                cantidadProductoTxt.text = String(cantidadProducto)
                totalProductoTxt.text = String(total)
                tallaProductoTxt.text = tallaProducto
                
                break
            case .tallaProducto(t: let talla) where talla == "40":
                nombreProductoTxt.text = nombreProducto
                precioProductoTxt.text = String(precioProducto)
                cantidadProductoTxt.text = String(cantidadProducto)
                totalProductoTxt.text = String(total)
                tallaProductoTxt.text = tallaProducto
                
                break
                
            case .tallaProducto(t: let talla) where talla == "41":
                
                precioProductoTxt.text = String(precioProducto)
                cantidadProductoTxt.text = String(cantidadProducto)
                totalProductoTxt.text = String(total)
                nombreProductoTxt.text = nombreProducto
                tallaProductoTxt.text = tallaProducto
                
                break
        
            case .tallaProducto(t: _):
                return
            case .valido:
                return
            }
            
            //dibujamos el boton para ver la factura
            let botonVerFactura = UIButton(frame: CGRect(x:80, y:730, width: 250, height: 50))
            botonVerFactura.backgroundColor = .cyan
            botonVerFactura.setTitle("Ver Factura", for: .normal)
            botonVerFactura.setTitleColor(.black, for: .normal)
            botonVerFactura.addTarget(self, action: #selector(accionVerFactura), for: .touchUpInside)
            self.view.addSubview(botonVerFactura)
            
        }
    
    }
    
    @objc func accionRegresar(sender: UIButton){
        //self.performSegue(withIdentifier: "pantallaForm", sender: nil)
        print("Regresando a la vista principal")
    }
    
    @objc func accionVerFactura(sender: UIButton){
        
        self.performSegue(withIdentifier: "pantallaVerFactura", sender: nil)    }


}
