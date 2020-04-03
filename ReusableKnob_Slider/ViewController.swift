//
//  ViewController.swift
//  ReusableKnob_Slider
//
//  Created by Mayur Mori on 17/09/19.
//  Copyright © 2019 Mayur Mori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOUTLET -
    @IBOutlet weak var knob: Knob!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var switchAnimate: UISwitch!
    
    // MARK: - VIEW LIFE CYCLE METHODS -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.updateLabel()
    }
    
    // MARK: - FUNCTIONS -
    private func setupUI() {
        knob.lineWidth = 4
        knob.pointerLength = 12
        knob.setValue(slider.value)
        knob.addTarget(self, action: #selector(ViewController.slider_ValueChanged(_:)), for: .valueChanged)
    }
    
    private func updateLabel() {
        lblValue.text = String(format: "%.2f", knob.value)
    }
    
    // MARK: - IB ACTIONS -
    @IBAction func slider_ValueChanged(_ sender: UISlider) {
        if sender is UISlider {
            knob.setValue(slider.value)
        } else {
            slider.value = knob.value
        }
        updateLabel()
    }
    
    @IBAction func btnRandomValue_Clicked(_ sender: UIButton) {
        let randomValue = Float(arc4random_uniform(101)) / 100.0
        knob.setValue(randomValue, animated: switchAnimate.isOn)
        slider.setValue(Float(randomValue), animated: switchAnimate.isOn)
        updateLabel()
    }
}
