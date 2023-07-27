//
//  HomeVC.swift
//  ParkSeoJun
//
//  Created by 신아인 on 2023/07/26.
//

import UIKit
import SnapKit
import Then

class HomeVC: BaseVC {
    
    private let postTableView = UITableView().then {
        $0.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTableView.delegate = self
        postTableView.dataSource = self
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
    }
    
    override func addView() {
        [postTableView].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        postTableView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.backgroundColor = .white
        cell.titleLabel.text = "hihi"
        cell.pointLabel.text = "1000point"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postVC = PostVC()
        navigationController?.pushViewController(postVC, animated: true)
    }
}

