//
//  ViewController.swift
//  APITest
//
//  Created by Sukidhar Darisi on 28/9/20.
//

import UIKit
import AVKit


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    let id = "dataCell"
    let apiManager = APIManager()
    var videoData = [DataModel]()
    @IBOutlet weak var DataTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTableView()
    }
    
    func setUpTableView(){
        DataTableView.delegate = self
        DataTableView.dataSource = self
        DataTableView.register(UITableViewCell.self, forCellReuseIdentifier: id)
    }

    @IBAction func fetchData(_ sender: UIBarButtonItem) {
        apiManager.peformRequest { (data) in
            self.videoData.append(contentsOf: data)
            DispatchQueue.main.async {
                self.DataTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoData.count == 0 ? 1 : videoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        cell.textLabel?.text = videoData.count != 0 ? "Play video for \(videoData[indexPath.row].id)" : "Tap Search Icon to Fetch Data"
        cell.textLabel?.textColor = videoData.count == 0 ? .gray : .black
        cell.accessoryType = videoData.count != 0 ? .disclosureIndicator : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if videoData.count != 0{
            let videoUrlString = self.videoData[indexPath.row].mp4Video
            
            if let url = URL(string: videoUrlString){
                let player = AVPlayer(url: url)
                let playerVC = AVPlayerViewController()
                playerVC.player = player
                self.present(playerVC, animated: true) {
                    playerVC.player?.play()
                }
            }else{
                let alert = UIAlertController(title: "Oops!", message: "Looks like url doesn't seem to be accurate", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


