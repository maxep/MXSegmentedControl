// SegmentioViewController.swift
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

class SegmentioViewController: UIViewController {
    
    @IBOutlet weak var segmentControl1: MXSegmentedControl!
    @IBOutlet weak var segmentControl2: MXSegmentedControl!
    @IBOutlet weak var segmentControl3: MXSegmentedControl!
    @IBOutlet weak var segmentControl4: MXSegmentedControl!
    @IBOutlet weak var segmentControl5: MXSegmentedControl!
    @IBOutlet weak var segmentControl6: MXSegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        segmentControl1.append(title: "Tornado")
        segmentControl1.append(title: "Earthquakes")
        segmentControl1.append(title: "Extreme heat")
        segmentControl1.append(title: "Eruption")
        segmentControl1.append(title: "Floods")
        segmentControl1.append(title: "Wildfires")
        
        segmentControl2.append(image: #imageLiteral(resourceName: "tornado"))
        segmentControl2.append(image: #imageLiteral(resourceName: "earthquakes"))
        segmentControl2.append(image: #imageLiteral(resourceName: "heat"))
        segmentControl2.append(image: #imageLiteral(resourceName: "eruption"))
        segmentControl2.append(image: #imageLiteral(resourceName: "floods"))
        segmentControl2.append(image: #imageLiteral(resourceName: "wildfires"))
        segmentControl2.segmentWidth = 128
        
        segmentControl3.append(title: "Tornado")
            .set(image: #imageLiteral(resourceName: "tornado"))
            .set(image: .top)
            .set(padding: 16)
        segmentControl3.append(title: "Earthquakes")
            .set(image: #imageLiteral(resourceName: "earthquakes"))
            .set(image: .top)
            .set(padding: 16)
        segmentControl3.append(title: "Extreme heat")
            .set(image: #imageLiteral(resourceName: "heat"))
            .set(image: .top)
            .set(padding: 16)
        segmentControl3.append(title: "Eruption")
            .set(image: #imageLiteral(resourceName: "eruption"))
            .set(image: .top)
            .set(padding: 16)
        segmentControl3.append(title: "Floods")
            .set(image: #imageLiteral(resourceName: "floods"))
            .set(image: .top)
            .set(padding: 16)
        segmentControl3.append(title: "Wildfires")
            .set(image: #imageLiteral(resourceName: "wildfires"))
            .set(image: .top)
            .set(padding: 16)

        segmentControl4.append(title: "Tornado")
            .set(image: #imageLiteral(resourceName: "tornado"))
            .set(image: .bottom)
            .set(padding: 16)
        segmentControl4.append(title: "Earthquakes")
            .set(image: #imageLiteral(resourceName: "earthquakes"))
            .set(image: .top)
            .set(padding: 16)
        segmentControl4.append(title: "Extreme heat")
            .set(image: #imageLiteral(resourceName: "heat"))
            .set(image: .right)
        segmentControl4.append(title: "Eruption")
            .set(image: #imageLiteral(resourceName: "eruption"))
            .set(image: .left)
        segmentControl4.append(title: "Floods")
            .set(image: #imageLiteral(resourceName: "floods"))
            .set(image: .bottom)
            .set(padding: 16)
        segmentControl4.append(title: "Wildfires")
            .set(image: #imageLiteral(resourceName: "wildfires"))
            .set(image: .top)
            .set(padding: 16)
    }

}

extension UIFont {
    
    class func exampleAvenirMedium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Book", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func exampleAvenirLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
}
