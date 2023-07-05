import UIKit
import Then
import SnapKit
import AEOTPTextField
import RxSwift
import RxKeyboard
import RxCocoa

final class CertificationNumberViewController: BaseViewController {
    
    let disposeBag = DisposeBag()
    
    var btnVerifyBottomConstraint = 10
    
    var buttonBottomConstraint: NSLayoutConstraint?
    
    private let certificationNoticeLabel = LargeTitleLabel().then{
        $0.text = "인증번호를 입력해주세요"
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let sentCertificationLabel = SmallTitleLabel().then{
        $0.text = "입력하신 메일로 인증번호를 보냈어요!"
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let certificationNumberTextField = AEOTPTextField().then{
        $0.otpFont = .I_A(size: 32, family: .regular)
        $0.otpTextColor = UIColor(rgb: 0x767676)
        $0.otpCornerRaduis = 5
        $0.configure(with: 4)
    }
    
    private let confirmationButton = NextStepButton().then{
        $0.setTitle("확인", for: .normal)
        $0.backgroundColor = UIColor(rgb: 0xA9A9A9)
    }
    
    override func setup() {
        certificationNumberTextField.otpDelegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpOutputBinding()
    }
    
    override func addView() {
        view.addSubview(certificationNoticeLabel)
        view.addSubview(sentCertificationLabel)
        view.addSubview(certificationNumberTextField)
        view.addSubview(confirmationButton)
    }
    
    override func setLayout() {
        self.certificationNoticeLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.leading.equalTo(self.view).offset(40)
        }
        self.sentCertificationLabel.snp.makeConstraints{
            $0.top.equalTo(certificationNoticeLabel.snp.bottom).offset(4)
            $0.leading.equalTo(self.view).offset(40)
        }
        self.certificationNumberTextField.snp.makeConstraints{
            $0.top.equalTo(sentCertificationLabel.snp.bottom).offset(84)
            $0.leading.trailing.equalTo(self.view).inset(40)
            $0.height.equalTo(76)
        }
        self.confirmationButton.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(16)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        certificationNumberTextField.becomeFirstResponder()
    }
    
    func setUpOutputBinding() {
        
        RxKeyboard.instance.visibleHeight
            .skip(1)    // 초기 값 버리기
            .drive(onNext: { keyboardVisibleHeight in
                
                self.confirmationButton.snp.updateConstraints {
                    $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(keyboardVisibleHeight)
                        }
            })
            .disposed(by: disposeBag)
        
    }
    
    
//    func raiseKeyboardWithButton(keyboardChangedHeight: CGFloat, constraintBetweenBtnAndKeyboard: NSLayoutConstraint) {
//        DispatchQueue.main.async {
//            UIView.animate(withDuration: 0.23, animations: {
//
//                var safeAreaBottomLength = self.view.safeAreaInsets.bottom
//
//                if keyboardChangedHeight == 0 { // 버튼이 가라앉는 버그 대응
//                    safeAreaBottomLength = 0
//                }
//
//                constraintBetweenBtnAndKeyboard.constant = keyboardChangedHeight - safeAreaBottomLength
//                //                + Constants.ComponentStyle.intervalSizeBetweenButtonAndKeyboard
//
//                constraintBetweenBtnAndKeyboard.constant = 24
//
//                self.view.layoutIfNeeded()
//            })
//        }
//    }
}

extension CertificationNumberViewController: AEOTPTextFieldDelegate, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func didUserFinishEnter(the code: String) {
        print(code)
        
    }
    
    //    func textFieldDidChangeSelection(_ textField: AEOTPTextField) {
    //        if certificationNumberTextField.text!.count > 0{
    //            confirmationButton.backgroundColor = UIColor(rgb: 0x42CC89)
    //            confirmationButton.isEnabled = true
    //        }
    //        else{
    //            confirmationButton.backgroundColor = UIColor(rgb: 0xA9A9A9)
    //            confirmationButton.isEnabled = false
    //        }
    //    }
    
}

//extension Reactive where Base: CertificationNumberViewController {
//
//    var keyboardHeightChanged: Binder<CGFloat> {
//        return Binder(self.base) { vc, height in
//            vc.raiseKeyboardWithButton(keyboardChangedHeight: height, constraintBetweenBtnAndKeyboard: vc.btnVerifyBottomConstraint)
//        }
//    }
//}

