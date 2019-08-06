// MXSegment.swift
//
// Copyright (c) 2019 Maxime Epain
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

/// A segment button embed in MXSegmentedControl
@objcMembers
public class MXSegment: UIButton {
    
    /// The Image position in segment related to title.
    ///
    /// - top: Image will be placed on top of the title.
    /// - left: Image will be placed at the left of the title.
    /// - bottom: Image will be placed below the title.
    /// - right: Image will be placed at the right of the title.
    public enum ImagePosition {
        case top
        case left
        case bottom
        case right
    }
    
    /// The image position related to the title.
    public var imagePosition = ImagePosition.top
    
    /// Padding between segment title and image
    public var padding: CGFloat = 8
    
    /// The segment width
    public var width: CGFloat {
        get {
            guard _width == UIView.noIntrinsicMetric else { return _width }
            return intrinsicContentSize.width
        }
        set { _width = newValue }
    }
    
    private var _width: CGFloat = UIView.noIntrinsicMetric
    
    @discardableResult public func set(width: CGFloat) -> MXSegment {
        self.width = width
        return self
    }
    
    @discardableResult public func set(image position: ImagePosition) -> MXSegment {
        self.imagePosition = position
        return self
    }
    
    @discardableResult public func set(padding: CGFloat) -> MXSegment {
        self.padding = padding
        return self
    }
    
    @discardableResult public func set(title: String?, for state: UIControl.State = .normal) -> MXSegment {
        super.setTitle(title, for: state)
        return self
    }
    
    @discardableResult public func set(titleColor: UIColor?, for state: UIControl.State = .normal) -> MXSegment {
        super.setTitleColor(titleColor, for: state)
        return self
    }
    
    @discardableResult public func set(image: UIImage?, for state: UIControl.State = .normal) -> MXSegment {
        super.setImage(image, for: state)
        return self
    }
    
    @discardableResult public func set(background image: UIImage?, for state: UIControl.State = .normal) -> MXSegment {
        super.setBackgroundImage(image, for: state)
        return self
    }
    
    @discardableResult public func set(attributedTitle: NSAttributedString?, for state: UIControl.State = .normal) -> MXSegment {
        super.setAttributedTitle(attributedTitle, for: state)
        return self
    }
    
}

// MARK: - Layouts

extension MXSegment {
    
    /// :nodoc:
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let titleLabel = titleLabel, let imageView = imageView else {
            return
        }
        
        guard !titleLabel.frame.isEmpty, !imageView.frame.isEmpty else {
            return
        }
        
