import UIKit
import Then
import SnapKit

final class SuccessAuthViewController: BaseViewController {
    
    private let successImage = UIImageView().then{
        $0.image = UIImage(named: "Success.png")
    }
    
    private let successAuthorizeLabel = UILabel().then{
        $0.text = "인증성공!"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.textAlignment = .center
        $0.font = .I_A(size: 24, family: .semiBold)
    }
    
    private let additionalSuccessAuthorizeLabel = SmallTitleLabel().then{
        $0.text = "이메일 인증에 성공하였습니다."
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let confirmationButton = NextStepButton().then{
        $0.setTitle("로그인으로 돌아가기", for: .normal)
        $0.backgroundColor = UIColor(rgb: 0x42CC89)
        $0.addTarget(self, action: #selector(gotoLoginButtonTapped), for: .touchUpInside)
    }
    
    override func addView() {
        view.addSubview(successImage)
        view.addSubview(successAuthorizeLabel)
        view.addSubview(additionalSuccessAuthorizeLabel)
        view.addSubview(confirmationButton)
    }
    
    override func setLayout(){
        self.successImage.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(102)
            $0.centerX.equalTo(view.snp.centerX)
        }
        self.successAuthorizeLabel.snp.makeConstraints{
            $0.top.equalTo(successImage.snp.bottom).offset(32)
            $0.centerX.equalTo(view.snp.centerX)
        }
        self.additionalSuccessAuthorizeLabel.snp.makeConstraints{
            $0.top.equalTo(successAuthorizeLabel.snp.bottom).offset(12)
            $0.centerX.equalTo(view.snp.centerX)
        }
        self.confirmationButton.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(18)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
    }
    
    @objc func gotoLoginButtonTapped(_ sender: UIButton){
        navigationController?.popToRootViewController(animated: true)
    }
}
