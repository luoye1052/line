//
// AudioSpectrum02
// A demo project for blog: https://juejin.im/post/5c1bbec66fb9a049cb18b64c
// Created by: potato04 on 2019/1/13
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    @IBOutlet weak var spectrumView: SpectrumView!
    @IBOutlet weak var trackTableView: UITableView!
    
    var player: AudioSpectrumPlayer!
    var view1:lineView!
    var view2:lineView!
    private lazy var trackPaths: [String] = {
        var paths = Bundle.main.paths(forResourcesOfType: "mp3", inDirectory: nil)
        paths.sort()
        return paths.map { $0.components(separatedBy: "/").last! }
    }()
    
    private var currentPlayingRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        trackTableView.dataSource = self
        player = AudioSpectrumPlayer()
        player.delegate = self
        
        
        view1 = lineView(frame: CGRect(x: 100, y: 70, width: 200, height: 200))
        
        self.view.addSubview(view1)

        
        view2 = lineView(frame: CGRect(x: 100, y: 320, width: 200, height: 200))
        
        self.view.addSubview(view2)
    }
    override func viewDidLayoutSubviews() {
        let barSpace = spectrumView.frame.width / CGFloat(player.analyzer.frequencyBands * 3 - 1)
        spectrumView.barWidth = barSpace * 2
        spectrumView.space = barSpace
    }
}

// MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackPaths.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell") as! TrackCell
        cell.configure(trackName: "\(trackPaths[indexPath.row])", playing: currentPlayingRow == indexPath.row)
        cell.delegate = self
        return cell
    }
}

// MARK: TrackCellDelegate
extension ViewController: TrackCellDelegate {
    func playTapped(_ cell: TrackCell) {
        if let indexPath = trackTableView.indexPath(for: cell) {
            let previousPlayingRow = currentPlayingRow
            self.currentPlayingRow = indexPath.row
            if indexPath.row != previousPlayingRow && previousPlayingRow != nil  {
                trackTableView.reloadRows(at: [IndexPath(row: previousPlayingRow!, section: 0)], with: .none)
            }
            player.play(withFileName: trackPaths[indexPath.row])
        }
    }
    func stopTapped(_ cell: TrackCell) {
        self.currentPlayingRow = nil
        player.stop()
    }
}

// MARK: SpectrumPlayerDelegate
extension ViewController: AudioSpectrumPlayerDelegate {
    func player(_ player: AudioSpectrumPlayer, didGenerateSpectrum spectra: [[Float]]) {
        DispatchQueue.main.async {
          self.view1.drawArc(withArry1: spectra[0], withArry2: spectra[1], with: CGPoint(x: 100, y: 200), withWidth: 100)
            
            self.view2.drawLine(withArry: spectra[0], with: CGPoint(x: 100, y: 200), withWidth: 100);
            
            
            self.spectrumView.spectra = spectra
        }
    }
}

