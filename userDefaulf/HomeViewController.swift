//
//  HomeViewController.swift
//  userDefaulf
//
//  Created by zed on 9/17/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var fristName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var password: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UserDefaults.standard.object(forKey: <#T##String#>)
//      let fName =  UserDefaults.standard.object(forKey: "FristName") as? String
//     let lName =   UserDefaults.standard.object(forKey: "LastName") as? String
//     let gen =   UserDefaults.standard.object(forKey: "Gender") as? String
//    let phoneNum = UserDefaults.standard.object(forKey: "PhoneNumber") as? String
//     let pass =   UserDefaults.standard.object(forKey: "password") as? String
        
        // Load the image from userDefaulfs
        if let imageURL = UserDefaults.standard.url(forKey: "ImagePicker") {
           if let data = NSData(contentsOf: imageURL) as NSData? {
              self.imageView.image = UIImage(data: data as Data)
            print("data show")
           }
        }
       var showData = Person()
        if let userData = UserDefaults.standard.value(forKey: "person") as? Data{
            let showData = try? PropertyListDecoder().decode(Person.self, from: userData)
            
            fristName.text = showData?.fristName
            lastName.text = showData?.lastName
            gender.text = showData?.gender
            phoneNumber.text = showData?.phoneNum
            password.text = showData?.password
            
            print("have been show of screen")
  
        }

    }
    
    @IBAction func pickImage(_ sender: Any) {
    
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc,animated: true, completion: nil)

    }
    
    @IBAction func logOutBtn(_ sender: Any) {
    
        UserDefaults.standard.set(false, forKey: "register")
        self.navigationController?.popViewController(animated: true)
        UserDefaults.standard.removeObject(forKey: "person")
        UserDefaults.standard.removeObject(forKey: "ImagePicker")
//        UserDefaults.standard.removeObject(forKey: "LastName")
//        UserDefaults.standard.removeObject(forKey: "Gender")
//        UserDefaults.standard.removeObject(forKey: "PhoneNumber")
//        UserDefaults.standard.removeObject(forKey: "password")
      
        print("have been delete")
        
    }

}

extension HomeViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Load the image
        if let imageURL = UserDefaults.standard.url(forKey: "ImagePicker") {
           if let data = NSData(contentsOf: imageURL) as NSData? {
              self.imageView.image = UIImage(data: data as Data)
           }
        }
        
//        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
//            imageView.image = image
//        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
