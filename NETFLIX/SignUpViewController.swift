//
//  SignUpViewController.swift
//  NETFLIX
//
//  Created by NERO on 6/4/24.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    let appLogoImageView = UIImageView()
    let signupFailureTextLabel = UILabel()
    
    lazy var textFields = [emailOrPhoneNumberTextField, passwordTextField, nicknameTextField, locationTextField, recommendationCodeTextField]
    let emailOrPhoneNumberTextField = UITextField()
    let passwordTextField = UITextField()
    let nicknameTextField = UITextField()
    let locationTextField = UITextField()
    let recommendationCodeTextField = UITextField()
    let textFieldStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 22
        return stackView
    }()
    
    let signUpButton = UIButton()
    let additionalInformationLabel = UILabel()
    let additionalInformationSwitch = UISwitch()
    let additionalStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        settingNavigation()
    }
}

//MARK: - Configure
extension SignUpViewController {
    func configureHierarchy() {
        [appLogoImageView, signupFailureTextLabel, textFieldStackView, signUpButton, additionalStackView]
            .forEach { view.addSubview($0) }
        
        textFields.forEach { textFieldStackView.addArrangedSubview($0) }
        
        [additionalInformationLabel, additionalInformationSwitch]
            .forEach { additionalStackView.addArrangedSubview($0) }
    }
    
    func configureLayout() {
        
    }
    
    func configureUI() {
        view.backgroundColor = .black
        
        [signupFailureTextLabel, additionalInformationLabel].forEach {
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 16)
        }
        signupFailureTextLabel.textAlignment = .center
        signupFailureTextLabel.numberOfLines = 0
        
        textFields.forEach {
            $0.textAlignment = .center
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 15)
            $0.backgroundColor = .customGray
            $0.layer.cornerRadius = 4
        }
    
        signUpButton.titleLabel?.textAlignment = .center
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        signUpButton.backgroundColor = .white
        signUpButton.layer.cornerRadius = 5
        
        additionalInformationSwitch.onTintColor = .pointRed
    }
}

//MARK: - Switching View
extension SignUpViewController {
    func settingNavigation() {
        navigationController?.navigationBar.isHidden = true
    }
}

