import Foundation

// The class for our human players !

class Player {
    var playerName: String // The name of the Player
    var playerNumber: Int // His number, either 1 or 2
    init (playerName: String, playerNumber: Int) {
        self.playerName = playerName
        self.playerNumber = playerNumber
    }
}
