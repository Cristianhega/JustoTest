//
//  ViewController.swift
//  JustoTest
//
//  Created by Cristian Hernandez Garcia on 13/09/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
            let controller = HomeRouter.createModule()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}

