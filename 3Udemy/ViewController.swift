//
//  ViewController.swift
//  3Udemy
//
//  Created by ElenaL on 30.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redValueLabel: UILabel!
    
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenValueLabel: UILabel!
    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var mixedColorView: UIView!
    
    let minColorValue: Float = 0
    let maxColorValue: Float = 255
    var mediumColorValue: Float {
        return (maxColorValue - minColorValue) / 2 + minColorValue
    }
    var slidersArray: [UISlider] {
        return [redSlider, greenSlider, blueSlider]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetupSliders()
        updateAllSlidersValue(mediumColorValue)
        updateSliderValue()
        displayColors()
    }
    func updateSliderValue() {
        redValueLabel.text = "\(Int(redSlider.value))"
        greenValueLabel.text = "\(Int(greenSlider.value))"
        blueValueLabel.text = "\(Int(blueSlider.value))"
    }
    
    func updateAllSlidersValue(_ value: Float) {
        for slider in slidersArray {
            slider.value = value
        }
    }
    
    func displayColors(){
        let red = CGFloat((redSlider.value) / maxColorValue)
        let blue = CGFloat((blueSlider.value) / maxColorValue)
        let green = CGFloat((greenSlider.value) / maxColorValue)
        
        mixedColorView.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1.0)
    }
    
    func setupBoundaryValue(for slider: UISlider) {
        slider.minimumValue = minColorValue
        slider.maximumValue = maxColorValue
    }
    
    func initialSetupSliders() {
        for slider in slidersArray {
            setupBoundaryValue(for: slider)
        }
    }

    @IBAction func redSliderValueChang(_ sender: UISlider) {
        updateSliderValue()
        displayColors()
    }
    
    @IBAction func greenSliderValueChang(_ sender: UISlider) {
        updateSliderValue()
        displayColors()
    }
    
    @IBAction func blueSliderValueChang(_ sender: Any) {
        updateSliderValue()
        displayColors()
    }
    
    @IBAction func minPressed(_ sender: UIButton) {
        updateAllSlidersValue(minColorValue)
        updateSliderValue()
        displayColors()
    }
    
    @IBAction func medPressed(_ sender: Any) {
        updateAllSlidersValue(mediumColorValue)
        updateSliderValue()
        displayColors()
    }
    
    @IBAction func maxPressed(_ sender: Any) {
        updateAllSlidersValue(maxColorValue)
        updateSliderValue()
        displayColors()
    }
    
    
}

