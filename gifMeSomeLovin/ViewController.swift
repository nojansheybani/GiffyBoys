//
//  ViewController.swift
//  gifMeSomeLovin
//
//  Created by Nojan Sheybani on 7/20/18.
//  Copyright © 2018 Nojan Sheybani. All rights reserved.
//

import UIKit
import GiphyCoreSDK
import FLAnimatedImage

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var gif: FLAnimatedImageView!
    @IBOutlet weak var giffyLabel: UILabel!
    @IBOutlet weak var categoryStack: UIStackView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var nojan: UILabel!
    @IBOutlet weak var russell: UILabel!
    @IBOutlet weak var joe: UILabel!
    @IBOutlet weak var tommy: UILabel!
    
    var nojanScore = 0
    var joeScore = 0
    var russellScore = 0
    var tommyScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GiphyCore.configure(apiKey: "OfZyxoC76p3imNxos4QnymRZ3OW63KFb")
        // Do any additional setup after loading the view, typically from a nib.
        giffyLabel.center.x = self.view.center.x
        gif.center.x = self.view.center.x
        sendButton.layer.cornerRadius = 5
        self.hideKeyboardWhenTappedAround()
        nojan.text = String(nojanScore)
        joe.text = String(joeScore)
        russell.text = String(russellScore)
        tommy.text = String(tommyScore)
        gif.image = #imageLiteral(resourceName: "theboys")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPush(_ sender: Any) {
        _ = GiphyCore.shared.random(textField.text!) { (response, error) in
            if let response = response, let data = response.data  {
                print(response.meta)
                print(data.url)
                let finalURL = "https://media.giphy.com/media/" + data.id + "/giphy.gif"
                print(finalURL)
                self.setImage(path:finalURL)
            } else {
                print("No Result Found")
            }
        }
    }
    func setImage(path:String){
        DispatchQueue.main.async {
            let url = URL(string: path)!
            let imageData = try? Data(contentsOf: url)
            let imageData3 = FLAnimatedImage(animatedGIFData: imageData)
            self.gif.animatedImage = imageData3
        }
    }
    
    @IBAction func nojanButtonPressed(_ sender: Any) {
        nojanScore+=1
        nojan.text = String(nojanScore)
    }
    
    @IBAction func russellButtonPressed(_ sender: Any) {
        russellScore+=1
        russell.text = String(russellScore)
    }
    
    @IBAction func joeButtonPressed(_ sender: Any) {
        joeScore+=1
        joe.text = String(joeScore)
    }
    
    @IBAction func tommyButtonPressed(_ sender: Any) {
        tommyScore+=1
        tommy.text = String(tommyScore)
    }
    
    
}

