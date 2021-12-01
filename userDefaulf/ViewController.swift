//
//  ViewController.swift
//  userDefaulf
//
//  Created by zed on 9/17/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var fristName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var password: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

  
        if UserDefaults.standard.bool(forKey: "register") == true {
            let vc = storyboard?.instantiateViewController(identifier: "home") as? HomeViewController
            navigationController?.pushViewController(vc!, animated: true)
        }
        self.password.isSecureTextEntry = true

    }
    @IBAction func pickerImage(_ sender: Any) {

        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
    present(vc,animated: true, completion: nil)
        
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
//        if fristName.text == fristName.text && lastName.text == lastName.text{
            
//            UserDefaults.standard.set(fristName.text, forKey: "FristName")
//            UserDefaults.standard.set(lastName.text, forKey: "LastName")
//            UserDefaults.standard.set(gender.text, forKey: "Gender")
//            UserDefaults.standard.set(phoneNumber.text, forKey: "PhoneNumber")
//            UserDefaults.standard.set(password.text, forKey: "password")
        
         let persons = Person()
        persons.fristName = fristName.text!
        persons.lastName = lastName.text!
        persons.gender = gender.text!
        persons.phoneNum = phoneNumber.text!
        persons.password = password.text!
        
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(persons), forKey: "person")
        print("save data is complate...!")
            
            UserDefaults.standard.set(true, forKey: "register")
            let vc = storyboard?.instantiateViewController(identifier: "home") as? HomeViewController
            navigationController?.pushViewController(vc!, animated: true)
//        }
        
  
        
    }
    
}


extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // saveData Image
 
        if let imageURL = info[UIImagePickerController.InfoKey.imageURL] as! URL? {
          UserDefaults.standard.set(imageURL, forKey: "ImagePicker")
          UserDefaults.standard.synchronize()
            
            print("save image")
        }
        // picker defaults for pick image
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
