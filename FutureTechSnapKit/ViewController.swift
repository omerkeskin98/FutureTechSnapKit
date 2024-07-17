//
//  ViewController.swift
//  FutureTechSnapKit
//
//  Created by Omer Keskin on 8.07.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    
    var timer: Timer?

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "FutureTech"
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.textColor = UIColor.orange
        return label
    }()

    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let devicesLabel : UILabel = {
        let label = UILabel()
        label.text = "Connected Devices"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
        
    }()

    let device1View: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.5
        return view
    }()

    let device2View: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.5
        return view
    }()

    let device1ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "iphone.png")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let device2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "macbook.png")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let device1NameLabel: UILabel = {
        let label = UILabel()
        label.text = "Omer's iPhone"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    let device2NameLabel: UILabel = {
        let label = UILabel()
        label.text = "Omer's Macbook"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    let device1StatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("On", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        button.addTarget(self, action: #selector(device1StatusButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    let device2StatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Off", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        button.addTarget(self, action: #selector(device2StatusButtonTapped(_:)), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }

    
    
    @objc private func device1StatusButtonTapped(_ sender: UIButton) {
        if device1StatusButton.currentTitle == "On" {
            device1StatusButton.setTitle("Off", for: .normal)
            device1StatusButton.setTitleColor(.red, for: .normal)
        } else {
            device1StatusButton.setTitle("On", for: .normal)
            device1StatusButton.setTitleColor(.green, for: .normal)
        }
    }

    @objc private func device2StatusButtonTapped(_ sender: UIButton) {
        if device2StatusButton.currentTitle == "On" {
            device2StatusButton.setTitle("Off", for: .normal)
            device2StatusButton.setTitleColor(.red, for: .normal)
        } else {
            device2StatusButton.setTitle("On", for: .normal)
            device2StatusButton.setTitleColor(.green, for: .normal)
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateDate), userInfo: nil, repeats: true)
        timer?.tolerance = 0.1
        RunLoop.current.add(timer!, forMode: .common)
        updateDate()
    }

    @objc private func updateDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy - HH:mm"
        let dateString = formatter.string(from: Date())
        dateLabel.text = dateString
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }

        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(devicesLabel)
        devicesLabel.snp.makeConstraints{ make in
            make.top.equalTo(dateLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(20)
        }

        view.addSubview(device1View)
        device1View.snp.makeConstraints { make in
            make.top.equalTo(devicesLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(120)
        }

        device1View.addSubview(device1ImageView)
        device1ImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(80)
        }

        device1View.addSubview(device1NameLabel)
        device1NameLabel.snp.makeConstraints { make in
            make.leading.equalTo(device1ImageView.snp.trailing).offset(16)
            make.top.equalTo(device1ImageView)
            make.centerY.equalTo(device1View)
        }

        device1View.addSubview(device1StatusButton)
        device1StatusButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalTo(device1NameLabel)
        }

        view.addSubview(device2View)
        device2View.snp.makeConstraints { make in
            make.top.equalTo(device1View.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(120)
        }

        device2View.addSubview(device2ImageView)
        device2ImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(80)
        }

        device2View.addSubview(device2NameLabel)
        device2NameLabel.snp.makeConstraints { make in
            make.leading.equalTo(device2ImageView.snp.trailing).offset(16)
            make.top.equalTo(device2ImageView)
            make.centerY.equalTo(device2View)
        }

        device2View.addSubview(device2StatusButton)
        device2StatusButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalTo(device2NameLabel)
        }
    }
}

