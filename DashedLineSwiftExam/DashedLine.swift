//
//  DashedLine.swift
//  TableViewApp
//
//  Created by Steve JobsOne on 5/11/17.
//  Copyright © 2017 Steve JobsOne. All rights reserved.
//

import UIKit

class DashedLine: UIView {
    
    var dashedWidth:CGFloat?
    var dashedSpace:CGFloat?
    var dashedLineHeight:CGFloat?
    var dashedLineSpaceFromView:CGFloat?
    var dashedLineColor:UIColor?
    
    private var screenWidth:CGFloat?
    private var totalSpace:CGFloat?
    private var numberOfDashedView:Int?
    private var floatingPoint:CGFloat?
    let lineView = UIView()
    
    public func drawDashedLineWithView(view: UIView){
        
        screenWidth = UIScreen.main.bounds.size.width - (dashedLineSpaceFromView! * 2)
        totalSpace = dashedSpace! + dashedWidth!
        numberOfDashedView = Int((screenWidth! / totalSpace!))
        
        floatingPoint = (((screenWidth! / totalSpace!) - CGFloat(numberOfDashedView!)) * totalSpace!)/2;
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineView)
        
        lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: floatingPoint!).isActive = true
        lineView.topAnchor.constraint(equalTo: view.topAnchor, constant: (view.frame.size.height/2)).isActive = true
        lineView.widthAnchor.constraint(equalToConstant:(screenWidth! - (floatingPoint!*2))).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        
        for i in 0 ..< Int(numberOfDashedView!) {
            
            drawDashedLineWithIndex(index: i, viewWidth:(screenWidth!-(floatingPoint!*2)),lineView: lineView)
        }
        
        //lineView.backgroundColor = UIColor.clear
         lineView.backgroundColor = UIColor.clear
        
    }
    
    private func drawDashedLineWithIndex(index:Int,viewWidth:CGFloat ,lineView:UIView){
        
        let view = UIView ()
        
        if index == 0 {
            
            dashedViewForFirstPosition(view: view, index: index, viewWidth: viewWidth , lineView:lineView)
            view.backgroundColor = dashedLineColor!
            
        } else if index == Int(numberOfDashedView!) - 1 {
            
            dashedViewForLastPosition(view: view, index: index, viewWidth: viewWidth , lineView:lineView)
            view.backgroundColor = dashedLineColor!
        } else {
            
            dashedViewMiddPosition(view: view, index: index, viewWidth: viewWidth , lineView:lineView)
            view.backgroundColor = dashedLineColor!
        }
        
        
    }
    
    private func dashedViewForFirstPosition(view:UIView , index: Int ,viewWidth:CGFloat ,lineView:UIView) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        lineView.addSubview(view)
        view.leadingAnchor.constraint(equalTo: lineView.leadingAnchor, constant: 0).isActive = true
        view.topAnchor.constraint(equalTo: lineView.topAnchor, constant: 0).isActive = true
        view.widthAnchor.constraint(equalToConstant:dashedWidth!).isActive = true
        view.heightAnchor.constraint(equalToConstant: dashedLineHeight!).isActive = true
        
    }
    
    private func dashedViewForLastPosition(view:UIView , index: Int ,viewWidth:CGFloat ,lineView:UIView) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        lineView.addSubview(view)
        view.leadingAnchor.constraint(equalTo: lineView.leadingAnchor, constant: viewWidth - (dashedWidth)!).isActive = true
        view.topAnchor.constraint(equalTo: lineView.topAnchor, constant: 0).isActive = true
        view.widthAnchor.constraint(equalToConstant:dashedWidth!).isActive = true
        view.heightAnchor.constraint(equalToConstant: dashedLineHeight!).isActive = true
        
    }
    
    private func dashedViewMiddPosition(view:UIView , index: Int ,viewWidth:CGFloat ,lineView:UIView) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        lineView.addSubview(view)
        view.leadingAnchor.constraint(equalTo: lineView.leadingAnchor, constant: CGFloat(index) * (totalSpace! + (dashedSpace! / CGFloat(numberOfDashedView! - 2)))).isActive = true
        view.topAnchor.constraint(equalTo: lineView.topAnchor, constant: 0).isActive = true
        view.widthAnchor.constraint(equalToConstant:dashedWidth!).isActive = true
        view.heightAnchor.constraint(equalToConstant: dashedLineHeight!).isActive = true
        
    }
    
    
    

    
   }
