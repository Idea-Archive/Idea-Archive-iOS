import UIKit
import Then
import SnapKit

final class FailAuthViewController: BaseViewController {
    
    private let failAuthorizeImage = UIImageView().then{
        $0.image = UIImage(named: "Fail.png")
    }
    
    private let failAuthorizeLabel = UILabel().then{
        $0.text = "인증실패"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.textAlignment = .center
        $0.font = .I_A(size: 24, family: .semiBold)
    }
    
    private let additionalFailAuthorizeLabel = SmallTitleLabel().then{
        $0.text = "다시 시도해주세요."
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let goBackToLoginButton = NextStepButton().then{
        $0.setTitle("로그인으로 돌아가기", for: .normal)
        $0.backgroundColor = UIColor(rgb: 0x42CC89)
        $0.addTarget(FailAuthViewController.self, action: #selector(goBackToLoginButtonTapped), for: .touchUpInside)
    }
    
    @objc func goBackToLoginButtonTapped(_ sender: UIButton){
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func addView() {
        view.addSubview(failAuthorizeImage)
        view.addSubview(failAuthorizeLabel)
        view.addSubview(additionalFailAuthorizeLabel)
        view.addSubview(goBackToLoginButton)
    }
    
    override func setLayout(){
        failAuthorizeImage.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(102)
            $0.centerX.equalTo(view.snp.centerX)
        }
        failAuthorizeLabel.snp.makeConstraints{
            $0.top.equalTo(failAuthorizeImage.snp.bottom).offset(32)
            $0.centerX.equalTo(view.snp.centerX)
        }
        additionalFailAuthorizeLabel.snp.makeConstraints{
            $0.top.equalTo(failAuthorizeLabel.snp.bottom).offset(12)
            $0.centerX.equalTo(view.snp.centerX)
        }
        goBackToLoginButton.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(18)
            $0.leading.trailing.equalTo(self.view).inset(28)
        }
    }
}


