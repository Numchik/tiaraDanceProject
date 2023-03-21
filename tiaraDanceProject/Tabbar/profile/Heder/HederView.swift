//
//  HederView.swift
//  tiaraDanceProject
//
//  Created by Максим Никитюк on 22.03.2023.
//

import UIKit

class HederView: UIView {

    static func instantiate() -> HederView {
        let view: HederView = initFromNib()
        return view
    }
  
}

extension UIView {
    
    class func initFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil)?[0] as! T
    }
    
}
