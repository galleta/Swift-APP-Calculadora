//
//  EdgeInsetLabel.swift
//  Calculadora
//
//  Created by Instituto Tecnológico Poniente on 18/7/18.
//  Copyright © 2018 Instituto Tecnológico Poniente. All rights reserved.
//

import UIKit

// From http://stackoverflow.com/questions/21167226/resizing-a-uilabel-to-accomodate-insets/21267507#21267507

/*
 Esta clase agrega la funcionalidad del espaciado al texto de un UILabel
 
 Funcionamiento:
 Seleccionar el UILabel, elegir la custom class y los padding son:
    Left Text Inset -> espaciado izquierdo del texto
    Right Text Inset -> espaciado derecho del texto
    Top Text Inset -> espaciado arriba del texto
    Bottom Text Inset -> espaciado abajo del texto
 
 */

@IBDesignable class EdgeInsetLabel: UILabel
{
    
    var textInsets = UIEdgeInsets.zero
    {
        didSet { invalidateIntrinsicContentSize() }
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect
    {
        let insetRect = UIEdgeInsetsInsetRect(bounds, textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                                          left: -textInsets.left,
                                          bottom: -textInsets.bottom,
                                          right: -textInsets.right)
        
        return UIEdgeInsetsInsetRect(textRect, invertedInsets)
    }
    
    override func drawText(in rect: CGRect)
    {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, textInsets))
    }
}

extension EdgeInsetLabel
{
    @IBInspectable
    var leftTextInset: CGFloat
    {
        set { textInsets.left = newValue }
        get { return textInsets.left }
    }
    
    @IBInspectable
    var rightTextInset: CGFloat
    {
        set { textInsets.right = newValue }
        get { return textInsets.right }
    }
    
    @IBInspectable
    var topTextInset: CGFloat
    {
        set { textInsets.top = newValue }
        get { return textInsets.top }
    }
    
    @IBInspectable
    var bottomTextInset: CGFloat
    {
        set { textInsets.bottom = newValue }
        get { return textInsets.bottom }
    }
}

