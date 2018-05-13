import Foundation

// THE GAME OF HEROES

// Some text to launch the game
letsStart()

// We define two instances of our class Team to start the game and set up the characters and teams
var team1 = teamBuilding(number: 1)
var team2 = teamBuilding(number: 2)

// This variable allows us to keep the count of rounds in the game
var roundNumber = 0

//This function is running the fight of the two team until one of them dies ..!
while team1.totalLifePoints != 0 && team2.totalLifePoints != 0 {
    playRound(teamAttack: team1, teamDefense: team2)
    print("L'équipe de \(team1.player.playerName) a un total de \(team1.totalLifePoints) PVs")
    print("L'équipe de \(team2.player.playerName) a un total de \(team2.totalLifePoints) PVs")
    roundNumber += 1
    if team2.totalLifePoints != 0 {
        playRound(teamAttack: team2, teamDefense: team1)
        print("L'équipe de \(team1.player.playerName) a un total de \(team1.totalLifePoints) PVs")
        print("L'équipe de \(team2.player.playerName) a un total de \(team2.totalLifePoints) PVs")
        roundNumber += 1
    }
}


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
