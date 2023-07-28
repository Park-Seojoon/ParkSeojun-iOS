import UIKit
import Then
import SnapKit
import Kingfisher

final class HistoryVC: BaseVC {

    var HistoryVCToken = ""

    private let historyTableView = UITableView().then {
        $0.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
    }

    private var tableView: UITableView {
        return historyTableView
    }

    override func setup() {
        super.setup()
        self.navigationItem.title = "글 작성 내역"
        historyTableView.dataSource = self
        historyTableView.delegate = self
        historyTableView.rowHeight = 100

        do {
            if let (_, token) = try KeychainManager.get() {
                HistoryVCToken = token
            } else {
                // Handle the case when Keychain retrieval fails.
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
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell

        MyListViewModel().getMyList(accessToken: HistoryVCToken) { myListResponse in
            if let myListData = myListResponse {
                cell.titleLabel.text = String(myListData.boardList[indexPath.row].title)
                cell.pointLabel.text = String(myListData.boardList[indexPath.row].point) + ("point")
                cell.userProfile.kf.setImage(with: URL(string: myListData.boardList[indexPath.row].url))

                if myListData.boardList[indexPath.row].myListIngType == "NO" {
                    cell.acceptButton.isHidden = true
                    cell.acceptButton.isEnabled = false
                } else if myListData.boardList[indexPath.row].myListIngType == "PROCEED" {
                    cell.acceptButton.isEnabled = true
                    cell.acceptButton.tag = myListData.boardList[indexPath.row].id
                    cell.acceptButton.addTarget(self, action: #selector(self.checkBoxButtonTapped(sender:)), for: .touchUpInside)
                } else {
                    cell.acceptButton.backgroundColor = UIColor(rgb: 0xA6A6A6)
                    cell.acceptButton.setTitle("완료", for: .normal)
                    cell.acceptButton.isEnabled = false
                }
            } else {}
        }
        return cell
    }

    @objc func checkBoxButtonTapped(sender: UIButton) {
        CompletedViewModel().completedList(id: sender.tag, accessToken: HistoryVCToken) { statusCode in
            if statusCode == 200 {
                DispatchQueue.main.async { // UI 업데이트는 메인 스레드에서 수행해야 합니다.
                    if let cell = self.tableView.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as? HistoryTableViewCell {
                        cell.acceptButton.backgroundColor = UIColor(rgb: 0xA6A6A6)
                        cell.acceptButton.setTitle("완료", for: .normal)
                        cell.acceptButton.isEnabled = false
                    }
                }
            }
        }
    }
}

extension HistoryVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection if needed.
    }
}

