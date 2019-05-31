//
//  ResgisterController.swift
//  AppRestaurante
//
//  Created by Daniel Miranda on 28/05/2019.
//  Copyright © 2019 Daniel Miranda. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class RegisterController: UIViewController {
    
    @IBOutlet weak var textFieldNameRegister: UITextField!
    @IBOutlet weak var textFieldEmailRegister: UITextField!
    @IBOutlet weak var textFieldPasswordRegister: UITextField!
    
    @IBAction func btnRregister_act(_ sender: Any) {
        register()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func register()
    {
        let URL = "http://localhost:8888/AppRestaurant/public/index.php/api/register"
        let parameters: Parameters = ["name": textFieldNameRegister.text!, "email": textFieldEmailRegister.text!, "password": textFieldPasswordRegister.text!]
        
        Alamofire.request(URL,method: .post,parameters:parameters).responseJSON
            {
                response in
                if let result = response.result.value
                {
                    let jsondata = result as! NSDictionary
                    print(response.result.value)
                    ;if self.textFieldEmailRegister.text?.isEmpty ?? true {
                        print("textField is empty")
                        let alertController = UIAlertController(title: "campos vacios",message: "hey", preferredStyle: UIAlertController.Style.alert)
                        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                    }
                      else{
                        let alertController = UIAlertController(title: "registrado",message: "hey", preferredStyle: UIAlertController.Style.alert)
                        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
        }
    }

}