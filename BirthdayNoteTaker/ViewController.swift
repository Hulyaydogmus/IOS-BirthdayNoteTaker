//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Mojave on 18.02.2020.
//  Copyright © 2020 Hulya Aydogmus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //  textlere yazılan ifadeleri  kaydedip  uygulamayı yeniden başlattığımızda kayıtlı olan ifadeyi yeniden  görmemizi sağlayan kod bloğudur
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        // casting - as? yapabilirsen yap   yada  as!---> force casting
        //Any
        
        if let newName = storedName as? String{
            nameLabel.text = "Name: \(newName)"
        }
        if let newBirthday = storedBirthday as? String{
            birthdayLabel.text = "Birthday: \(newBirthday)"
        }
        
    }
    
        @IBAction func saveClicked(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text!, forKey: "name")//veri kaydetmek için userdefaults sınıfı kullanılır. key value kaydetmek için dictionary gibi
        UserDefaults.standard.set(birthdayTextField.text,forKey: "birthday")
        //   UserDefaults.standard  dediğimizde bu objeye  her yerden  ulaşılabilir  çağırırken forkey leri ile çağırılır.
        nameLabel.text = "Name: \(nameTextField.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
    }
    
    
    @IBAction func deleteClicked(_ sender: Any) {
        
         let storedName = UserDefaults.standard.object(forKey: "name")
         let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // "" tanımlanmış boş değer  vs   nil tanımlanmış ama initialize edilmemiş
        if (storedName as? String) != nil{
             UserDefaults.standard.removeObject(forKey: "name")
             nameLabel.text = "Name:"
        }
        if (storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday:"
        }
        
    }
    
}

