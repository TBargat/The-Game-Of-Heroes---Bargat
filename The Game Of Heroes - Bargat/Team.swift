import Foundation

// Class Team, that features all the components of a team to launch the game

class Team {
    var player: Player // The player of the team that we have created before
    var totalLifePoints: Int // the total of all the characters' lifePoints
    var character1: Character // the 3 instances of character to make our team
    var character2: Character
    var character3: Character
    var teamCompo: [Character] // an array to be able to choose more easily the characters of the team
    init (player: Player, character1: Character, character2: Character, character3: Character){
        self.player = player
        self.totalLifePoints = (character1.lifePoints + character2.lifePoints + character3.lifePoints)
        self.teamCompo = [character1, character2, character3]
        self.character1 = character1
        self.character2 = character2
        self.character3 = character3
    }
}
