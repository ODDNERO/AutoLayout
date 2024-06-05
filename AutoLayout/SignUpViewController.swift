//
//  SignUpViewController.swift
//  AutoLayout
//
//  Created by NERO on 6/4/24.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    let appLogoImageView = UIImageView()
    let signupFailureTextLabel = UILabel()
    
    let emailOrPhoneNumberTextField = UITextField()
    let passwordTextField = UITextField()
    let nicknameTextField = UITextField()
    let locationTextField = UITextField()
    let recommendationCodeTextField = UITextField()
    let textFieldStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
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
        [appLogoImageView, signupFailureTextLabel, emailOrPhoneNumberTextField, passwordTextField, nicknameTextField, locationTextField, recommendationCodeTextField, signUpButton, additionalInformationLabel, additionalInformationSwitch]
            .forEach { view.addSubview($0) }
    }
    
    func configureLayout() {
        
    }
    
    func configureUI() {
        view.backgroundColor = .black
        appLogoImageView.image = .NETFLIX
        
        [emailOrPhoneNumberTextField, passwordTextField, nicknameTextField, locationTextField, recommendationCodeTextField].forEach {
            $0.backgroundColor = .customGray
            $0.attributedPlaceholder = NSAttributedString(string: $0.text ?? "", attributes: [.foregroundColor: UIColor.white])
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 14)
            $0.textAlignment = .center
        }
        
        signupFailureTextLabel.textColor = .white
        signupFailureTextLabel.textAlignment = .center
        signupFailureTextLabel.numberOfLines = 0
        
        passwordTextField.isSecureTextEntry = true
        recommendationCodeTextField.keyboardType = .numberPad
        
        signUpButton.titleLabel?.text = "회원가입"
        signUpButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        signUpButton.titleLabel?.textColor = .black
        signUpButton.backgroundColor = .white
        signUpButton.layer.cornerRadius = 5
        
        additionalInformationLabel.textAlignment = .left
        additionalInformationSwitch.onTintColor = .pointRed
    }
}

//MARK: - Switching View
extension SignUpViewController {
    func settingNavigation() {
        navigationItem.hidesBackButton = true
//        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
}
