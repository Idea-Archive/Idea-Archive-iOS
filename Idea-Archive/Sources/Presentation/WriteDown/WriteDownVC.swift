import UIKit

final class WriteDownVC: BaseViewController {
    
    private let titleStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 4
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "어떤 글을 쓰시나요?"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let subTitleLabel = UILabel().then {
        $0.text = "카테고리를 골라주세요!"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let categoryButtonStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 20
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private let ideaCategoryTitleStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 8
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private let ideaCategoryTitleLabel = UILabel().then {
        $0.text = "#아이디어_추천"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
    }
    
    private let ideaCategorySubTitleLabel = UILabel().then {
        $0.text = "본인이 개발할 수 없거나 \n개발이 중지된 아이디어를 \n자유롭게 말해봐요!"
        $0.numberOfLines = 3
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = UIColor(rgb: 0xFFFFFF).withAlphaComponent(75)
    }
    
    private let ideaCategoryButton = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0x999999)
        $0.layer.cornerRadius = 10
        $0.semanticContentAttribute = .forceRightToLeft
    }
    
    private let ideaImageView = UIImageView().then {
        $0.image = UIImage(named: "IdeaCategoryButtonImage")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = UIColor(rgb: 0x767676)
    }
    
    private let feedbackCategoryTitleStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 8
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private let feedbackCategoryTitleLabel = UILabel().then {
        $0.text = "#피드백_요청"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
    }
    
    private let feedbackCategorySubTitleLabel = UILabel().then {
        $0.text = "개발중인 프로젝트를 \n피드백해줄 사람이 필요할 때!"
        $0.numberOfLines = 3
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = UIColor(rgb: 0xFFFFFF).withAlphaComponent(75)
    }
    
    private let feedbackCategoryButton = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0x999999)
        $0.layer.cornerRadius = 10
    }
    
    private let feedbackImageView = UIImageView().then {
        $0.image = UIImage(systemName: "bubble.left.and.bubble.right.fill")
        $0.tintColor = UIColor(rgb: 0x767676)
    }
    
    private let jobOpeningCategoryTitleStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 8
        $0.distribution = .fill
        $0.alignment = .fill
    }
    
    private let jobOpeningCategoryTitleLabel = UILabel().then {
        $0.text = "#구인구직"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
    }
    
    private let jobOpeningCategorySubTitleLabel = UILabel().then {
        $0.text = "함께 서비스를 만들어 갈 \n성실한 인력을 구해봐요!"
        $0.numberOfLines = 3
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = UIColor(rgb: 0xFFFFFF).withAlphaComponent(75)
    }
    
    private let jobOpeningCategoryButton = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0x999999)
        $0.layer.cornerRadius = 10
    }
    
    private let jobOpeningImageView = UIImageView().then {
        $0.image = UIImage(systemName: "person.fill.badge.plus")
        $0.tintColor = UIColor(rgb: 0x767676)
    }
    
    override func addView() {
        view.addSubViews(titleStackView, categoryButtonStackView, ideaCategoryTitleStackView, ideaImageView, feedbackCategoryTitleStackView, feedbackImageView, jobOpeningCategoryTitleStackView, jobOpeningImageView)
        
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(subTitleLabel)
        
        categoryButtonStackView.addArrangedSubview(ideaCategoryButton)
        categoryButtonStackView.addArrangedSubview(feedbackCategoryButton)
        categoryButtonStackView.addArrangedSubview(jobOpeningCategoryButton)
        
        ideaCategoryTitleStackView.addArrangedSubview(ideaCategoryTitleLabel)
        ideaCategoryTitleStackView.addArrangedSubview(ideaCategorySubTitleLabel)
        
        feedbackCategoryTitleStackView.addArrangedSubview(feedbackCategoryTitleLabel)
        feedbackCategoryTitleStackView.addArrangedSubview(feedbackCategorySubTitleLabel)
        
        jobOpeningCategoryTitleStackView.addArrangedSubview(jobOpeningCategoryTitleLabel)
        jobOpeningCategoryTitleStackView.addArrangedSubview(jobOpeningCategorySubTitleLabel)
    }
    
    override func setup() {
        self.navigationItem.title = "새 글 쓰기"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "다음으로", style: .plain, target: self, action: #selector(nextTap))
    }
    
    @objc func nextTap() {
        let chooseMajor = ChooseMajorVC()
        navigationController?.pushViewController(chooseMajor, animated: true)
    }
    
    override func setLayout() {
        titleStackView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(24)
            $0.leading.equalToSuperview().inset(24)
        }

        categoryButtonStackView.snp.makeConstraints {
            $0.top.equalTo(titleStackView.snp.bottom).inset(-40)
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        ideaCategoryButton.snp.makeConstraints {
            $0.height.equalTo(160)
        }
        
        feedbackCategoryButton.snp.makeConstraints {
            $0.height.equalTo(160)
        }
        
        jobOpeningCategoryButton.snp.makeConstraints {
            $0.height.equalTo(160)
        }
        
        ideaCategoryTitleStackView.snp.makeConstraints {
            $0.leading.equalTo(ideaCategoryButton.snp.leading).inset(16)
            $0.top.equalTo(ideaCategoryButton.snp.top).inset(16)
        }
        
        ideaImageView.snp.makeConstraints {
            $0.top.equalTo(ideaCategoryButton.snp.top).inset(28)
            $0.trailing.equalTo(ideaCategoryButton.snp.trailing).inset(28)
            $0.width.equalTo(83)
            $0.height.equalTo(104)
        }
        
        feedbackCategoryTitleStackView.snp.makeConstraints {
            $0.leading.equalTo(feedbackCategoryButton.snp.leading).inset(16)
            $0.top.equalTo(feedbackCategoryButton.snp.top).inset(16)
        }
        
        feedbackImageView.snp.makeConstraints {
            $0.top.equalTo(feedbackCategoryButton.snp.top).inset(30)
            $0.trailing.equalTo(feedbackCategoryButton.snp.trailing).inset(19)
            $0.width.equalTo(121)
            $0.height.equalTo(96)
        }
        
        jobOpeningCategoryTitleStackView.snp.makeConstraints {
            $0.leading.equalTo(jobOpeningCategoryButton.snp.leading).inset(16)
            $0.top.equalTo(jobOpeningCategoryButton.snp.top).inset(16)
        }
        
        jobOpeningImageView.snp.makeConstraints {
            $0.trailing.equalTo(jobOpeningCategoryButton.snp.trailing).inset(26)
            $0.top.equalTo(jobOpeningCategoryButton.snp.top).inset(28)
            $0.width.equalTo(105)
            $0.height.equalTo(105)
        }
    }
}
