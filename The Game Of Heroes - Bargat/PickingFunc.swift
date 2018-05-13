import Foundation

// Here, we have our three picking function used in the Round process.

// Function to chose your attacker
func pickYourAttacker(team: Team) -> Character {
    print("\n\(team.player.playerName), quel personnage souhaites-tu sélectionner? (rentre le numéro corresepondant)")
    for character in team.teamCompo {
        // We create a loop to display only the characters who are still alive.
        if character.lifePoints > 0 {
            print("\n       \(character.characterIndex + 1) - Le \(character.typeName) \(character.characterName)")
        }
    }
    if let choice = readLine() {
        switch choice {
        case "1":
            if team.teamCompo[0].lifePoints > 0 {
                print("Tu as choisi \(team.teamCompo[0].characterName) !")
                return team.teamCompo[0]
            } else {
                print("\(team.teamCompo[0].characterName) est mort, tu dois choisir un autre personnage !")
                return pickYourAttacker(team: team)
            }
        case "2":
            if team.teamCompo[1].lifePoints > 0 {
                print("Tu as choisi \(team.teamCompo[1].characterName) !")
                return team.teamCompo[1]
            } else {
                print("\(team.teamCompo[1].characterName) est mort, tu dois choisir un autre personnage !")
                return pickYourAttacker(team: team)
            }
        case "3":
            if team.teamCompo[2].lifePoints > 0 {
                print("Tu as choisi \(team.teamCompo[2].characterName) !")
                return team.teamCompo[2]
            } else {
                print("\(team.teamCompo[2].characterName) est mort, tu dois choisir un autre personnage !")
                return pickYourAttacker(team: team)
            }
        default :
            print ("Je ne comprends pas.")
            return pickYourAttacker(team: team)
        }
    } else {
        print ("Je ne comprends pas.")
        return pickYourAttacker(team: team)
    }
}

// Function to chose your target
func pickYourTarget(teamAttack: Team, teamDefense: Team) -> Character {
    print("\n\(teamAttack.player.playerName), quel personnage souhaites-tu cibler? (rentre le numéro corresepondant)")
    for character in teamDefense.teamCompo {
        // We create a loop to display only the characters who are still alive.
        if character.lifePoints > 0 {
            print("\n       \(character.characterIndex + 1) - Le \(character.typeName) \(character.characterName)")
        }
    }
    if let choice = readLine() {
        switch choice {
        case "1":
            if teamDefense.teamCompo[0].lifePoints > 0 {
                print("Tu as choisi \(teamDefense.teamCompo[0].characterName) !")
                return teamDefense.teamCompo[0]
            } else {
                print("\(teamDefense.teamCompo[0].characterName) est mort, tu dois choisir un autre personnage !")
                return pickYourTarget(teamAttack: teamAttack, teamDefense: teamDefense)
            }
        case "2":
            if teamDefense.teamCompo[1].lifePoints > 0 {
                print("Tu as choisi \(teamDefense.teamCompo[1].characterName) !")
                return teamDefense.teamCompo[1]
            } else {
                print("\(teamDefense.teamCompo[1].characterName) est mort, tu dois choisir un autre personnage !")
                return pickYourTarget(teamAttack: teamAttack, teamDefense: teamDefense)
            }
        case "3":
            if teamDefense.teamCompo[2].lifePoints > 0 {
                print("Tu as choisi \(teamDefense.teamCompo[2].characterName) !")
                return teamDefense.teamCompo[2]
            } else {
                print("\(teamDefense.teamCompo[2].characterName) est mort, tu dois choisir un autre personnage !")
                return pickYourTarget(teamAttack: teamAttack, teamDefense: teamDefense)
            }
        default :
            print ("Je ne comprends pas.")
            return pickYourTarget(teamAttack: teamAttack, teamDefense: teamDefense)
        }
    } else {
        print ("Je ne comprends pas.")
        return pickYourTarget(teamAttack: teamAttack, teamDefense: teamDefense)
    }
}

// Function to chose your target if your attacker is a healer > the target must be from the same team
func pickYourTargetHealer(team: Team) -> Character {
    print("\n\(team.player.playerName), quel personnage souhaites-tu cibler? (rentre le numéro corresepondant)")
    for character in team.teamCompo {
        // We create a loop to display only the characters who are still alive.
        if character.lifePoints > 0 {
            print("\n       \(character.characterIndex + 1) - Le \(character.typeName) \(character.characterName)")
        }
    }
    if let choice = readLine() {
        switch choice {
        case "1":
            if team.teamCompo[0].lifePoints > 0 {
                print("Tu as choisi \(team.teamCompo[0].characterName) !")
                return team.teamCompo[0]
            } else {
                print("\(team.teamCompo[0].characterName) est mort, tu dois choisir un autre personnage !")
                return pickYourTargetHealer(team: team)
            }
        case "2":
            if team.teamCompo[1].lifePoints > 0 {
                print("Tu as choisi \(team.teamCompo[1].characterName) !")
                return team.teamCompo[1]
            } else {
                print("\(team.teamCompo[1].characterName) est mort, tu dois choisir un autre personnage !")
                return pickYourTargetHealer(team: team)
            }
        case "3":
            if team.teamCompo[2].lifePoints > 0 {
                print("Tu as choisi \(team.teamCompo[2].characterName) !")
                return team.teamCompo[2]
            } else {
                print("\(team.teamCompo[2].characterName) est mort, tu dois choisir un autre personnage !")
                return pickYourTargetHealer(team: team)
            }
        default :
            print ("Je ne comprends pas.")
            return pickYourTargetHealer(team: team)
        }
    } else {
        print ("Je ne comprends pas.")
        return pickYourTargetHealer(team: team)
    }
}

