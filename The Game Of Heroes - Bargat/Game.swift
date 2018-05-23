import Foundation

class Game {
    var team1 : Team
    var team2 : Team
    var roundNumber = 0 // This variable allows us to keep the count of rounds in the game
    init (team1: Team, team2: Team) {
        self.team1 = team1
        self.team2 = team2
    }
    
    func playRounds() {
        while team1.totalLifePoints != 0 && team2.totalLifePoints != 0 {
            playRound(teamAttack: team1, teamDefense: team2)
            // We update the lifepoints
            team1.totalLifePoints = team1.character1.lifePoints + team1.character2.lifePoints +  team1.character3.lifePoints
            team2.totalLifePoints = team2.character1.lifePoints + team2.character2.lifePoints +  team2.character3.lifePoints
            print("L'équipe de \(team1.player.playerName) a un total de \(team1.totalLifePoints) PVs")
            print("L'équipe de \(team2.player.playerName) a un total de \(team2.totalLifePoints) PVs")
            roundNumber += 1
            if team2.totalLifePoints != 0 {
                playRound(teamAttack: team2, teamDefense: team1)
                // We update the lifepoints
                team1.totalLifePoints = team1.character1.lifePoints + team1.character2.lifePoints +  team1.character3.lifePoints
                team2.totalLifePoints = team2.character1.lifePoints + team2.character2.lifePoints +  team2.character3.lifePoints
                print("L'équipe de \(team1.player.playerName) a un total de \(team1.totalLifePoints) PVs")
                print("L'équipe de \(team2.player.playerName) a un total de \(team2.totalLifePoints) PVs")
                roundNumber += 1
            }
        }
    }
    
    func endOfGame() {
        // We create two variable, to store our winner and our loser later.
        var winner: Team
        var loser: Team
        
        if team1.totalLifePoints == 0 { // we observe the two potential outcomes of our game to initiate our variables
            winner = team2
            loser = team1
        } else {
            winner = team1
            loser = team2
        }
        
        // We close the game with this function
        congratulateTheWinner(winner: winner, loser: loser)
    }

    func letsStart() {  // Function to send a message at the beginning of the game
        print("🏰 Bienvenue dans Game of Heroes 🏰"
            + "\nDébutons notre joute du jour !!")
    }

    
    func teamInfo(team: Team) { // Function to display the info of a team
        print("\nÉtat de l'équipe de \(team.player.playerName) :")
        for character in team.teamCompo {
            if character.lifePoints == 0 {
                // If a character loses more life points than its remaining life points, it won't get lower than 0, and the character will be dead then.
                print("       - Le \(character.typeName) \(character.characterName) est mort.")
            } else {
                print("       - Le \(character.typeName) \(character.characterName) a \(character.lifePoints) PVs et a \(character.weaponName).")
            }
        }
    }
    
    
    func congratulateTheWinner(winner: Team, loser: Team) { // Congratulations to the winner
        print("\nBravo à \(winner.player.playerName) qui remporte la partie! \(loser.player.playerName) n'aura pas démérité mais est tombé sur plus vaillant aujourd'hui!")
        print("La partie a duré \(roundNumber) tours! Waouh, c'était intense!")
    }

}
