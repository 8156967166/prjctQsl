//
//  QslSignInViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 01/07/22.
//

import UIKit
import UIKit
import SJFrameSwift

class QslSignInViewController: SJViewController, UITextFieldDelegate {
    @IBOutlet weak var imageTopRotate: UIImageView!
    @IBOutlet weak var imageBottomRotate: UIImageView!
    @IBOutlet weak var buttonSignIn: UIButton!
    @IBOutlet weak var buttonSignUp: UIButton!
//    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textFieldMobile:UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var imagePasswordIcon: UIImageView!
    @IBOutlet weak var buttonForgot: UIButton!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var labelEmailNotEnter: UILabel!
    @IBOutlet weak var labelPasswordNotEnter: UILabel!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPassword: UIView!
//    var resultData:Any?
    var iconClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewEmail.isHidden = true
        viewPassword.isHidden = true
        self.imageTopRotate.rotate()
        self.imageBottomRotate.rotate()
        buttonSignIn.layer.cornerRadius = 13
        buttonSignIn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
//        notificationKeyboard()
        addDoneButtonOnKeyboard()
        imagePasswordIcon.image = UIImage(named:"passiconImg")
        // Do any additional setup after loading the view.
        
//        lblLogin.text = SJLocalisedString["key_Login"]
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
//    func notificationKeyboard() {
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//    @objc func keyboardWillShow(notification: NSNotification) {
//        guard let userInfo = notification.userInfo else { return }
//           var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//           keyboardFrame = self.view.convert(keyboardFrame, from: nil)
//
//        var contentInset:UIEdgeInsets = self.scrollView.contentInset
//            contentInset.bottom = keyboardFrame.size.height + 20
//            scrollView.contentInset = contentInset
//    }
//    @objc func keyboardWillHide(notifiaction: NSNotification) {
//        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
//        scrollView.contentInset = contentInset
//    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.view.endEditing(true)
        return true;
    }
    func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default
            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()
            textFieldMobile.inputAccessoryView = doneToolbar
            
    }
    func setEmptyTextField() {
        if (textFieldMobile.text ?? "").isEmpty {
            self.labelEmailNotEnter.text = "Please enter Your email address"
        }
        if (textFieldPassword.text ?? "").isEmpty {
            self.labelPasswordNotEnter.text = "Please enter your password"
        }
    }
    
    @objc func doneButtonAction(){
        textFieldMobile.resignFirstResponder()
    }
    @IBAction func iconAction(sender: AnyObject) {
        if(iconClick == true) {
            imagePasswordIcon.image = UIImage(named:"show")
            textFieldPassword.isSecureTextEntry = false
        } else {
            imagePasswordIcon.image = UIImage(named:"passiconImg")
            textFieldPassword.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    @IBAction func buttonActionSignUp(sender: UIButton) {
        self.performSegue(withIdentifier: "QslRegistrationViewController", sender: nil)
    }
    
    @IBAction func toggleLanguageAction(){
        AppController.shared.toggleAppGUILanguage()
        
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let wrapperVC = storyboard.instantiateViewController(withIdentifier: "QslSignInViewController") as! QslSignInViewController
            self.navigationController?.pushViewController(wrapperVC, animated: false)
            self.removeDuplicateInstanceOfSelf()
        }
    }
    @IBAction func buttonActionSignIn(sender: UIButton) {
        labelEmailNotEnter.text = ""
        labelPasswordNotEnter.text = ""
        viewEmail.isHidden = true
        viewPassword.isHidden = true
        callLoginAPI()
        print("SignIn button Clicked")
//        setEmptyTextField()
    }
}
//
//extension QslSignInViewController {
//    func callLoginAPI() {
//        if AppController.shared.checkInternetAvailability() {
//            //Call API
//            let nwctrl = APINetworkController()
//            let objRequest = AppBaseRequest(ConstantAPI.WEBSERVICE_GET_CATEGORIES ,ConstantAPI.k_REQUEST_TYPE_GET)
//            nwctrl.callWebserviceRequest(objRequest) { objResponse in
//                if let result = objResponse.resultData as? [String: Any] {
//                    print(result)
//                    if let categories = result["categories"] as? [[String: Any]] {
//                        print(categories)
//                        print(categories[0])
//                    }
//                }
//            }
//
//        }else {
//            //Show network alert
//            //self.showAlert(message: SJLocalisedString["key_Network_Error"], completion: nil)
//
//            self.showAlert(message: SJLocalisedString["key_Network_Error"])
//        }
//    }
//}


