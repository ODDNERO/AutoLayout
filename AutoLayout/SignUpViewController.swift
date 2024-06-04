//
//  SignUpViewController.swift
//  AutoLayout
//
//  Created by NERO on 6/4/24.
//

import UIKit

class SignUpViewController: UIViewController {
    let appLogoImageView = UIImageView()
    let signupFailureTextLabel = UILabel()
    
    let emailOrPhoneNumberTextField = UITextField()
    let passwordTextField = UITextField()
    let nicknameTextField = UITextField()
    let locationTextField = UITextField()
    let recommendationCodeTextField = UITextField()
    
    let signUpButton = UIButton()
    let additionalInformationLabel = UILabel()
    let additionalInformationSwitch = UISwitch()
    
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
        
    }
}

//MARK: - Switching View
extension SignUpViewController {
    func settingNavigation() {
        navigationItem.hidesBackButton = true
//        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
}
