// CustomViewController.swift
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
import MXSegmentedControl

class CustomViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl1: MXSegmentedControl!
    @IBOutlet weak var segmentedControl2: MXSegmentedControl!
    @IBOutlet weak var segmentedControl3: MXSegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl1.append(title: "First")
        segmentedControl1.append(title: "Second")
        segmentedControl1.append(title: "Third")
        segmentedControl1.append(title: "Fourth")
        segmentedControl1.append(title: "Fifth")
        segmentedControl1.append(title: "Sixth")
        segmentedControl1.append(title: "Seven")
        segmentedControl1.append(title: "Eight")
        segmentedControl1.append(title: "Nine")
        segmentedControl1.animation.duration = 0
        
        segmentedControl2.append(title: "First")
        segmentedControl2.append(title: "Second")
        
        segmentedControl3.append(title: "First")
            .set(title: #colorLiteral(red: 0.9981629252, green: 0.6096215844, blue: 0.6670924425, alpha: 1), for: .selected)
        segmentedControl3.append(title: "Second")
            .set(title: #colorLiteral(red: 1, green: 0.7996580601, blue: 0.4006214142, alpha: 1), for: .selected)
        segmentedControl3.append(title: "Third")
            .set(title: #colorLiteral(red: 0.9995033145, green: 0.9875727296, blue: 0.4039593935, alpha: 1), for: .selected)
        segmentedControl3.append(title: "Fourth")
            .set(title: #colorLiteral(red: 0.8013994098, green: 0.9842005372, blue: 0.4007700682, alpha: 1), for: .selected)
        segmentedControl3.append(title: "Fifth")
            .set(title: #colorLiteral(red: 0.4016934037, green: 0.9801344275, blue: 0.3977853954, alpha: 1), for: .selected)
        
        segmentedControl3.indicator.boxView.alpha = 0.1
        
        segmentedControl3.addTarget(self, action: #selector(changeIndex(segmentedControl:)), for: .valueChanged)
    }
    
    @objc func changeIndex(segmentedControl: MXSegmentedControl) {
                
        if let segment = segmentedControl.segment(at: segmentedControl.selectedIndex) {
            segmentedControl.indicator.boxView.backgroundColor = segment.titleColor(for: .selected)
            segmentedControl.indicator.lineView.backgroundColor = segment.titleColor(for: .selected)
        }
    }
    
}

