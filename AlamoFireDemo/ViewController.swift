//
//  ViewController.swift
//  AlamoFireDemo
//
//  Created by comviva on 09/02/22.
//

import UIKit
import Alamofire
import CoreLocation

class ViewController: UIViewController {
  
    @IBOutlet weak var tbl: UITableView!
    var movieList:[TMDBMovie]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AFUtility.instance.getPopularMovies{data in
            self.movieList = data.results
            self.tbl.reloadData()
        }
        tbl.dataSource=self
    }


}
extension ViewController:UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieCell
        let movie = movieList[indexPath.row]
        cell.titleL.text=movie.title
        cell.ratingL.text = String(movie.vote_average)
        cell.rDateL.text = movie.release_date
        cell.overviewL.text = movie.overview
        let url = "https://image.tmdb.org/t/p/w500\(movie.poster_path)"
        AFUtility.instance.downloadImage(imgUrl: url) { (imgData) in
            cell.imgV.image=UIImage(data: imgData)
        }
        cell.imgV.image=UIImage(systemName: "person")
        return cell
    }
    
    
}
