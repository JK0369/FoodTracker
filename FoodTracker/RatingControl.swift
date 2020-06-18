//
//  RatingControl.swift
//  FoodTracker
//
//  Created by A10152 on 2020/06/18.
//  Copyright © 2020 A10152. All rights reserved.
//

import UIKit

@IBDesignable
class RatingControl: UIStackView {

    var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtons()
        }
    }
    
    @IBInspectable
    var starCount: Int = 5 {
        didSet {
            updateButtons()
        }
    }
    
    @IBInspectable
    var starSize: CGSize = CGSize(width: 44, height: 44) {
        didSet {
            updateButtons()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    func setupButton() {
        for btn in ratingButtons {
            removeArrangedSubview(btn)
            btn.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        for _ in 0..<starCount {
            let btn = UIButton()
            btn.setImage(UIImage(named: "emptyStar"), for: .normal)
            btn.setImage(UIImage(named: "FilledStar"), for: .selected)
            btn.setImage(UIImage(named: "highlightedStar"), for: .highlighted)
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            btn.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            btn.addTarget(self, action: #selector(selectStar(_:)), for: .touchUpInside)
            
            ratingButtons += [btn]
            addArrangedSubview(btn)
        }
    }
    
    @objc func selectStar(_ btn: UIButton) {
        guard let selectedInd = ratingButtons.firstIndex(of: btn) else {return}
        let r = selectedInd + 1
        if r == rating {
            rating = 0
        } else {
            rating = r
        }
        
        updateButtons()
    }
    
    func updateButtons() {
        for (ind, btn) in ratingButtons.enumerated() {
            btn.isSelected = ind < rating
            print(ind < rating)
        }
    }
}
