//
//  ViewController.swift
//  UIKit - 07 - dz
//
//  Created by Олег Дмитриев on 06.08.2024.
//

import UIKit

struct ProductData {
    var productImage: String
    var productTitle: String
    var productDescr: String
    var productUserAvatar: String
    var productUserName: String
    
    static func mockData() -> [ProductData]{
        [
            ProductData(productImage: "product-image-01",
                        productTitle: "Заголовок",
                        productDescr: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore",
                        productUserAvatar: "user-avatar-01",
                        productUserName: "Имя Фамилия"),
            ProductData(productImage: "product-image-02",
                        productTitle: "Заголовок",
                        productDescr: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore",
                        productUserAvatar: "user-avatar-02",
                        productUserName: "Имя Фамилия"),
        ]
    }
}

class ViewController: UIViewController {
    
    private let tableProductData: [ProductData] = ProductData.mockData()
    
    private lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        
        $0.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseId)
        return $0
    }(UITableView(frame: view.frame, style: .plain))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        view.addSubview(tableView)
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableProductData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableProductData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell

        cell.setupView(item: item)
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
