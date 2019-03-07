// HMSegmentedControlViewController.swift
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
import MXSegmentedControl

class HMSegmentedControlViewController: UIViewController {
    
    @IBOutlet weak var segmentControl1: MXSegmentedControl!
    @IBOutlet weak var segmentControl2: MXSegmentedControl!
    @IBOutlet weak var segmentControl3: MXSegmentedControl!
    @IBOutlet weak var segmentControl4: MXSegmentedControl!
    @IBOutlet weak var segmentControl5: MXSegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        segmentControl1.append(title: "Trending")
        segmentControl1.append(title: "News")
        segmentControl1.append(title: "Library")
        segmentControl1.indicator.linePosition = .top
        
        segmentControl2.append(title: "One")
        segmentControl2.append(title: "Two")
        segmentControl2.append(title: "Three")
        segmentControl2.append(title: "Four")
        segmentControl2.append(title: "Five")
        segmentControl2.append(title: "Six")
        segmentControl2.append(title: "Seven")
        segmentControl2.append(title: "Eight")
        segmentControl2.segmentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        
        segmentControl3.append(image: #imageLiteral(resourceName: "1"))
            .set(image: #imageLiteral(resourceName: "1-selected"), for: .selected)
            .set(image: .left)
            .imageView?.contentMode = .scaleAspectFit
        segmentControl3.append(image: #imageLiteral(resourceName: "2"))
            .set(image: #imageLiteral(resourceName: "2-selected"), for: .selected)
            .set(image: .left)
            .imageView?.contentMode = .scaleAspectFit
        segmentControl3.append(image: #imageLiteral(resourceName: "3"))
            .set(image: #imageLiteral(resourceName: "3-selected"), for: .selected)
            .set(image: .left)
            .imageView?.contentMode = .scaleAspectFit
        segmentControl3.append(image: #imageLiteral(resourceName: "4"))
            .set(image: #imageLiteral(resourceName: "4-selected"), for: .selected)
            .set(image: .left)
            .imageView?.contentMode = .scaleAspectFit
        
        segmentControl4.append(title: "One")
        segmentControl4.append(title: "Two")
        segmentControl4.append(title: "Three")
        segmentControl4.append(title: "4")
        segmentControl4.append(title: "Five")
        
        segmentControl5.append(title: "Worldwide")
        segmentControl5.append(title: "Local")
        segmentControl5.append(title: "Headlines")
        segmentControl5.indicator.linePosition = .top
    }

}
