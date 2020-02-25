//
//  ViewController.swift
//  MVVMYOUTUBE
//
//  Created by Arpit Lokwani on 10/03/19.
//  Copyright © 2019 Arpit Lokwani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var arrMovieVM = [MovieViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
    }

    func getData(){
        Service.shareInstance.getAllMovieData { (movies, error) in
            if(error==nil){
                self.arrMovieVM = movies?.map({ return MovieViewModel(movie: $0) }) ?? []
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }

    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMovieVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let MVM = arrMovieVM[indexPath.row]
        cell.textLabel?.text = MVM.artistName ?? ""
        cell.detailTextLabel?.text = MVM.trackName ?? ""
        return cell
    }
    
}
