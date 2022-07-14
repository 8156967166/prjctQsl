//
//  VerifyEmailViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 13/07/22.
//

import UIKit

class VerifyEmailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var labelPleaseEnter: UILabel!
    @IBOutlet weak var textFieldFirstNumberOfOtp: UITextField!
    @IBOutlet weak var textFieldSecondNumberOfOtp: UITextField!
    @IBOutlet weak var textFieldThirdNumberOfOtp: UITextField!
    @IBOutlet weak var textFieldFourthNumberOfOtp: UITextField!
    @IBOutlet weak var textFieldFifthNumberOfOtp: UITextField!

    var getEmail = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldFirstNumberOfOtp.delegate = self
        textFieldSecondNumberOfOtp.delegate = self
        textFieldThirdNumberOfOtp.delegate = self
        textFieldFourthNumberOfOtp.delegate = self
        textFieldFifthNumberOfOtp.delegate = self
        setGradientBackground()
        self.labelPleaseEnter.text = "Please Enter The Code Sent To The Email \(getEmail)"
        // Do any additional setup after loading the view.
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
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
    @IBAction func buttonActionVerifyByPhone(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}
