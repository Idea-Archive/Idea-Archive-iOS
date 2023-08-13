import UIKit
import Then
import SnapKit

final class MakeNewPasswordVC: BaseVC {
    
    private let changePasswordLabel = LargeTitleLabel().then{
        $0.text = "새 비밀번호를 입력해주세요!"
        $0.numberOfLines = 2
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let passwordInformLabel = SmallTitleLabel().then{
        $0.text = "특수문자 포함 8~16자로 작성해주세요"
        $0.textColor = UIColor(rgb: 0x999999)
    }

    private let passwordTextField = SecureTextField(placeholder: "새 비밀번호를 입력해주세요").then{
        $0.font = .I_A(size: 14, family: .regular)
    }
    
    private let passwordAgainTextField = SecureTextField(placeholder: "한번 더 입력해주세요").then{
        $0.font = .I_A(size: 14, family: .regular)
    }
    
    private let confirmationButton = NextStepButton().then{
        $0.setTitle("확인", for: .normal)
        $0.backgroundColor = UIColor(rgb: 0x999999)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor(rgb: 0x000000)
        self.navigationController?.navigationBar.topItem?.title = ""
        
        passwordTextField.delegate = self
        passwordAgainTextField.delegate = self
      
    }
    
    override func addView() {
        view.addSubview(changePasswordLabel)
        view.addSubview(passwordInformLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordAgainTextField)
        view.addSubview(confirmationButton)
    }
    
    @objc func confirmationButtonTapped(_ sender: UIButton){
        let vc = SignupVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func setLayout(){
        self.changePasswordLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(32)
            $0.leading.equalTo(self.view).offset(28)
        }
        self.passwordInformLabel.snp.makeConstraints{
            $0.top.equalTo(changePasswordLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.view).offset(28)
        }
        self.passwordTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(passwordInformLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
        self.passwordAgainTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
        self.confirmationButton.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(passwordAgainTextField.snp.bottom).offset(48)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
        
    }
}

extension MakeNewPasswordVC: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if passwordTextField.text!.count >= 8 && passwordTextField.text!.count <= 16 &&
            passwordTextField.text! == passwordAgainTextField.text!{
            confirmationButton.backgroundColor = UIColor(rgb: 0x42CC89)
            confirmationButton.isEnabled = true
        }
        else{
            confirmationButton.backgroundColor = UIColor(rgb: 0xA9A9A9)
            confirmationButton.isEnabled = false
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }
        guard textField.text!.count < 21 else { return false }
        return true
    }
}
