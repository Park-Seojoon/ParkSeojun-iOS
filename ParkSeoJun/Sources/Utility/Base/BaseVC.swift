import UIKit

class BaseVC: UIViewController {
    // MARK: - Properties
    let bounds = UIScreen().bounds
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundIfNotSet()
        addView()
        setup()
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

extension BaseVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

