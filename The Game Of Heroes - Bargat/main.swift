import Foundation

// THE GAME OF HEROES


letsStart() // Some text to launch the game

var game = Game(team1: teamBuilding(number: 1), team2: teamBuilding(number: 2)) // We define an instance of our class Game and two instances of our class Team to start the game and set up the characters and teams


game.playRounds() //This function is running the fight of the two team until one of them dies ..!

game.endOfGame() // When the game ends, we congratulate the winner.

