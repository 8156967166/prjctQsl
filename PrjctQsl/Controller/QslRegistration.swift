//
//  QslRegisterationViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 04/07/22.
//

import UIKit
import SJFrameSwift

class QslRegistrationViewController: SJViewController, UITextFieldDelegate {
    @IBOutlet weak var imageTopRotate: UIImageView!
    @IBOutlet weak var imageBottomRotate: UIImageView!
    @IBOutlet weak var buttonTerms: UIButton!
//    @IBOutlet weak var buttonDontHaveAccount: UIButton!
    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var textFieldFullName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldPhone: UITextField!
    @IBOutlet weak var textFieldCode:UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldGender: UITextField!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageViewSelectedBox: UIImageView!
    @IBOutlet weak var buttonSelectedBox: UIButton!
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var imagePassword: UIImageView!
    @IBOutlet weak var labelFullName: UILabel!
    @IBOutlet weak var labelPhoneNumber: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var labelConfirmPassword: UILabel!
    @IBOutlet weak var labelCountryEmpty: UILabel!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewFullName: UIView!
    @IBOutlet weak var viewGender: UIView!
    @IBOutlet weak var viewCountry: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var viewConfirmPassword: UIView!
    @IBOutlet weak var viewPhone: UIView!
    var iconClick = true
    override func viewDidLoad() {
        super.viewDidLoad()
        viewFullName.isHidden = true
        viewEmail.isHidden = true
        viewGender.isHidden = true
        viewCountry.isHidden = true
        viewPassword.isHidden = true
        viewConfirmPassword.isHidden = true
        viewPhone.isHidden = true
        addDoneButtonOnKeyboard()
        notificationKeyboard()
        self.imageTopRotate.rotated()
        self.imageBottomRotate.rotated()
        setButtonsStyle(tempButtons: buttonTerms)
        buttonSignUp.layer.cornerRadius = 13
        buttonSignUp.titleLabel?.font = UIFont.systemFont(ofSize: 16)
//        imageViewSelectedBox.isHidden = true
        imagePassword.image = UIImage(named:"passiconImg")
        // Do any additional setup after loading the view.
//        buttonSelectedBox.setImage(UIImage(named: ""), for: .normal)
//        buttonSelectedBox.setImage(UIImage(named: "check"), for: .selected)
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
    func setButtonsStyle(tempButtons: UIButton) {
        tempButtons.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
    @IBAction func buttonActionpasswordIcon(sender: AnyObject) {
        print("password utton clicked")
        if(iconClick == true) {
            imagePassword.image = UIImage(named:"show")
            textFieldPassword.isSecureTextEntry = false
        } else {
            imagePassword.image = UIImage(named:"passiconImg")
           textFieldPassword.isSecureTextEntry = true
        }

        iconClick = !iconClick
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == self.textFieldPassword) { self.textFieldPassword.isSecureTextEntry = true }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.view.endEditing(true)
        return true;
    }
    func notificationKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
           var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
           keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollView.contentInset
            contentInset.bottom = keyboardFrame.size.height + 20
            scrollView.contentInset = contentInset
    }
    @objc func keyboardWillHide(notifiaction: NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default
            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()
            textFieldPhone.inputAccessoryView = doneToolbar
        textFieldCode.inputAccessoryView = doneToolbar
            
    }
    @objc func doneButtonAction(){
        textFieldPhone.resignFirstResponder()
        textFieldCode.resignFirstResponder()
    }
    
