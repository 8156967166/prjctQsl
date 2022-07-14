//
//  ExtensionsManager.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 06/07/22.
//

import UIKit
import SJFrameSwift

//MARK: - View Controllers
extension UIViewController {
    func removeDuplicateInstanceOfSelf() {
        //If we push save VC again, and remove the previous copy
        //Call it after push
        let sameVCPrevInstance = ((self.navigationController?.viewControllers.count ?? -1) - 1) - 1
        //Since Instance - 1 => Current Index; Index - 1 = Previous
        if (sameVCPrevInstance > 0) {
            self.navigationController?.viewControllers.remove(at: sameVCPrevInstance)
        }
    }
    
    func showAlert(title:String? = SJLocalisedString["key_Alert"], message:String,completion:((Bool)->())? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: SJLocalisedString["key_Ok"], style: .default, handler: { _ in
                completion?(true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
//    func showAlert(title:String = SJLocalisedString["key_Alert"], message:String,completion:((Bool)->())? = nil) {
//        DispatchQueue.main.async {
//            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: SJLocalisedString["key_Ok"], style: .default, handler: { _ in
//                completion?(true)
//            }))
//            self.present(alert, animated: true, completion: nil)
//        }
//    }
}

//MARK: - Views
extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 10.0
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}

extension Dictionary where Key == String {
func toJSON() -> String {
        if let theJSONData = try? JSONSerialization.data(withJSONObject: self, options: []) {
            if let theJSONText = String(data: theJSONData, encoding: .ascii) {
                return theJSONText
            }
        }
        return ConstantString.k_EMPTY
    }
}
