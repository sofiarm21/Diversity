

import AVFoundation
public var player: AVAudioPlayer?

public func playSound(_ name: String, type: String) {
    let url = Bundle.main.url(forResource: name, withExtension: type)!
    do {
     player = try AVAudioPlayer(contentsOf: url)
     guard let player = player else { return }

     player.prepareToPlay()
     player.play()
     } catch let error {
     print(error.localizedDescription)
    }
}
