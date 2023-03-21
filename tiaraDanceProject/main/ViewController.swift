//
//  ViewController.swift
//  tiaraDanceProject
//
//  Created by Максим Никитюк on 21.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let storybord = UIStoryboard(name: "Tabbar", bundle: nil)
        let vc = storybord.instantiateViewController(withIdentifier: "Tabbar")
        self.navigationController?.pushViewController(vc, animated: false)
    }
    

}