//extension QslSignInViewController {
//    func callLoginAPI() {
//        if AppController.shared.checkInternetAvailability() {
//            let nwctrl = APINetworkController();
//            let objRequest = AppBaseRequest(ConstantAPI.WEBSERVICE_USER_LOGIN, ConstantAPI.k_REQUEST_TYPE_POST);
//            //       objRequest.addParam(key: "email", value: textFieldMobile.text ?? "")
//            //       objRequest.addParam(key: "password", value: textFieldPassword.text ?? "")
//
//            objRequest.addParam(key: "email", value: "saravanan@applab.qa")
//            objRequest.addParam(key: "password", value: "Qwerty123")
//
//            nwctrl.callWebserviceRequest(objRequest) { objResponse in
//                if objResponse.api_status == true  {
//                    self.showAlert(message: "Success")
//                }
//                else {
//                    self.showAlert(message: "Error")
//                }
//            }
//        }
//        else {
//            self.showAlert(message: "Network Error")
//        }
//    }
//}

extension QslSignInViewController {
    func callLoginAPI() {
        if AppController.shared.checkInternetAvailability() {
            let nwctrl = APINetworkController();
            let objRequest = AppBaseRequest(ConstantAPI.WEBSERVICE_USER_LOGIN, ConstantAPI.k_REQUEST_TYPE_POST);
//            objRequest.addParam(key: "email", value: "")
//            objRequest.addParam(key: "password", value: "")
            objRequest.rawParam = "{\"user_name\":\"kannan@applab.qa\",\"password\":\"12345678\"}"
            
            nwctrl.callWebserviceRequest(objRequest) { objResponse in
                if objResponse.api_status == true {
                    self.showAlert(message: "Success")
                }
                else {
                    if let response = objResponse.resultData as? [String: Any] {
                        print(response)
                        print("response ......")
                        if let errors = response["errors"] as? [String:Any] {
                            print(errors)
                            if let email = errors["email"] as? [String], !email.isEmpty {
                                print(email[0])
                                    DispatchQueue.main.async {
                                        if (self.textFieldMobile.text ?? "").isEmpty {
                                            self.viewEmail.isHidden = false
                                        self.labelEmailNotEnter.text = "\(email[0])"
                                    }
                                }
                            }
                            if let password = errors["password"] as? [String], !password.isEmpty {
                                print(password[0])
                                DispatchQueue.main.async {
                                    if (self.textFieldPassword.text ?? "").isEmpty {
                                        self.viewPassword.isHidden = false
                                        self.labelPasswordNotEnter.text = "\(password[0])"
                                    }
                                }
                            }
                        }
                    }
//                    self.showAlert(message: "Error")
                }
            }
        }
        else {
            self.showAlert(message: "Network Error")
        }
    }
    
    /*
    func callLoginAPI() {
        if AppController.shared.checkInternetAvailability() {
            let nwctrl = APINetworkController();
            let objRequest = AppBaseRequest(ConstantAPI.WEBSERVICE_USER_LOGIN, ConstantAPI.k_REQUEST_TYPE_POST);
            objRequest.addParam(key: "email", value: "")
            objRequest.addParam(key: "password", value: "")
            nwctrl.callWebserviceRequest(objRequest) { objResponse in
                if objResponse.api_status == true {
                    self.showAlert(message: "Success")
                }
                else {
                    if let response = objResponse.resultData as? [String: Any] {
                        print(response)
                        print("response ......")
                        if let errors = response["errors"] as? [String:Any] {
                            print(errors)
                            if let email = errors["email"] as? [String], !email.isEmpty {
                                print(email[0])
                                    DispatchQueue.main.async {
                                        if (self.textFieldMobile.text ?? "").isEmpty {
                                            self.viewEmail.isHidden = false
                                        self.labelEmailNotEnter.text = "\(email[0])"
                                    }
                                }
                            }
                            if let password = errors["password"] as? [String], !password.isEmpty {
                                print(password[0])
                                DispatchQueue.main.async {
                                    if (self.textFieldPassword.text ?? "").isEmpty {
                                        self.viewPassword.isHidden = false
                                        self.labelPasswordNotEnter.text = "\(password[0])"
                                    }
                                }
                            }
                        }
                    }
//                    self.showAlert(message: "Error")
                }
            }
        }
        else {
            self.showAlert(message: "Network Error")
        }
    }
    */
}
