//
//  GLScrollView.swift
//  frame和bounds
//
//  Created by gaoliang on 2022/1/11.
//

import UIKit

class GLScrollView: UIView {
    
    var pointLeftTop: CGPoint = CGPoint();
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: event
    
    @objc private func pan(sender: UIPanGestureRecognizer) {
        print(sender)
        
        let pointSuperView = sender.location(in: superview)
        
        let point = sender.setTranslation(CGPoint(), in: self)
        
        
        
        let offset = sender.translation(in: superview)
        print("offset == \(offset)")
        frame = frame.offsetBy(dx: offset.x, dy: offset.y)
    }
}

// MARK: - UI
private extension GLScrollView {
    func setupUI() {
        let panGes = UIPanGestureRecognizer(target: self, action: #selector(pan(sender:)))
        
        addGestureRecognizer(panGes)
    }
    
    
}
