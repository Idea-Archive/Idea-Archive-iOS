import UIKit
import Then
import SnapKit

final class FindPasswordViewController: BaseViewController {
    
    private let changePasswordLabel = LargeTitleLabel().then{
        $0.text = "비밀번호를 분실하셨다면, \n변경할 수 있어요!"
        $0.numberOfLines = 2
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let idTextField = NormalTextField(placeholder: "아이디를 입력해주세요").then{
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
        
        idTextField.delegate = self
    }
    
    override func addView() {
        view.addSubview(changePasswordLabel)
        view.addSubview(idTextField)
        view.addSubview(confirmationButton)
    }
    
    @objc func signupButtonTapped(_ sender: UIButton){
        let vc = SignupViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func setLayout(){
        self.changePasswordLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(32)
            $0.leading.equalTo(self.view).offset(28)
        }
        self.idTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(changePasswordLabel.snp.bottom).offset(64)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
        self.confirmationButton.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(idTextField.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
    }
}

extension FindPasswordViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if idTextField.text!.count > 0{
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