    @IBAction func buttonActionSelectedBox(sender: UIButton) {
        if buttonSelectedBox == sender {
            if buttonSelectedBox.isSelected {
                buttonSelectedBox.isSelected = false
                print("Unselected Box")
                imageViewSelectedBox.image = UIImage(named: "")
            }
            else {
                buttonSelectedBox.isSelected = true
                print("Selected Box")
                imageViewSelectedBox.image = UIImage(named: "check")
            }
        }
    }
    
    
    @IBAction func actionSheetFunction(sender: Any) {
        let actionSheetController = UIAlertController(title: "Selection Process", message: "Choose Your Country", preferredStyle: .actionSheet)
        let firstButton = UIAlertAction(title: "Afghanistan", style: .default) { (ACTION) in
            self.labelCountry.text = "Afghanistan"
        }
        let secondButton = UIAlertAction(title: "Australia", style: .default) { (ACTION) in
            self.labelCountry.text = "Australia"
        }
        let thirdButton = UIAlertAction(title: "India", style: .default) { (ACTION) in
            self.labelCountry.text = "India"
        }
        let FourthButton = UIAlertAction(title: "Nepal", style: .default) { (ACTION) in
            self.labelCountry.text = "Nepal"
        }
        let FifthButton = UIAlertAction(title: "Russia", style: .default) { (ACTION) in
            self.labelCountry.text = "Russia"
        }
        let sixthButton = UIAlertAction(title: "Sri Lanka", style: .default) { (ACTION) in
            self.labelCountry.text = "Sri Lanka"
        }
        actionSheetController.addAction(firstButton)
        actionSheetController.addAction(secondButton)
        actionSheetController.addAction(thirdButton)
        actionSheetController.addAction(FourthButton)
        actionSheetController.addAction(FifthButton)
        actionSheetController.addAction(sixthButton)
        present(actionSheetController, animated: true, completion: nil)
    }
    @IBAction func buttonActionTermsAndCondition(sender: AnyObject) {
        self.performSegue(withIdentifier: "TermsAndConditionsViewController", sender: self)
        print("Button Clicked")
    }
    @IBAction func buttonActionSignIn(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
//        navigationController?.popToRootViewController(animated: true)
        navigationController?.popViewController(animated: true)
        print("SignIN clicked")
    }
    @IBAction func buttonActionSignUp(sender: UIButton) {
        print("SignUp Button Clicked")
        viewFullName.isHidden = true
        viewEmail.isHidden = true
        viewGender.isHidden = true
        viewCountry.isHidden = true
        viewPassword.isHidden = true
        viewConfirmPassword.isHidden = true
        viewPhone.isHidden = true
        labelFullName.text = ""
        labelEmail.text = ""
        labelGender.text = ""
        labelCountryEmpty.text = ""
        labelPassword.text = ""
        labelConfirmPassword.text = ""
        labelPhoneNumber.text = ""
        callRegisterApi()
        if textFieldFullName.text == "" {
            viewFullName.isHidden = false
            self.labelFullName.text = SJLocalisedString["key_FullNameNotEnterAlert"]
        }
        if textFieldEmail.text == "" {
            viewEmail.isHidden = false
            self.labelEmail.text = SJLocalisedString["key_EmailNotEnterAlert"]
        }
        if textFieldGender.text == "" {
            viewGender.isHidden = false
            self.labelGender.text = SJLocalisedString["key_GenderNotEnterAlert"]
        }
        if labelCountry.text == "" {
            viewCountry.isHidden = false
            self.labelCountryEmpty.text = SJLocalisedString["key_CountryAlert"]
        }
        if textFieldPassword.text == "" {
            viewPassword.isHidden = false
            self.labelPassword.text = SJLocalisedString["key_PasswordNotEnterAlert"]
        }
        if textFieldConfirmPassword.text == "" {
            viewConfirmPassword.isHidden = false
            self.labelConfirmPassword.text = SJLocalisedString["key_ConfirmPasswordAlert"]
        }
        if (textFieldPhone.text == "" || textFieldCode.text == "") {
            viewPhone.isHidden = false
            self.labelPhoneNumber.text = SJLocalisedString["key_PhoneNumberAlert"]
        }
        
//        if(textFieldFullName.text == "" || textFieldCode.text == "" || textFieldPhone.text == "" || textFieldEmail.text == "" || textFieldGender.text == "" || textFieldPassword.text == "" || textFieldConfirmPassword.text == "") {
//            let alertController = UIAlertController(title: "Error", message: "Please Enter All text Fields", preferredStyle: .alert)
//                   let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                   alertController.addAction(defaultAction)
//                   self.present(alertController, animated: true, completion: nil)
//        }
            if textFieldPassword.text != textFieldConfirmPassword.text {
                let alertController = UIAlertController(title: "Error", message: "Password don't match", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        if(textFieldFullName.text != "" && textFieldEmail.text != "" && textFieldGender.text != "" && textFieldPassword.text != "" && textFieldConfirmPassword.text != "" && labelCountry.text != "" && textFieldPhone.text != "" && textFieldCode.text != "") {
            self.performSegue(withIdentifier: "EnterOptViewController", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EnterOptViewController {
            vc.getPhoneNumber = textFieldPhone.text ?? ""
            vc.getEmail = textFieldEmail.text ?? ""
        }
    }
    
    @IBAction func toggleLanguageAction(){
        AppController.shared.toggleAppGUILanguage()
        
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let wrapperVC = storyboard.instantiateViewController(withIdentifier: "QslRegistrationViewController") as! QslRegistrationViewController
            self.navigationController?.pushViewController(wrapperVC, animated: false)
            self.removeDuplicateInstanceOfSelf()
        }
    }
}
extension UIView{
    func rotated() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 10.0
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
extension QslRegistrationViewController {
    func callRegisterApi() {
        if AppController.shared.checkInternetAvailability() {
            let nwctrl = APINetworkController();
            let objRequest = AppBaseRequest(ConstantAPI.WEBSERVICE_USER_REGISTRATION, ConstantAPI.k_REQUEST_TYPE_POST);
///            objRequest.rawParam = "{\"user_name\":\"kannan@applab.qa\",\"password\":\"12345678\"}"
//
            objRequest.rawParam = ["full_name":"\(textFieldFullName.text ?? "")",
                                   "email":"\(textFieldEmail.text ?? "")", "gender":"\(textFieldGender.text ?? "")", "country":"\(labelCountry.text ?? "")", "password":"\(textFieldPassword.text ?? "")", "confirm_password":"\(textFieldConfirmPassword.text ?? "")", "mobile": "\(textFieldPhone.text ?? "")" ].toJSON()
//            objRequest.rawParam = ["user_name":"",
//                                   "password":""].toJSON()
//
            nwctrl.callWebserviceRequest(objRequest) { objResponse in
                if objResponse.api_status == true {
                    self.showAlert(message: "Success")
                }
                else {
//                    if let response = objResponse.resultData as? [String: Any] {
//                        print(response)
//                        print("response ......")
//                        if let errors = response["errors"] as? [String:Any] {
//                        print(errors)
                    if let errors = objResponse.errors as? [String:Any] {
                        print(errors)
                        if let email = errors["email"] as? [String], !email.isEmpty {
                            print(email[0])
                            DispatchQueue.main.async {
                                if (self.textFieldFullName.text ?? "").isEmpty {
                                    self.viewFullName.isHidden = false
                                    self.labelFullName.text = "\(email[0])"
                                }
                            }
                        }
                        if let password = errors["password"] as? [String], !password.isEmpty {
                            print(password[0])
                            DispatchQueue.main.async {
                                if (self.textFieldEmail.text ?? "").isEmpty {
                                    self.viewEmail.isHidden = false
                                    self.labelEmail.text = "\(password[0])"
                                }
                            }
                        }
                    }
                    else if let message = objResponse.errorMsg as? String {
                            print(message)
                            self.showAlert(message: objResponse.errorMsg)
                        }
//                    self.showAlert(message: "Error")
                }
            }
        }
//        }
        else {
            self.showAlert(message: "Network Error")
        }
    }
}
    


//if cellModel.isSelect == true {
//cell.imageViewSelected?.isHidden = false
//} else {
//cell.imageViewSelected?.isHidden = true
//}

//var isSelect: Bool = false

//if cellModel.isSelect == true {
//    cellModel.isSelect = false
//} else {
//    cellModel.isSelect = true
//}
