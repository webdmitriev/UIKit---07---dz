//
//  UIBuilders.swift
//  UIKit - 07 - dz
//
//  Created by Олег Дмитриев on 06.08.2024.
//

import UIKit

class UIBuilders {
    
    func addLabel(text: String, offsetH: CGFloat, fontS: CGFloat, fontW: UIFont.Weight, color: UIColor) -> UILabel {
        let txt = UILabel()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.text = text

        if offsetH > 0 {
            txt.heightAnchor.constraint(equalToConstant: offsetH).isActive = true
        }

        txt.font = .systemFont(ofSize: fontS, weight: fontW)
        txt.textColor = color
        txt.numberOfLines = 0
        
        return txt
    }
    
    func addImage(image: String, offsetH: CGFloat, brs: CGFloat) -> UIImageView {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false

        img.image = UIImage(named: image)
        img.heightAnchor.constraint(equalToConstant: offsetH).isActive = true
        img.layer.cornerRadius = brs
        img.layer.masksToBounds = true
        
        return img
    }
    
}
