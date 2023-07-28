import UIKit
import Then
import SnapKit

final class AppliedStatusVC: BaseVC {
    
    var AppliedVCToken = ""
    
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
        
        do {
            if let (userId, token) = try KeychainManager.get() {
                AppliedVCToken = token
            } else {
                
            }
        } catch let error {
            print("Error while retrieving data from Keychain: \(error)")
        }
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
        
        AppliedListViewModel().getMyAppliedList(accessToken: AppliedVCToken) { myListResponse in
            if let myListData = myListResponse {
                cell.titleLabel.text = String(myListData.boardList[indexPath.row].title)
                cell.pointLabel.text = String(myListData.boardList[indexPath.row].point)
                cell.userProfile.kf.setImage(with: URL(string: myListData.boardList[indexPath.row].url))
                
                if myListData.boardList[indexPath.row].ingType == "NO" {
                    cell.acceptButton.isHidden = true
                    cell.acceptButton.isEnabled = false
                } else if myListData.boardList[indexPath.row].ingType == "PROCEED" {
                    cell.acceptButton.isEnabled = true
                    cell.acceptButton.tag = myListData.boardList[indexPath.row].id
                } else {
                    cell.acceptButton.backgroundColor = UIColor(rgb: 0xA6A6A6)
                    cell.acceptButton.setTitle("완료", for: .normal)
                    cell.acceptButton.isEnabled = false
                }
                
            } else {}
        }
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
}

extension AppliedStatusVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