        switch imagePosition {
        case .top:
            layoutTop(imageView, titleLabel)
        case .left:
            layoutLeft(imageView, titleLabel)
        case .bottom:
            layoutBottom(imageView, titleLabel)
        case .right:
            layoutRight(imageView, titleLabel)
        }
    }
    
    /// :nodoc:
    public override var intrinsicContentSize: CGSize {
        let titleSize = titleLabel?.intrinsicContentSize
        let imageSize = imageView?.intrinsicContentSize
        
        var size = CGSize.zero
        
        switch imagePosition {
        case .top, .bottom:
            
            if let titleSize = titleSize {
                size.height += titleSize.height
                size.height += titleEdgeInsets.top
                size.height += titleEdgeInsets.bottom
                
                var width = titleSize.width
                width += titleEdgeInsets.left
                width += titleEdgeInsets.right
                
                size.width = width
            }
            
            if let imageSize = imageSize {
                size.height += imageSize.height
                size.height += imageEdgeInsets.top
                size.height += imageEdgeInsets.bottom
                
                var width = imageSize.width
                width += imageEdgeInsets.left
                width += imageEdgeInsets.right
                
                size.width = max(size.width, width)
            }
            
            if titleLabel != nil || imageView != nil {
                size.height += padding
            }
            
        case .left, .right:
            
            if let titleSize = titleSize {
                size.width += titleSize.width
                size.width += titleEdgeInsets.left
                size.width += titleEdgeInsets.right
                
                var height = titleSize.height
                height += titleEdgeInsets.top
                height += titleEdgeInsets.bottom
                
                size.height = height
            }
            
            if let imageSize = imageSize {
                size.width += imageSize.height
                size.width += imageEdgeInsets.left
                size.width += imageEdgeInsets.right
                
                var height = imageSize.height
                height += imageEdgeInsets.top
                height += imageEdgeInsets.bottom
                
                size.height = max(size.height, height)
            }
            
            if titleLabel != nil || imageView != nil {
                size.width += padding
            }
        }
        
        if titleLabel != nil || imageView != nil {
            size.width += contentEdgeInsets.left
            size.width += contentEdgeInsets.right
            
            size.height += contentEdgeInsets.top
            size.height += contentEdgeInsets.bottom
        }
        return size
    }
    
    private func layoutTop(_ imageView: UIImageView, _ titleLabel: UILabel) {
        let contentRect = self.contentRect(forBounds: bounds)
        let imageSize = imageView.intrinsicContentSize
        let titleSize = titleLabel.intrinsicContentSize
        
        // Compute Image View Frame
        var width = contentRect.width
        width -= imageEdgeInsets.left
        width -= imageEdgeInsets.right
        width = min(width, imageSize.width)
        
        var height = contentRect.height
        height -= imageEdgeInsets.top
        height -= imageEdgeInsets.bottom
        height -= titleEdgeInsets.top
        height -= titleEdgeInsets.bottom
        height -= titleSize.height
        height -= padding
        height = min(height, imageSize.height)
        
        var x = max(contentRect.minX + imageEdgeInsets.left,
                    contentRect.midX - width / 2)
        var y = max(contentRect.minY + imageEdgeInsets.top,
                    contentRect.midY - (height + titleSize.height + padding) / 2)
        
        imageView.frame = CGRect(x: x, y: y, width: width, height: height)
        //
        
        // Compute Title Label Frame
        x = max(contentRect.minX + titleEdgeInsets.left,
                contentRect.midX - titleSize.width / 2)
        y = imageView.frame.maxY
        y += imageEdgeInsets.bottom
        y += padding
        y += titleEdgeInsets.top
        
        width = contentRect.width
        width -= titleEdgeInsets.left
        width -= titleEdgeInsets.right
        width = min(width, titleSize.width)
        
        titleLabel.frame = CGRect(x: x, y: y, width: width, height: titleSize.height)
        //
    }
    
    private func layoutBottom(_ imageView: UIImageView, _ titleLabel: UILabel) {
        let contentRect = self.contentRect(forBounds: bounds)
        let imageSize = imageView.intrinsicContentSize
        let titleSize = titleLabel.intrinsicContentSize
        
        // Compute Title Label Frame
        var width = contentRect.width
        width -= titleEdgeInsets.left
        width -= titleEdgeInsets.right
        width = min(width, titleSize.width)
        
        var height = contentRect.height
        height -= imageEdgeInsets.top
        height -= imageEdgeInsets.bottom
        height -= titleEdgeInsets.top
        height -= titleEdgeInsets.bottom
        height -= titleSize.height
        height -= padding
        height = min(height, imageSize.height)
        
        var x = max(contentRect.minX + titleEdgeInsets.left,
                    contentRect.midX - titleSize.width / 2)
        var y = max(contentRect.minY + titleEdgeInsets.top,
                    contentRect.midY - (height + titleSize.height + padding) / 2)
        
        titleLabel.frame = CGRect(x: x, y: y, width: width, height: titleSize.height)
        //
        
        // Compute Image View Frame
        width = contentRect.width
        width -= imageEdgeInsets.left
        width -= imageEdgeInsets.right
        width = min(width, imageSize.width)
        
        x = max(contentRect.minX + imageEdgeInsets.left,
                    contentRect.midX - width / 2)
        
        y = titleLabel.frame.maxY
        y += titleEdgeInsets.bottom
        y += padding
        y += imageEdgeInsets.top
        
        imageView.frame = CGRect(x: x, y: y, width: width, height: height)
        //
    }
    
    private func layoutLeft(_ imageView: UIImageView, _ titleLabel: UILabel) {
        let contentRect = self.contentRect(forBounds: bounds)
        let imageSize = imageView.intrinsicContentSize
        let titleSize = titleLabel.intrinsicContentSize
        
        // Compute Image View Frame
        var width = contentRect.width
        width -= imageEdgeInsets.left
        width -= imageEdgeInsets.right
        width -= titleEdgeInsets.left
        width -= titleEdgeInsets.right
        width -= padding
        width = min(width, imageSize.width)
        
        var height = contentRect.height
        height -= imageEdgeInsets.top
        height -= imageEdgeInsets.bottom
        height = min(height, imageSize.height)
        
        var x = max(contentRect.minX + imageEdgeInsets.left,
                    contentRect.midX - (width + titleSize.width + padding) / 2)
        var y = max(contentRect.minY + imageEdgeInsets.top,
                    contentRect.midY - height / 2)
        
        imageView.frame = CGRect(x: x, y: y, width: width, height: height)
        //
        
        // Compute Title Label Frame
        y = max(contentRect.minY + titleEdgeInsets.top,
                contentRect.midY - titleSize.height / 2)
        x = imageView.frame.maxX
        x += imageEdgeInsets.right
        x += padding
        x += titleEdgeInsets.left
        
        height = contentRect.height
        height -= titleEdgeInsets.top
        height -= titleEdgeInsets.bottom
        height = min(height, titleSize.height)
        
        width = contentRect.maxX
        width -= titleEdgeInsets.right
        width -= x
        
        titleLabel.frame = CGRect(x: x, y: y, width: width, height: height)
        //
    }
    
    private func layoutRight(_ imageView: UIImageView, _ titleLabel: UILabel) {
        let contentRect = self.contentRect(forBounds: bounds)
        let imageSize = imageView.intrinsicContentSize
        let titleSize = titleLabel.intrinsicContentSize
        
        // Compute Title Label Frame
        var width = contentRect.width
        width -= imageEdgeInsets.left
        width -= imageEdgeInsets.right
        width -= titleEdgeInsets.left
        width -= titleEdgeInsets.right
        width -= padding
        width -= imageSize.width
        
        var height = contentRect.height
        height -= titleEdgeInsets.top
        height -= titleEdgeInsets.bottom
        height = min(height, titleSize.height)
        
        var x = max(contentRect.minX + titleEdgeInsets.left,
                    contentRect.midX - (imageSize.width + width + padding) / 2)
        var y = max(contentRect.minY + titleEdgeInsets.top,
                    contentRect.midY - height / 2)
        
        titleLabel.frame = CGRect(x: x, y: y, width: width, height: height)
        //
        
        // Compute Image View Frame
        x += width
        x += titleEdgeInsets.right
        x += padding
        x += imageEdgeInsets.left
        
        y = max(contentRect.minY + imageEdgeInsets.top,
                contentRect.midY - imageSize.height / 2)
        
        width = contentRect.maxX
        width -= imageEdgeInsets.left
        width -= imageEdgeInsets.right
        width = min(width, imageSize.width)
        
        height = contentRect.height
        height -= imageEdgeInsets.top
        height -= imageEdgeInsets.bottom
        height = min(height, imageSize.height)
        
        imageView.frame = CGRect(x: x, y: y, width: width, height: height)
        //
    }
    
}
