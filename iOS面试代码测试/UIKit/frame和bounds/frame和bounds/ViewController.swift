//
//  ViewController.swift
//  frame和bounds
//
//  Created by gaoliang on 2022/1/11.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView: UIScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testFrameAndBounds()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch")
        
        // scrollView.bounds.origin == scrollview.contentOffset
        //
    }
    
    
    func testFrameAndBounds() -> () {
        let v = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        
        v.backgroundColor = .red
        
        let subView = UIView(frame:CGRect(x: 0, y: 0, width: 50, height: 50))
        subView.backgroundColor = .blue
        
        v.addSubview(subView)
        view.addSubview(v)
        
        v.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
    }
    
    func testScrollView() {
        let scrollview = UIScrollView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
        
        scrollview.contentSize = CGSize(width: 400, height: 200)
        
        scrollview.backgroundColor = .link
        
        view.addSubview(scrollview)
        
        self.scrollView = scrollview
    }
    
    
    func testCustomScrollView() {
        let customScrollView = GLScrollView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
        
        customScrollView.backgroundColor = .brown
        
        view.addSubview(customScrollView)
    }
}

