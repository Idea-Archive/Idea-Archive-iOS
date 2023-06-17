import UIKit

final class MainViewController: BaseViewController {
    // MARK: - Properties
    
    private let filterStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .fill
        return stack
    }()
    
    private let entireFilterButton: UIButton = {
        let button = UIButton()
        button.setTitle("전체", for: .normal)
        button.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        return button
    }()
    
    private let ideaFilterButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디어", for: .normal)
        button.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        return button
    }()
    
    private let feedbackFilterButton: UIButton = {
        let button = UIButton()
        button.setTitle("피드백", for: .normal)
        button.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        return button
    }()
    
    private let jobOpeningFilterButton: UIButton = {
        let button = UIButton()
        button.setTitle("구인", for: .normal)
        button.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        return button
    }()

    private let settingStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 29
        stack.distribution = .equalSpacing
        stack.alignment = .fill
        return stack
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "magnifyingglass")
        button.tintColor = UIColor(rgb: 0x999999)
        return button
    }()
    
    private let myPageButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "line.3.horizontal")
        button.tintColor = UIColor(rgb: 0x999999)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - OverrideFunc
    
    override func setup() {
        self.view.backgroundColor = UIColor(rgb: 0xF2F2F2)
    }
    
    // MARK: - UI
    override func addView() {
        view.addSubview(filterStackView)
        filterStackView.addArrangedSubview(entireFilterButton)
        filterStackView.addArrangedSubview(ideaFilterButton)
        filterStackView.addArrangedSubview(feedbackFilterButton)
        filterStackView.addArrangedSubview(jobOpeningFilterButton)
        
        view.addSubview(settingStackView)
        settingStackView.addArrangedSubview(searchButton)
        settingStackView.addArrangedSubview(myPageButton)
    }
    
    override func setLayout() {
        
        NSLayoutConstraint.activate([
            filterStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            filterStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            settingStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            settingStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    
}
