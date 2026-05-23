//
//  ClearScoreTableViewCell.swift
//  ClearScore
//
//  Created by Rider on 2026/03/16.
//

import UIKit
import SwiftUI

protocol ClearScoreTableViewCellDelegate {
    func didTapClearScoreCircle()
}


class ClearScoreTableViewCell: UITableViewCell {

    static let identifier = "ClearScoreTableViewCell"
    
    
    //MARK: - Outlets
    @IBOutlet weak var labelOne: UILabel! {
        didSet {
            self.labelOne.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var scoreLabel: UILabel! {
        didSet {
            self.scoreLabel.numberOfLines = 0
            self.scoreLabel.textColor = .systemPink
            self.scoreLabel.font = UIFont.systemFont(ofSize: 50, weight: .semibold)
            self.scoreLabel.textAlignment = .center
        }
    }
    
    @IBOutlet weak var labelTwo: UILabel! {
        didSet {
            self.labelTwo.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            self.containerView.backgroundColor = .clear
            self.containerView.layer.borderWidth = 0
            self.containerView.layer.borderColor = nil
            self.containerView.clipsToBounds = true
        }
    }
    

    //MARK: - Variables
    private let gradientLayer = CAGradientLayer()
    private let shapeLayer = CAShapeLayer()
    private var didSetup = false
    var delegate: ClearScoreTableViewCellDelegate?
    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        self.containerView.layoutIfNeeded()
        startPulseAnimation()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.superview?.layoutIfNeeded()
        setupGradientBorder()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let side = min(containerView.bounds.width, containerView.bounds.height)
        self.containerView.layer.cornerRadius = side / 2

        self.updateLayersFrame()
    }
    
    func decorateCell(clearScorePercentage: String?, subTitle: String?, delegate: ClearScoreTableViewCellDelegate?) {
        
        if self.delegate == nil {
            self.delegate = delegate
        }
        self.scoreLabel.text = clearScorePercentage
        self.labelTwo.text = subTitle
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapClearScoreCircle))
        self.containerView.isUserInteractionEnabled = true
        self.containerView.addGestureRecognizer(tapGesture)
    }
    
    
    
    //MARK: - Helper Method
    private func startPulseAnimation() {
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.fromValue = 1.0
        pulse.toValue = 1.1
        pulse.duration = 0.8
        pulse.autoreverses = true
        pulse.repeatCount = .infinity

        containerView.layer.add(pulse, forKey: "pulse")
    }
    
    
    private func setupGradientBorder() {
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 8
        shapeLayer.lineCap = .round

        containerView.layer.addSublayer(shapeLayer)

        gradientLayer.colors = [
            UIColor.systemPurple.cgColor,
            UIColor.systemPink.cgColor,
            UIColor.systemBlue.cgColor,
            UIColor.systemOrange.cgColor]

        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)

        containerView.layer.addSublayer(gradientLayer)

        gradientLayer.mask = shapeLayer
    }
    
    private func updateLayersFrame() {
        let bounds = containerView.bounds

        shapeLayer.frame = bounds
        gradientLayer.frame = bounds

        let radius = min(bounds.width, bounds.height) / 2 - 4

        let path = UIBezierPath(
            arcCenter: CGPoint(x: bounds.width / 2,
                               y: bounds.height / 2),
            radius: radius,
            startAngle: -CGFloat.pi / 2,
            endAngle: 3 * CGFloat.pi / 2,
            clockwise: true)

        shapeLayer.path = path.cgPath
    }
    
    @objc private func tapClearScoreCircle() {
        self.delegate?.didTapClearScoreCircle()
    }
}
