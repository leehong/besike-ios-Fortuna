//
//  ViewController.swift
//  besike-ios-Fortuna
//
//  Created by stackvirgil on 14-10-17.
//  Copyright (c) 2014年 stackvirgil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quotationTextView: UITextView!
    
    @IBAction func rootViewTapped(sender: UITapGestureRecognizer) {
        displayRandomQuote()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayRandomQuote()
        // Do any additional setup after loading the view, typically from a nib.
        println("Hacking in Swift, since iOS" + "8")
        println("controller: \(self)")
        println("view: \(self.view)")
        println("view's frame: \(self.view.frame)")
        let path = NSBundle.mainBundle().pathForResource("positiveQuotes", ofType: "json")
        println("positive quotes path: \(path)")
        
        println("viewDidLoad quotationTextView: \(quotationTextView)")
        
        quotationTextView.editable = false
        quotationTextView.selectable = false
        displayRandomQuote()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func awakeFromNib() {
        // The super method doesn't do anything, but we call it anyway.
        super.awakeFromNib()
        println("awakeFromNib quotationTextView: \(quotationTextView)")
    }
    
    func displayRandomQuote() {
        
        var delegate = UIApplication.sharedApplication().delegate as AppDelegate
        var quotes : [String]!
        quotes = arc4random_uniform(2) == 1 ? delegate.positiveQuotes : delegate.negativeQuotes
        var quote : String = quotes[Int(arc4random_uniform(UInt32(quotes.count)))]
        quotationTextView.text = quote
    }


}

