import UIKit
import Then
import SnapKit

final class AppliedStatusVC: BaseVC {
    
    private let historyTableView = UITableView().then {
        $0.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setup() {
        self.navigationItem.title = "신청현황"
        
        historyTableView.dataSource = self
        historyTableView.delegate = self
        historyTableView.rowHeight = 100
    }
    
    override func addView() {
        view.addSubview(historyTableView)
    }
    
    override func setLayout() {
        self.historyTableView.snp.makeConstraints{
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

extension AppliedStatusVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 151
    }
    
    
    
}

extension AppliedStatusVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}



