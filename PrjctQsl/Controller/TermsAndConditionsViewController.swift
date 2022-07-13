//
//  TermsAndConditionsViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 05/07/22.
//

import UIKit

class TermsAndConditionsViewController: UIViewController {
    @IBOutlet weak var viewTerms: UIView!
    @IBOutlet weak var viewScroll: UIView!
    @IBOutlet weak var viewBottomTerms: UIView!
    @IBOutlet weak var viewTermsAndConditions: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBottomViewTerms()
        setGradientViewTermsAndConditions()
        viewTerms.layer.cornerRadius = 25
        viewScroll.layer.cornerRadius = 25
        viewTerms.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        viewScroll.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setGradientBottomViewTerms()
        setGradientViewTermsAndConditions()
    }
    @IBAction func buttonActionClose(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    func setGradientBottomViewTerms() {
//        let colorTop = UIColor(red: 69.0/255.0, green: 6.0/255.0, blue: 42.0/255.0, alpha: 1.0).cgColor
//        let colorBottom = UIColor(red: 69.0/255.0, green: 6.0/255.0, blue: 42.0/255.0, alpha: 0.0).cgColor
        let colorTop = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 45.0/255.0, alpha: 0.0).cgColor
        let colorBottom = UIColor(red: 137.0/255.0, green: 9.0/255.0, blue: 83.0/255.0, alpha: 0.5).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = viewBottomTerms.bounds
        viewBottomTerms.layer.insertSublayer(gradientLayer, at: 0)
    }
    func setGradientViewTermsAndConditions() {
        let colorTop = UIColor(red: 100.0/255.0, green: 0.0/255.0, blue: 45.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 137.0/255.0, green: 9.0/255.0, blue: 83.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = viewTermsAndConditions.bounds
        viewTermsAndConditions.layer.insertSublayer(gradientLayer, at: 0)
    }
    
   
}
