//
//  ProductViewController.swift
//  TestTask
//
//  Created by Serhey Bilous on 09.06.2018.
//  Copyright © 2018 Serhey Bilous. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: ProductViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func setup(){
        setupTableView()
        setupViewModel()
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: ProductTableViewCell.cellNib, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ProductTableViewCell.cellIdentifier)
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func setupViewModel() {
        viewModel = ProductViewModel()
        viewModel.didChangeProducts = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.getData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ProductViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.cellIdentifier, for: indexPath) as! ProductTableViewCell
        cell.viewModel = viewModel.productCellViewModel(from: indexPath)
        return cell
    }
}
extension ProductViewController : UITableViewDelegate{
    
}
