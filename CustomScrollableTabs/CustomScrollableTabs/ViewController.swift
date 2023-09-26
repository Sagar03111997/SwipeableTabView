//
//  ViewController.swift
//  CustomScrollableTabs
//
//  Created by Sagar Sahu on 5/24/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func redirectButton(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "CustomScrollableTabsViewController") as? CustomScrollableTabsViewController else {return}
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
}

