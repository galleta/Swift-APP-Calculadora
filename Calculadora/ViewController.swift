//
//  ViewController.swift
//  Calculadora
//
//  Created by Francisco Jesús Delgado Almirón on 18/7/18.
//  Copyright © 2018 Francisco Jesús Delgado Almirón. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var vVista1: UIView!
    @IBOutlet weak var vVista2: UIView!
    @IBOutlet weak var vVista3: UIView!
    @IBOutlet weak var vVista4: UIView!
    @IBOutlet weak var vVista41: UIView!
    @IBOutlet weak var vVista412: UIView!
    @IBOutlet weak var vVista411: UIView!
    @IBOutlet weak var svResultados: UIStackView!
    @IBOutlet weak var svBotones1: UIStackView!
    @IBOutlet weak var svBotones2: UIStackView!
    @IBOutlet weak var svBotones3: UIStackView!
    @IBOutlet weak var svBotones4: UIStackView!
    @IBOutlet weak var svBotones41: UIStackView!
    @IBOutlet weak var svBotones42: UIStackView!
    @IBOutlet weak var lResultado: UILabel!
    @IBOutlet weak var bClear: UIButton!
    @IBOutlet weak var bDividir: UIButton!
    @IBOutlet weak var bMultiplicar: UIButton!
    @IBOutlet weak var bSiete: UIButton!
    @IBOutlet weak var bOcho: UIButton!
    @IBOutlet weak var bNueve: UIButton!
    @IBOutlet weak var bRestar: UIButton!
    @IBOutlet weak var bCuatro: UIButton!
    @IBOutlet weak var bCinco: UIButton!
    @IBOutlet weak var bSeis: UIButton!
    @IBOutlet weak var bSumar: UIButton!
    @IBOutlet weak var bIgual: UIButton!
    @IBOutlet weak var bUno: UIButton!
    @IBOutlet weak var bDos: UIButton!
    @IBOutlet weak var bTres: UIButton!
    @IBOutlet weak var bPunto: UIButton!
    @IBOutlet weak var bCero: UIButton!
    
    enum Operacion :String
    {
        case Suma, Resta, Producto, Divison, Ninguna
    }
    
    var numero1: Double!, numero2: Double!
    var operacion = Operacion.Ninguna
    var operacionrealizada = false
    
    /**
     @brief Escribe un caracter en la pantalla de operación de la calculadora
     @param caracter Caracter a poner (0-9 .)
    */
    func ponerCaracter(caracter: String) -> Void
    {
        if (lResultado.text == "0" || operacionrealizada == true) && caracter != "."
        {
            lResultado.text = caracter
            operacionrealizada = false
        }
        else
        {
            lResultado.text = lResultado.text! + caracter
        }
    }
    
    @IBAction func funcionClear(_ sender: Any)
    {
        // Reseteo todo
        lResultado.text = "0"
        operacionrealizada = false
        operacion = Operacion.Ninguna
    }
    
    @IBAction func funcionBoton1(_ sender: Any)
    {
        ponerCaracter(caracter: "1")
    }
    
    @IBAction func funcionBoton2(_ sender: Any)
    {
        ponerCaracter(caracter: "2")
    }
    
    @IBAction func funcionBoton3(_ sender: Any)
    {
        ponerCaracter(caracter: "3")
    }
    
    @IBAction func funcionBoton4(_ sender: Any)
    {
        ponerCaracter(caracter: "4")
    }
    
    @IBAction func funcionBoton5(_ sender: Any)
    {
        ponerCaracter(caracter: "5")
    }
    
    @IBAction func funcionBoton6(_ sender: Any)
    {
        ponerCaracter(caracter: "6")
    }
    
    @IBAction func funcionBoton7(_ sender: Any)
    {
        ponerCaracter(caracter: "7")
    }
    
    @IBAction func funcionBoton8(_ sender: Any)
    {
        ponerCaracter(caracter: "8")
    }
    
    @IBAction func funcionBoton9(_ sender: Any)
    {
        ponerCaracter(caracter: "9")
    }
    
    @IBAction func funcionBotonCero(_ sender: Any)
    {
        if lResultado.text != "0"
        {
            ponerCaracter(caracter: "0")
        }
    }
    
    @IBAction func funcionBotonPunto(_ sender: Any)
    {
        ponerCaracter(caracter: ".")
        // Deshabilito el botón del punto
        bPunto.isUserInteractionEnabled = false
    }
    
    @IBAction func funcionBotonDivision(_ sender: Any)
    {
        numero1 = Double(lResultado.text!)
        lResultado.text = "0"
        operacion = Operacion.Divison
        
        // Habilito el botón del punto
        bPunto.isUserInteractionEnabled = true
    }
    
    @IBAction func funcionBotonMultiplicar(_ sender: Any)
    {
        numero1 = Double(lResultado.text!)
        lResultado.text = "0"
        operacion = Operacion.Producto
        
        // Habilito el botón del punto
        bPunto.isUserInteractionEnabled = true
    }
    
    @IBAction func funcionBotonRestar(_ sender: Any)
    {
        numero1 = Double(lResultado.text!)
        lResultado.text = "0"
        operacion = Operacion.Resta
        
        // Habilito el botón del punto
        bPunto.isUserInteractionEnabled = true
    }
    
    @IBAction func funcionBotonSumar(_ sender: Any)
    {
        numero1 = Double(lResultado.text!)
        lResultado.text = "0"
        operacion = Operacion.Suma
        
        // Habilito el botón del punto
        bPunto.isUserInteractionEnabled = true
    }
    
    @IBAction func fncionBotonIgual(_ sender: Any)
    {
        if operacion != Operacion.Ninguna
        {
            numero2 = Double(lResultado.text!)
            switch operacion
            {
                case Operacion.Suma:
                    let resultado = numero1! + numero2!
                    lResultado.text = String(resultado)
                case Operacion.Resta:
                    let resultado = numero1! - numero2!
                    lResultado.text = String(resultado)
                case Operacion.Producto:
                    let resultado = numero1! * numero2!
                    lResultado.text = String(resultado)
                case Operacion.Divison:
                    let resultado = numero1! / numero2!
                    lResultado.text = String(resultado)
                default:
                    print("")
            }
        }
        
        bPunto.isUserInteractionEnabled = true // Habilito el botón del punto
        operacion = Operacion.Ninguna
        operacionrealizada = true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        agregarBordeUILabel(label: lResultado)
        agregarBordeUIButton(boton: bClear)
        agregarBordeUIButton(boton: bDividir)
        agregarBordeUIButton(boton: bMultiplicar)
        agregarBordeUIButton(boton: bSiete)
        agregarBordeUIButton(boton: bOcho)
        agregarBordeUIButton(boton: bNueve)
        agregarBordeUIButton(boton: bRestar)
        agregarBordeUIButton(boton: bCuatro)
        agregarBordeUIButton(boton: bCinco)
        agregarBordeUIButton(boton: bSeis)
        agregarBordeUIButton(boton: bSumar)
        agregarBordeUIButton(boton: bIgual)
        agregarBordeUIButton(boton: bUno)
        agregarBordeUIButton(boton: bDos)
        agregarBordeUIButton(boton: bTres)
        agregarBordeUIButton(boton: bCero)
        agregarBordeUIButton(boton: bPunto)
        
        agregarPaddingStackView(view: svBotones1, arriba: 5, izquierda: 10, abajo: 0, derecha: 10)
        agregarPaddingStackView(view: svBotones2, arriba: 5, izquierda: 10, abajo: 0, derecha: 10)
        agregarPaddingStackView(view: svBotones3, arriba: 5, izquierda: 10, abajo: 0, derecha: 10)
        agregarPaddingStackView(view: svBotones4, arriba: 5, izquierda: 10, abajo: 0, derecha: 10)
        agregarPaddingStackView(view: svResultados, arriba: 5, izquierda: 10, abajo: 0, derecha: 10)
    }
    
    /**
     @brief Agrega padding a un UIStackview
     @param arriba Padding superior
     @param izquierda Padding a la izquierda
     @param abajo Padding inferior
     @apram derecha Padding a la derecha
    */
    func agregarPaddingStackView(view: UIStackView, arriba: Int, izquierda: Int, abajo: Int, derecha: Int) -> Void
    {
        view.layoutMargins = UIEdgeInsets(top: CGFloat(arriba), left: CGFloat(izquierda), bottom: CGFloat(abajo), right: CGFloat(derecha))
        view.isLayoutMarginsRelativeArrangement = true
    }
    
    /**
     @brief Agrega borde a un UILabel
    */
    func agregarBordeUILabel(label: UILabel) -> Void
    {
        label.layer.borderWidth = 1.0
        //label.layer.cornerRadius = 1
        //label.backgroundColor = UIColor.yellow
        label.layer.masksToBounds = true
    }
    
    /**
     @brief Agrega borde a un UIButton
    */
    func agregarBordeUIButton(boton: UIButton) -> Void
    {
        boton.layer.borderWidth = 1.0
        boton.layer.cornerRadius = 5
        boton.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
