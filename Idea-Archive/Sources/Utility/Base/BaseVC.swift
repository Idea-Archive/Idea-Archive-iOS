import UIKit
import Moya

class BaseVC: UIViewController {
    // MARK: - Properties
    let bound = UIScreen.main.bounds
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupBackgroundIfNotSet()
        addView()
        setLayout()
        bind()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayoutSubviews()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    // MARK: - Method
    private func setupBackgroundIfNotSet() {
        if self.view.backgroundColor == nil {
            self.view.backgroundColor = .white
        }
    }
    
    func addView() {}
    func setup() {}
    func setLayout() {}
    func setLayoutSubviews() {}
    func bind() {}
}

