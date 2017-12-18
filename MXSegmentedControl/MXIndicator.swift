// MXIndicator.swift
//
// Copyright (c) 2017 Maxime Epain
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

public class MXIndicator: UIView {
    
    /// The indicator line position
    ///
    /// - top: The line will be drawn at the top of the segemented control
    /// - bottom: The line will be drawn at the bottom of the segemented control
    public enum Position {
        case top
        case bottom
    }
    
    /// The indicator insets
    public var contentEdgeInsets = UIEdgeInsets.zero
    
    /// The indicator line view.
    public let lineView = UIView()
    
    public var linePosition = Position.bottom
    
    /// The indicator box view.
    public let boxView = UIView()
    
    /// The line height value.
    public var lineHeight: CGFloat = 1
    
    /// :nodoc:
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    /// :nodoc:
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    private func initialize() {
        
        lineView.backgroundColor = tintColor
        boxView.backgroundColor = tintColor
        boxView.alpha = 0

        addSubview(boxView)
        addSubview(lineView)
    }
    
    /// :nodoc:
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        var frame = UIEdgeInsetsInsetRect(bounds, contentEdgeInsets)
        
        if linePosition == .top {
            
            lineView.frame = CGRect(x: 0, y: 0, width: frame.width, height: lineHeight)
            
            frame.origin.y = lineHeight
            frame.size.height -= lineHeight
            boxView.frame = frame
            
        } else {
            frame.size.height -= lineHeight
            boxView.frame = frame
            
            frame.origin.y = frame.size.height
            frame.size.height = lineHeight
            lineView.frame = frame
        }
    }

}
