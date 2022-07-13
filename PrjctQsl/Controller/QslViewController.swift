//
//  QslViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 01/07/22.
//

import UIKit

class QslViewController: UIViewController {
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var imageTop: UIImageView!
    @IBOutlet weak var imageBottom: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        startSpinning()
        imageLogo.layer.cornerRadius = self.imageLogo.frame.width/2.0
        imageLogo.clipsToBounds = true
//        imageLogo.transform = imageLogo.transform.rotated(by: .pi * 1.5)
            
            UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveLinear) {
                self.imageLogo.transform = self.imageLogo.transform.rotated(by: CGFloat(Double.pi / 2))
            } completion: { isCompleted in
                self.performSegue(withIdentifier: "QslSignInViewController", sender: nil)
            }

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setGradientBackground()
    }
    
    func startSpinning()  {
        UIView.animate(withDuration: 5.0, delay: 0.0, options: .repeat, animations: { () -> Void in
            self.imageTop!.transform = self.imageTop!.transform.rotated(by: .pi / 2)
            self.imageBottom!.transform = self.imageBottom!.transform.rotated(by: .pi / 2)
            
        })
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
