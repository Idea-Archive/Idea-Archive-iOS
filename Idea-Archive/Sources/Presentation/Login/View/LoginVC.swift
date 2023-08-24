import UIKit
import Then
import SnapKit

final class LoginVC: BaseVC {
    
    private let loginLabel = TitleLabel().then {
        $0.text = "LOGIN"
    }
    
    private let textFieldStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 12
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private let idTextField = NormalTextField(placeholder: "이메일을 입력해주세요").then {
        $0.font = .I_A(size: 14, family: .regular)
    }
    
    private let passwordTextField = SecureTextField(placeholder: "비밀번호를 입력해주세요").then {
        $0.font = .I_A(size: 14, family: .regular)
    }
    
    private let signupFindPasswordStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private lazy var gotoSignupButton = AdditionalButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    
    private let betweenView = UIView().then {
        $0.backgroundColor = UIColor(rgb: 0x999999)
    }
    
    private lazy var findPasswordButton = AdditionalButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.addTarget(self, action: #selector(findPasswordButtonTapped), for: .touchUpInside)
    }
    
    private lazy var loginButton = NextStepButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.isEnabled = false
        $0.backgroundColor = UIColor(named: "PrimaryColor")
        $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    private let socialLoginButtonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 28
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private lazy var googleLoginButton = UIButton().then {
        $0.setImage(UIImage(named: "Google"), for: .normal)
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
    }
    
    private lazy var kakaoLoginButton = UIButton().then {
        $0.setImage(UIImage(named: "Kakao"), for: .normal)
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
    }
    
    private lazy var githubLoginButton = UIButton().then {
        $0.setImage(UIImage(named: "Github"), for: .normal)
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
    }
    
    private lazy var appleLoginButton = UIButton().then {
        $0.setImage(UIImage(named: "Apple"), for: .normal)
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
    }
    
    override func setup() {
        self.navigationController?.navigationBar.tintColor = UIColor(rgb: 0x000000)
        self.navigationController?.navigationBar.topItem?.title = ""
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func addView() {
        view.addSubviews(
            loginLabel,
            textFieldStackView,
            signupFindPasswordStackView,
            loginButton,
            socialLoginButtonStackView
        )
        [
            idTextField,
            passwordTextField
        ].forEach{
            textFieldStackView.addArrangedSubview($0)
        }
        [
            gotoSignupButton,
            betweenView,
            findPasswordButton
        ].forEach{
            signupFindPasswordStackView.addArrangedSubview($0)
        }
        [
            appleLoginButton,
            googleLoginButton,
            kakaoLoginButton,
            githubLoginButton
        ].forEach{
            socialLoginButtonStackView.addArrangedSubview($0)
        }
    }
    
    override func setLayout(){
        self.loginLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(52)
            $0.centerX.equalTo(view.snp.centerX)
        }
        self.textFieldStackView.snp.makeConstraints {
            $0.height.equalTo(116)
            $0.top.equalTo(loginLabel.snp.bottom).offset(64)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
        self.idTextField.snp.makeConstraints{
            $0.height.equalTo(52)
        }
        self.passwordTextField.snp.makeConstraints{
            $0.height.equalTo(52)
        }
        self.signupFindPasswordStackView.snp.makeConstraints {
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().inset(28)
        }
        self.betweenView.snp.makeConstraints {
            $0.height.equalTo(12)
            $0.width.equalTo(1)
        }
        self.loginButton.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(48)
            $0.leading.equalTo(self.view).offset(24)
            $0.centerX.equalTo(view.snp.centerX)
        }
        self.socialLoginButtonStackView.snp.makeConstraints {
            $0.height.equalTo(36)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(96)
            $0.centerX.equalToSuperview()
        }
        self.appleLoginButton.snp.makeConstraints{
            $0.height.equalToSuperview()
            $0.width.equalTo(36)
        }
        self.googleLoginButton.snp.makeConstraints{
            $0.height.equalToSuperview()
            $0.width.equalTo(36)
        }
        self.kakaoLoginButton.snp.makeConstraints{
            $0.height.equalToSuperview()
            $0.width.equalTo(36)
        }
        self.githubLoginButton.snp.makeConstraints{
            $0.height.equalToSuperview()
            $0.width.equalTo(36)
        }
    }
    
    @objc func loginButtonTapped(_ sender: UIButton){
        print("로그인 버튼 클릭")
        LoginViewModel().loginCompleted(email: idTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @objc func findPasswordButtonTapped(_ sender: UIButton){
        let vc = FindPasswordVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func signupButtonTapped(_ sender: UIButton){
        let vc = SignupVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension LoginVC: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if idTextField.text!.count > 0 && passwordTextField.text!.count > 0{
            loginButton.backgroundColor = UIColor(rgb: 0x42CC89)
            loginButton.isEnabled = true
        }
        else{
            loginButton.backgroundColor = UIColor(rgb: 0x999999)
            loginButton.isEnabled = false
        }
    }
}

