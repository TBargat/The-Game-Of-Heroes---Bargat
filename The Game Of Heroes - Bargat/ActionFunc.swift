import Foundation

// Function to get the name of a player
func createPlayerName(number: Int) -> String {
    print ("\nJoueur \(number), quel est ton nom? (Rentre ton nom suivi de la touche 'Entrer')")
    if let nameOfPlayer = readLine(){
        print ("Bienvenue, \(nameOfPlayer)")
        return nameOfPlayer
    } else {
        print("Je n'ai pas compris")
        return createPlayerName(number: number)
    }
}

// This function allows the player to give a name to the character he/she is creating
func createCharacterName(number: Int) -> String {
    print ("\nQuel est le nom que tu souhaites donner au personnage \(number)? (Rentre le nom suivi de la touche 'Entrer')")
    if let nameOfCharacter = readLine(){
        print ("Bienvenue, \(nameOfCharacter)")
        return nameOfCharacter
    } else {
        print("Je n'ai pas compris")
        return createCharacterName(number: number)
    }
}

// This function allows the player to chose his/her character's type, thus it returns an object which is a CharacterType
func createCharacterType(number: Int) -> CharacterType {
    print("\nPour ton personnage \(number) quelle classe veux-tu?"
        + "\n1. ⚔️ Combattant (il a 100 PV et retire 15 PV à sa cible grâce à son épée)"
        + "\n2. 🧙‍♂️ Mage (il a 70 PV et fait gagner 30 PV au personnage qu'il soigne, lui-même inclus)"
        + "\n3. 💪 Colosse (il a 120 PV et retire 25 PV à sa cible avec ses poings, il perd 5 PV à chaque coup donné)"
        + "\n4. ⚒ Nain (il a 90 PV et retire 20 PV à sa cible avec son marteau)")
    if let choice = readLine() {
        switch choice {
        case "1":
            print("Tu as choisi un Combattant ⚔️ !")
            return .Fighter
        case "2":
            print("Tu as choisi un Mage 🧙‍♂️ !")
            return .Healer
        case "3":
            print("Tu as choisi un Colosse 💪 !")
            return .Giant
        case "4":
            print("Tu as choisi un Nain ⚒ !")
            return .Dwarf
        default :
            print ("Je ne comprends pas.")
            return createCharacterType(number: number)
        }
    } else {
        print ("Je ne comprends pas.")
        return createCharacterType(number: number)
    }
}

// This function gives a character ready to fight
func getCharacter(number: Int) -> Character {
    return Character(characterIndex: number-1, characterName: createCharacterName(number: number), characterType: createCharacterType(number: number))
}

// This function aims to return a team fully set up for the game!
func teamBuilding(number: Int) -> Team {
    let player = Player(playerName: createPlayerName(number: number), playerNumber: number)// we make an instance of Player with the function above
    let character1 = getCharacter(number: 1)// we use the previous function to create instances of our 3 characters
    let character2 = getCharacter(number: 2)
    let character3 = getCharacter(number: 3)
    let team = Team(player: player, character1: character1, character2: character2, character3: character3) // We finally make the instance of our team
    print("\n\(team.player.playerName), ton équipe est composée de:"
        + "\n- \(team.character1.characterName) qui est un \(team.character1.typeName)"
        + "\n- \(team.character2.characterName) qui est un \(team.character2.typeName)"
        + "\n- \(team.character3.characterName) qui est un \(team.character3.typeName)")
    return team
}

// Function to play a round of fight
func playRound(teamAttack: Team, teamDefense: Team){// We have on team that attacks and the other one that defends, hence, our round function takes in account those two teams.
    teamInfo(team: teamAttack)
    teamInfo(team: teamDefense)
    let attacker = pickYourAttacker(team: teamAttack)
    if Int(arc4random_uniform(9)) == 4{// to make our mysterious box appear randomly, we have odds of 1 out of 10
        randomMysteriousBox(character: attacker)
    }
    if attacker.characterType == .Healer {// Healers targets their own team, they need to be treated separately
        let target = pickYourTargetHealer(team: teamAttack)
        attacker.useWeapon(on: target)
    } else {
        let target = pickYourTarget(teamAttack: teamAttack, teamDefense: teamDefense)
        if attacker.characterType == .Giant{
            attacker.useWeapon(on: target)
            attacker.lifePointsChange(dammages: attacker.weaponDammages/3)// The Giant hits his ennemy with his fist, hence he also loses lifepoints whenever he attacks.
        } else {
            attacker.useWeapon(on: target)
        }
    }
}
