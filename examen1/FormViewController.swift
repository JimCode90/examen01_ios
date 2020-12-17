//
//  FormViewController.swift
//  examen1
//
//  Created by klevert herrera sanchez on 12/16/20.
//

import UIKit

class FormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var productoSeleccionado: UILabel!
    @IBOutlet weak var precioSeleccionado: UILabel!
    @IBOutlet weak var imagenProductoIV: UIImageView!
    @IBOutlet weak var modeloSeleccionado: UILabel!
    
    //MARK: implementamos el dropdown y los campos del formulario
    
    @IBOutlet weak var tallaBox: UITextField!
    @IBOutlet weak var dropDownTalla: UIPickerView!
    let tallas = ["37","38","39","40" ,"41"]
    @IBOutlet weak var cantidadProducto: UITextField!
    
    //variables para recibir los datos de la vista principal
    var productoRecibido:String = ""
    var precioRecibido: Double = 0
    var imagenRecibida:String = ""
    var modeloRecibido:String = ""
    var cantidadProcesada:Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        productoSeleccionado.text = productoRecibido
        precioSeleccionado.text = String(precioRecibido)
        imagenProductoIV.image = UIImage(named: imagenRecibida)
        modeloSeleccionado.text = modeloRecibido
        
        
        //implementamos el boton con codigo swift
        let buttonAdquirir = UIButton(frame: CGRect(x:80, y:730, width: 250, height: 50))
        buttonAdquirir.backgroundColor = .blue
        buttonAdquirir.setTitle("Adquirir Producto", for: .normal)
        buttonAdquirir.addTarget(self, action: #selector(procesarDatos), for: .touchUpInside)
        self.view.addSubview(buttonAdquirir)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pantallaDatosProcesados"{
            let pantallaDatosProcesados = segue.destination as! DetallesViewController
            pantallaDatosProcesados.cantidadProducto = cantidadProcesada
            pantallaDatosProcesados.precioProducto = precioRecibido
            pantallaDatosProcesados.tallaProducto = tallaBox.text!
            pantallaDatosProcesados.modeloProducto = modeloRecibido
            pantallaDatosProcesados.nombreProducto = productoRecibido
    
        }
    }
    
    @objc func procesarDatos(sender: UIButton){
        
        cantidadProcesada = Int(cantidadProducto.text!)!
        self.performSegue(withIdentifier: "pantallaDatosProcesados", sender: nil)
    }
    //metodos del dropdown
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
           return 1
       }

       public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{

           return tallas.count
       }

       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

           self.view.endEditing(true)
           return tallas[row]
       }

       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

           self.tallaBox.text = self.tallas[row]
           self.dropDownTalla.isHidden = true
       }

       func textFieldDidBeginEditing(_ textField: UITextField) {

           if textField == self.tallaBox {
               self.dropDownTalla.isHidden = false
               //if you don't want the users to se the keyboard type:

               textField.endEditing(true)
           }
       }

}
