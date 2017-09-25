//
//  ViewController.swift
//  DashedLineSwiftExam
//
//  Created by Steve JobsOne on 5/14/17.
//  Copyright © 2017 Steve JobsOne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ob = DashedLine()
        ob.dashedWidth = 5.0
        ob.dashedSpace = 3.0
        ob.dashedLineHeight = 1.0
        ob.dashedLineSpaceFromView = 10.0
        
        ob.dashedLineColor = UIColor.init(colorLiteralRed: 229.0/255.0 , green: 229.0/255.0, blue: 229.0/255.0 , alpha: 1.0)
        
        ob.drawDashedLineWithView(view: containerView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


