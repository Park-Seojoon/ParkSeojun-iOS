import UIKit
import SnapKit
import Then
import Moya

class HomeVC: BaseVC {
    
    var articles: [UserArticleListResponse] = []
    
    let userService = MoyaProvider<UserServices>()
    
    private let postTableView = UITableView().then {
        $0.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTableView.delegate = self
        postTableView.dataSource = self
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        
        loadArticles()
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
    
    func loadArticles() {
            userService.request(.list(param: UserArticleListRequest(Authorization: "YourAccessTokenHere"))) { [weak self] response in
                switch response {
                case .success(let result):
                    do {
                        let articleListModel = try result.map(UserArticleListModel.self)
                        self?.articles = articleListModel.boardList
                        self?.postTableView.reloadData()
                    } catch {
                        print("Error decoding response: \(error)")
                    }
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.backgroundColor = .white
        
        let article = articles[indexPath.row]
        cell.titleLabel.text = article.title
        cell.pointLabel.text = "\(article.point) point"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postVC = PostVC()
        navigationController?.pushViewController(postVC, animated: true)
    }
}

