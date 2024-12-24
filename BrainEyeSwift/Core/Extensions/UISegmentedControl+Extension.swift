//
//  UISegmentedControl+Extension.swift
//  BrainEyeSwift
//
//  Created by Paul on 24/12/2024.
//

import UIKit

extension UISegmentedControl {
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
}
