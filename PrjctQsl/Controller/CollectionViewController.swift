//
//  CollectionViewController.swift
//  PrjctQsl
//
//  Created by Bimal@AppStation on 11/07/22.
//

import UIKit
import SJFrameSwift

class CollectionViewController: SJViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var categoriesArray: [Category] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        callLoginAPI()
        // Do any additional setup after loading the view.
    }
    func callLoginAPI() {
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
////                        for category in categories {
////                            self.categoriesArray.append(Category)
////                        }
//                    }
//                    else {
//                        print("Error")
//                    }
//                }
//            }
//        }else {
//            //Show network alert
//            //self.showAlert(message: SJLocalisedString["key_Network_Error"], completion: nil)
//
//            self.showAlert(message: SJLocalisedString["key_Network_Error"])
//        }
       
            
    }
    

}
struct Category: Codable {
    let id: String
    let ar_name: String
    let en_name: String
    let order: Int
    let bg_color: String
}
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        cell.setModel(SetCollectionModel: categoriesArray[indexPath.item])
        return cell
    }
}
