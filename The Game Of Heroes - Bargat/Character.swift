import Foundation

// Character Class

class Character {
    var characterIndex: Int // The index of the Character that we us in functions using loops to display team's info
    var characterName: String // The name of the character
    var characterType: CharacterType // The type of our character amongst the available typs in the enum below
    var typeName: String // The name of the type, a string that we use to display info in the game
    var lifePoints: Int {
        willSet {
        }
        didSet {
            if oldValue > lifePoints { // we want to notify the players when a character loses life points
                print("\(characterName) a perdu \(oldValue - lifePoints) PVs")
            } else if 0 < oldValue && oldValue < lifePoints {
                print("\(characterName) a guéri et regagne \(lifePoints - oldValue) PVs") // same, if a healer cures the character, we notify the players
            } else if lifePoints == 0 { // if the lifePoints reaches 0, then the character is dead
                print("\(characterName) est mort et quitte la partie")
            }
        }
    }
    var weaponName: String {
        willSet{
        }
        didSet{
            if oldValue != weaponName{ // if the weapon changes, we notify the player
                print("\(characterName) a maintenant \(weaponName)")
            }
        }
    }
    var weaponDammages: Int{
        willSet{
        }
        didSet{
            if oldValue != weaponDammages{ // if the weapon changes, we notify the player
                print("\(weaponName) a maintenant un pouvoir de \(weaponDammages) PVs")
            }
        }
    }
    init (characterIndex: Int, characterName: String, characterType: CharacterType){
        self.characterIndex = characterIndex
        self.characterName = characterName
        self.characterType = characterType
        
        switch self.characterType { // we of four cases in the initiation depending on the character's type
        case .Fighter:
            self.lifePoints = 20
            self.typeName = "combattant"
            self.weaponDammages = 10
            self.weaponName = "une épée"
        case .Healer:
            self.lifePoints = 20
            self.typeName = "mage"
            self.weaponDammages = -10
            self.weaponName = "une baguette magique"
        case .Giant:
            self.lifePoints = 20
            self.typeName = "colosse"
            self.weaponDammages = 25
            self.weaponName = "son poing"
        case . Dwarf:
            self.lifePoints = 20
            self.typeName = "nain"
            self.weaponDammages = 20
            self.weaponName = "un marteau"
        }
    }
    
    // function to ensure that a character's lifePoints can change (be hurt or be cured)
    func lifePointsChange(dammages: Int){
        self.lifePoints -= dammages // we remove as many life points as the attacker has dammage on its weapon.
        if self.lifePoints<0 { self.lifePoints = 0} // If a character loses more life points than its remaining life points, it won't get lower than 0, and the character will be dead then.
    }
    
    // function to use the charachter's dammages over another character's lifePoints
    func useWeapon(on character: Character){
        character.lifePointsChange(dammages: self.weaponDammages)
    }
}

enum CharacterType { // The enum for our 4 types
    case Fighter, Healer, Giant, Dwarf
}
