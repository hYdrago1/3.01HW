//
//  ViewController.swift
//  3.01HW
//
//  Created by Ivan Honcharov on 15.10.25.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    @IBOutlet var animationView: SpringView!
    @IBOutlet weak var actionButton: SpringButton!
    
    // MARK: - Private properties
    private var nextPreset: AnimationPreset = .pop
    private var nextCurve: AnimationCurve = .easeIn
    private var nextForce: CGFloat = 1.0
    private var nextDuration: CGFloat = 0.7
    private var nextDelay: CGFloat = 0.0
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        generateNextAnimation()
        updateLabels()
    }
    
    // MARK: - IBAction
    @IBAction func startAnimation(_ sender: SpringButton) {

        animationView.animation = nextPreset.rawValue
        animationView.curve = nextCurve.rawValue
        animationView.force = nextForce
        animationView.duration = nextDuration
        animationView.delay = nextDelay
        
        updateLabels()
        animationView.animate()
        generateNextAnimation()
        updateButtonTitleWithNextAnimation()
    }
    
    // MARK: - Private functions
    private func generateNextAnimation() {
        nextPreset = AnimationPreset.allCases.randomElement() ?? .pop
        nextCurve = AnimationCurve.allCases.randomElement() ?? .easeIn
        nextForce = CGFloat.random(in: 0.5...2.0)
        nextDuration = CGFloat.random(in: 0.5...1.5)
        nextDelay = CGFloat.random(in: 0.0...0.5)
    }
    
    private func updateButtonTitleWithNextAnimation() {
        actionButton.setTitle("Run: \(nextPreset.rawValue)", for: .normal)
    }
    
    private func updateLabels() {
        presetLabel.text = "preset: \(nextPreset.rawValue)"
        curveLabel.text = "curve: \(nextCurve.rawValue)"
        forceLabel.text = String(format: "force: %.2f", animationView.force)
        durationLabel.text = String(format: "duration: %.2f", animationView.duration)
        delayLabel.text = String(format: "delay: %.2f", animationView.delay)
    }
}
