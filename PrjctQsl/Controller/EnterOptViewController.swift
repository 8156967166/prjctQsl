//
//  EnterOptViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 08/07/22.
//

import UIKit

class EnterOptViewController: UIViewController {
    @IBOutlet weak var labelPleaseEnter: UILabel!
//    @IBOutlet weak var labelGetPhoneNumber: UILabel?
    var getPhoneNumber = String()
    override func viewDidLoad() {
        super.viewDidLoad()
//        labelGetPhoneNumber?.text = getPhoneNumber
//        labelGetPhoneNumber?.layer.backgroundColor = UIColor.orange.cgColor
        labelPleaseEnter.text = "Please Enter The Code Sent To The Number \(getPhoneNumber)"
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setGradientBackground()
    }
    func setGradientBackground() {
        let colorTop = UIColor(red: 69.0/255.0, green: 6.0/255.0, blue: 42.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 100.0/255.0, green: 1.0/255.0, blue: 45.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

}
