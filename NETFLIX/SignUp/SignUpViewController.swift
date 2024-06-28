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
        configureData()
        configureLayout()
        configureUI()
        
        settingNavigation()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        settingNavigation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
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
    
    func configureData() {
        appLogoImageView.image = .NETFLIX
        signupFailureTextLabel.text = "⚠️ 이메일과 비밀번호는 필수로 입력되어야 합니다." //임시 텍스트 설정
        
        let placehorderText = ["이메일 주소 또는 전화번호", "비밀번호", "닉네임", "국가", "추천 코드 입력"]
        var index = 0
        textFields.forEach {
            $0.attributedPlaceholder = NSAttributedString(string: placehorderText[index], attributes: [.foregroundColor: UIColor.white])
            index += 1
        }
        
        passwordTextField.isSecureTextEntry = true
        recommendationCodeTextField.keyboardType = .numberPad
        
        signUpButton.setTitle("회원가입", for: .normal)
        additionalInformationLabel.text = "추가 정보 입력"
        additionalInformationSwitch.isOn = true
    }
}

//MARK: - Configure UI
extension SignUpViewController {
    func configureLayout() {
        [appLogoImageView, textFieldStackView, signUpButton, additionalStackView].forEach {
            $0.snp.makeConstraints { $0.centerX.equalTo(view) }
        }
        
        appLogoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(180)
            make.height.equalTo(60)
        }
        
        signupFailureTextLabel.snp.makeConstraints { make in
            make.top.equalTo(appLogoImageView.snp.bottom).offset(50)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(55)
        }
        
        textFieldStackView.snp.makeConstraints { make in
            make.top.equalTo(signupFailureTextLabel.snp.bottom).offset(30)
            make.width.equalTo(280)
        }
        emailOrPhoneNumberTextField.snp.makeConstraints { $0.height.equalTo(35) }
        
        [signUpButton, additionalStackView].forEach {
            $0.snp.makeConstraints { $0.width.equalTo(textFieldStackView) }
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldStackView.snp.bottom).offset(textFieldStackView.spacing)
            make.height.equalTo(emailOrPhoneNumberTextField).offset(10)
        }
        
        additionalStackView.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(textFieldStackView.spacing)
            make.height.equalTo(emailOrPhoneNumberTextField)
        }
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
        
        appLogoImageView.isUserInteractionEnabled = true
        appLogoImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(logoImageClicked)))
    }
    
    @objc func logoImageClicked() {
        navigationController?.popViewController(animated: true)
    }
}

