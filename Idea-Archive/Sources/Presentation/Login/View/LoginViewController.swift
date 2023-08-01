import UIKit
import Then
import SnapKit

final class LoginViewController: BaseViewController {
    
    private let loginLabel = TitleLabel().then{
        $0.text = "LOGIN"
    }
    
    private let idTextField = NormalTextField(placeholder: "아이디를 입력해주세요").then{
        $0.font = .I_A(size: 14, family: .regular)
    }
    
    private let passwordTextField = SecureTextField(placeholder: "비밀번호를 입력해주세요").then{
        $0.font = .I_A(size: 14, family: .regular)
    }
    
    private lazy var loginButton = NextStepButton().then{
        $0.setTitle("로그인", for: .normal)
        $0.isEnabled = false
        $0.backgroundColor = UIColor(rgb: 0x999999)
    }
    
    private let forgotPaswordLabel = SmallTitleLabel().then{
        $0.text = "비밀번호를 잊으셨나요?"
        $0.textColor = UIColor(rgb: 0x191919)
    }
    
    private lazy var findPasswordButton = AdditionalButton().then{
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x35B2CD), for: .normal)
        $0.addTarget(self, action: #selector(findPasswordButtonTapped), for: .touchUpInside)
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
    
    private let firstTimeIdeaArchiveLabel = SmallTitleLabel().then{
        $0.text = "IA가 처음이신가요?"
        $0.textColor = UIColor(rgb: 0x767676)
    }
    
    private lazy var gotoSignupButton = AdditionalButton().then{
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x191919), for: .normal)
//        $0.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }
    
    override func setup() {
        self.navigationController?.navigationBar.tintColor = UIColor(rgb: 0x000000)
        self.navigationController?.navigationBar.topItem?.title = ""
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginViewModel().loginCompleted(email: idTextField.text ?? "", password: passwordTextField.text ?? "")
        
    }
    
    override func addView() {
        view.addSubview(loginLabel)
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(forgotPaswordLabel)
        view.addSubview(findPasswordButton)
        view.addSubview(firstTimeIdeaArchiveLabel)
        view.addSubview(gotoSignupButton)
        view.addSubview(appleLoginButton)
        view.addSubview(googleLoginButton)
        view.addSubview(kakaoLoginButton)
        view.addSubview(githubLoginButton)
    }
    
    override func setLayout(){
        self.loginLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(52)
            $0.centerX.equalTo(view.snp.centerX)
        }
        self.idTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(loginLabel.snp.bottom).offset(64)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
        self.passwordTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(idTextField.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
        self.loginButton.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(48)
            $0.leading.equalTo(self.view).offset(24)
            $0.centerX.equalTo(view.snp.centerX)
        }
        self.forgotPaswordLabel.snp.makeConstraints{
            $0.top.equalTo(loginButton.snp.bottom).offset(12)
            $0.leading.equalTo(self.view).offset(94)
        }
        self.findPasswordButton.snp.makeConstraints{
            $0.height.equalTo(20)
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.leading.equalTo(forgotPaswordLabel.snp.trailing).offset(4)
        }
        self.appleLoginButton.snp.makeConstraints{
            $0.height.width.equalTo(36)
            $0.bottom.equalTo(firstTimeIdeaArchiveLabel.snp.bottom).inset(32)
            $0.trailing.equalTo(googleLoginButton.snp.leading).offset(-28)
        }
        self.googleLoginButton.snp.makeConstraints{
            $0.height.width.equalTo(36)
            $0.bottom.equalTo(firstTimeIdeaArchiveLabel.snp.bottom).inset(32)
            $0.centerX.equalToSuperview().offset(-32)
        }
        self.kakaoLoginButton.snp.makeConstraints{
            $0.height.width.equalTo(36)
            $0.bottom.equalTo(firstTimeIdeaArchiveLabel.snp.bottom).inset(32)
            $0.leading.equalTo(view.snp.centerX).offset(14)
        }
        self.githubLoginButton.snp.makeConstraints{
            $0.height.width.equalTo(36)
            $0.bottom.equalTo(firstTimeIdeaArchiveLabel.snp.bottom).inset(32)
            $0.leading.equalTo(kakaoLoginButton.snp.trailing).offset(28)
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
    
    @objc func findPasswordButtonTapped(_ sender: UIButton){
        let vc = FindPasswordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func signupButtonTapped(_ sender: UIButton){
        let vc = SignupViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    @objc func signupButtonTapped(_ sender: UIButton){
//        let vc = SignupViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
}

extension LoginViewController: UITextFieldDelegate{
    
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
