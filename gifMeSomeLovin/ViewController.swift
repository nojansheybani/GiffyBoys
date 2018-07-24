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

class ViewController: UIViewController {
    
    @IBOutlet weak var gif: FLAnimatedImageView!
    @IBOutlet weak var giffyLabel: UILabel!
    @IBOutlet weak var categoryStack: UIStackView!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GiphyCore.configure(apiKey: "OfZyxoC76p3imNxos4QnymRZ3OW63KFb")
        // Do any additional setup after loading the view, typically from a nib.
        giffyLabel.center.x = self.view.center.x
        gif.center.x = self.view.center.x
        sendButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPush(_ sender: Any) {
        _ = GiphyCore.shared.random("power rangers") { (response, error) in
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
}

