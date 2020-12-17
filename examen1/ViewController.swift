//
//  ViewController.swift
//  examen1
//
//  Created by klevert herrera sanchez on 12/16/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tablaProductos: UITableView!
    
    private let productos = ["ADIDAS ZAPATILLA VS PACE PARA HOMBRE","REEBOK ZAPATILLAS URBANAS ROYAL COMPLETE CLN2 PARA HOMBRE","REBOOK ZAPATILLAS URBANAS ROYAL COMPLETE CLN2 PARA HOMBRE", "PUMA ZAPATILLAS BMW MMS DC FUTURE"]
    private let modelo = ["00-A","00-B","00-C","00-D"]
    private let imgProductos = ["p1","p2","p3","p4"]
    private let preciosProductos = [100.99,150.99,135.99,150.99]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablaProductos.delegate = self
        tablaProductos.dataSource = self
        tablaProductos.tableFooterView = UIView()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pantallaForm"{
            let idProductoRecibido = sender as! Int
            let formulario:FormViewController = segue.destination as! FormViewController
            formulario.productoRecibido = productos[idProductoRecibido]
            formulario.imagenRecibida = imgProductos[idProductoRecibido]
            formulario.precioRecibido = preciosProductos[Int(idProductoRecibido)]
            formulario.modeloRecibido = modelo[idProductoRecibido]
        }
    }


}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tablaProductos.dequeueReusableCell(withIdentifier: "customCelda") as! CustomTableViewCell
        
        celda.cellView.layer.cornerRadius = celda.cellView.frame.height / 10
        celda.textoProducto.text = productos[indexPath.row]
        celda.imagenProducto.image = UIImage(named: imgProductos[indexPath.row])
        //celda.imagenProducto.layer.cornerRadius = celda.imagenProducto.frame.height / 4
        
        celda.accessoryType = .disclosureIndicator

        return celda
        
        
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let productoSeleccionado = indexPath.row
        self.performSegue(withIdentifier: "pantallaForm", sender: productoSeleccionado)
    }
    
}

