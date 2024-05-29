//
//  ViewController.swift
//  MyMusic
//
//  Created by Charmaine_Guo on 10/6/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
        
    }
    func configureSongs(){
        songs.append(Song(name: "Can I Call You Tonight",
                          albumName: "Fuzzybrain",
                          artistName: "Dayglow",
                          imageName: "cover1",
                          trackName: "song1"))
        songs.append(Song(name: "Metamodernity",
                          albumName: "Metamodernity",
                          artistName: "Vansire",
                          imageName: "cover2",
                          trackName: "song2"))
        songs.append(Song(name: "Lovers Rock",
                          albumName: "French Exit",
                          artistName: "TV Girl",
                          imageName: "cover3",
                          trackName: "song3"))
        songs.append(Song(name: "Stargirl",
                          albumName: "Starboy",
                          artistName: "the Weeknd",
                          imageName: "cover4",
                          trackName: "song4"))
        songs.append(Song(name: "Lime Ocean Paradise",
                          albumName: "Lime Ocean Paradise",
                          artistName: "Slenderbodies",
                          imageName: "cover5",
                          trackName: "song5"))
        songs.append(Song(name: "Can I Call You Tonight",
                          albumName: "Fuzzybrain",
                          artistName: "Dayglow",
                          imageName: "cover1",
                          trackName: "song1"))
        songs.append(Song(name: "Metamodernity",
                          albumName: "Metamodernity",
                          artistName: "Vansire",
                          imageName: "cover2",
                          trackName: "song2"))
        songs.append(Song(name: "Lovers Rock",
                          albumName: "French Exit",
                          artistName: "TV Girl",
                          imageName: "cover3",
                          trackName: "song3"))
        songs.append(Song(name: "Stargirl",
                          albumName: "Starboy",
                          artistName: "the Weeknd",
                          imageName: "cover4",
                          trackName: "song4"))
    
    }
    
    // table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        //configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        
        cell.accessoryType = .disclosureIndicator
        
        cell.imageView?.image = UIImage(named: song.imageName)
        
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //present the player
        let position = indexPath.row
        // songs
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else {
            return
        }
        
        vc.songs = songs
        vc.position = position
        
        present(vc, animated: true)
        //10:35
    }


}
struct Song{
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}

