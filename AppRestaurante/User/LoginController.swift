//
//  LoginController.swift
//  AppRestaurante
//
//  Created by Daniel Miranda on 28/05/2019.
//  Copyright © 2019 Daniel Miranda. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

var token:String?

class LoginController: UIViewController {
    
    @IBOutlet weak var textFieldEmailLogin: UITextField!
    @IBOutlet weak var textFieldPasswordLogin: UITextField!
    
    @IBAction func btnLogin(_ sender: Any) {
        login()
        //self.performSegue(withIdentifier: "openmain", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func login()
    {
        let URL = "http://localhost:8888/AppRest/public/index.php/api/login"
        let parameters: Parameters = ["email": textFieldEmailLogin.text!, "password": textFieldPasswordLogin.text!]
    
        Alamofire.request(URL,method: .post,parameters:parameters).responseJSON
            {
                response in
                if let result = response.result.value
                {
                    let jsondata = result as! NSDictionary
                    print(response.result.value)
                    ;if self.textFieldEmailLogin.text?.isEmpty ?? true {
                        print("textField is empty")
                        let alertController = UIAlertController(title: "campos vacios",message: "hey", preferredStyle: UIAlertController.Style.alert)
                        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                    }
                    else{
                        self.performSegue(withIdentifier: "openmain", sender: nil)
                        let alertController = UIAlertController(title: "logeado",message: "hey", preferredStyle: UIAlertController.Style.alert)
                        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                        
                    }
                    
                    
                }

            }
        
        }

    }

