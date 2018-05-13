import Foundation

// How to make a mysterious safe appear randomly and change the character's weapon and power
func randomMysteriousBox (character: Character) {
    print("Un coffre mystère apparait, une aubaine pour \(character.characterName) qui va pouvoir améliorer son arme!")
    switch character.characterType{
    case .Fighter:
        character.weaponName = "une SUPER épée"
        character.weaponDammages = 20
    case .Healer:
        character.weaponName = "une SUPER baguette"
        character.weaponDammages = -45
    case .Giant:
        character.weaponName = "un SUPER poing"
        character.weaponDammages = 35
    case .Dwarf:
        character.weaponName = "un SUPER marteau"
        character.weaponDammages = 30
    }
}
