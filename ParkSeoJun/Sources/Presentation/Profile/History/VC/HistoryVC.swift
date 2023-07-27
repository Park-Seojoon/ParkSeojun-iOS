import UIKit
import Then
import SnapKit

final class HistoryVC: BaseVC{
    
    var HistoryVCToken = ""
    
    private let historyTableView = UITableView().then {
        $0.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        historyTableView.reloadData()
    }
    
    override func setup() {
        self.navigationItem.title = "글 작성 내역"
        
        historyTableView.dataSource = self
        historyTableView.delegate = self
        historyTableView.rowHeight = 100
        
        do {
            if let (userId, token) = try KeychainManager.get() {
                HistoryVCToken = token
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

extension HistoryVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
        
        
        MyListViewModel().getMyList(accessToken: HistoryVCToken) { myListResponse in
            if let myListData = myListResponse {
                cell.titleLabel.text = String(myListData.boardList[indexPath.row].id)
                cell.pointLabel.text = String(myListData.boardList[indexPath.row].point)
            } else {}
        }
        
        return cell
        
    }
}


extension HistoryVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


