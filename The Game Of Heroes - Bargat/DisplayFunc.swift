import Foundation

// Function to send a message at the beginning of the game

func letsStart() {
    print("🏰 Bienvenue dans Game of Heroes 🏰"
        + "\nDébutons notre joute du jour !!")
}


// Function to display the info of a team

func teamInfo(team: Team) {
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
