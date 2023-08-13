import UIKit
import Then
import SnapKit

final class LoginVC: BaseVC {
    
    private let loginLabel = TitleLabel().then {
        $0.text = "LOGIN"
    }
    
    private let idTextField = NormalTextField(placeholder: "아이디를 입력해주세요").then{
        $0.font = .I_A(size: 14, family: .regular)
    }
    
    private let passwordTextField = SecureTextField(placeholder: "비밀번호를 입력해주세요").then{
        $0.font = .I_A(size: 14, family: .regular)
    }
    
    private lazy var loginButton = NextStepButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.isEnabled = false
        $0.backgroundColor = UIColor(rgb: 0x999999)
        $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    private let forgotPaswordLabel = SmallTitleLabel().then {
        $0.text = "비밀번호를 잊으셨나요?"
        $0.textColor = UIColor(rgb: 0x191919)
    }
    
    private lazy var findPasswordButton = AdditionalButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x35B2CD), for: .normal)
        $0.addTarget(self, action: #selector(findPasswordButtonTapped), for: .touchUpInside)
    }
    
    private let buttonStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 28
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private lazy var googleLoginButton = UIButton().then{
        $0.setImage(UIImage(named: "Google"), for: .normal)
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
    }
    
    private lazy var kakaoLoginButton = UIButton().then{
        $0.setImage(UIImage(named: "Kakao"), for: .normal)
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
    }
    
    private lazy var githubLoginButton = UIButton().then{
        $0.setImage(UIImage(named: "Github"), for: .normal)
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
    }
    
    private lazy var appleLoginButton = UIButton().then{
        $0.setImage(UIImage(named: "Apple"), for: .normal)
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
    }
    
    private let firstTimeIdeaArchiveLabel = SmallTitleLabel().then {
        $0.text = "IA가 처음이신가요?"
        $0.textColor = UIColor(rgb: 0x767676)
    }
    
    private lazy var gotoSignupButton = AdditionalButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x191919), for: .normal)
        $0.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
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
            idTextField,
            passwordTextField,
            loginButton,
            forgotPaswordLabel,
            findPasswordButton,
            firstTimeIdeaArchiveLabel,
            gotoSignupButton,
            buttonStackView
        )
        [
            appleLoginButton,
            googleLoginButton,
            kakaoLoginButton,
            githubLoginButton
        ].forEach{
            buttonStackView.addArrangedSubview($0)
        }
        
    }
    
    override func setLayout(){
        self.loginLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(52)
            $0.centerX.equalTo(view.snp.centerX)
        }
        self.idTextField.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(loginLabel.snp.bottom).offset(64)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
        self.passwordTextField.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(idTextField.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
        self.forgotPaswordLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(12)
            $0.leading.equalTo(self.view).offset(94)
        }
        self.findPasswordButton.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.leading.equalTo(forgotPaswordLabel.snp.trailing).offset(4)
        }
        self.loginButton.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(48)
            $0.leading.equalTo(self.view).offset(24)
            $0.centerX.equalTo(view.snp.centerX)
        }
        self.buttonStackView.snp.makeConstraints {
            $0.top.equalTo(self.loginButton.snp.bottom).offset(253)
            $0.leading.trailing.equalToSuperview().inset(80)
        }
        self.appleLoginButton.snp.makeConstraints{
            $0.height.width.equalTo(36)
        }
        self.googleLoginButton.snp.makeConstraints{
            $0.height.width.equalTo(36)
        }
        self.kakaoLoginButton.snp.makeConstraints{
            $0.height.width.equalTo(36)
        }
        self.githubLoginButton.snp.makeConstraints{
            $0.height.width.equalTo(36)
        }
        self.firstTimeIdeaArchiveLabel.snp.makeConstraints{
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(12)
            $0.leading.equalTo(self.view).offset(106)
        }
        self.gotoSignupButton.snp.makeConstraints{
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(5)
            $0.leading.equalTo(firstTimeIdeaArchiveLabel.snp.trailing).offset(4)
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
