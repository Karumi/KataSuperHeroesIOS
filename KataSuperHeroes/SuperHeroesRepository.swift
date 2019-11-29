//
//  SuperHeroesRepository.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 12/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import Foundation

class SuperHeroesRepository {

    fileprivate let superHeroes: [SuperHero]

    init() {
        self.superHeroes = [
            SuperHero(name: "Scarlet Witch",
                photo: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/9/b0/537bc2375dfb9.jpg"),
                isAvenger: false,
                description: "Scarlet Witch was born at the Wundagore base of the High Evolutionary, she and her twin "
                    + "brother Pietro were the children of Romani couple Django and Marya Maximoff. The "
                    + "High Evolutionary supposedly abducted the twins when they were babies and "
                    + "experimented on them, once he was disgusted with the results, he returned them to"
                    + " Wundagore, disguised as regular mutants."),
            SuperHero(name: "Iron Man",
                photo: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/c/60/55b6a28ef24fa.jpg"),
                isAvenger: true,
                description: "Wounded, captured and forced to build a weapon by his enemies, billionaire "
                    + "industrialist Tony Stark instead created an advanced suit of armor to save his "
                    + "life and escape captivity. Now with a new outlook on life, Tony uses his money "
                    + "and intelligence to make the world a safer, better place as Iron Man."),
            SuperHero(name: "Wolverine",
                photo: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/9/00/537bcb1133fd7.jpg"),
                isAvenger: false,
                description: "Born with super-human senses and the power to heal from almost any wound, Wolverine "
                    + "was captured by a secret Canadian organization and given an unbreakable "
                    + "skeleton and claws. Treated like an animal, it took years for him to control"
                    + " himself. Now, he's a premiere member of both the X-Men and the Avengers."),
            SuperHero(name: "Hulk",
                photo: URL(string: "https://x.annihil.us/u/prod/marvel/i/mg/e/e0/537bafa34baa9.jpg"),
                isAvenger: true,
                description: "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. "
                    + "Bruce Banner was transformed into the incredibly powerful creature called the "
                    + "Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the "
                    + "stronger the Hulk gets."),
            SuperHero(name: "Storm",
                photo: URL(string: "https://x.annihil.us/u/prod/marvel/i/mg/c/b0/537bc5f8a8df0.jpg"),
                isAvenger: false,
                description: "Ororo Monroe is the descendant of an ancient line of African priestesses, all of whom"
                    + " have white hair, blue eyes, and the potential to wield magic."),
            SuperHero(name: "Spider-Man",
                photo: URL(string: "https://x.annihil.us/u/prod/marvel/i/mg/6/60/538cd3628a05e.jpg"),
                isAvenger: true,
                description: "Bitten by a radioactive spider, high school student Peter Parker gained the speed, "
                    + "strength and powers of a spider. Adopting the name Spider-Man, Peter hoped to start "
                    + "a career using his new abilities. Taught that with great power comes great "
                    + "responsibility, Spidey has vowed to use his powers to help people."),
            SuperHero(name: "Ultron",
                photo: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/9/a0/537bc7f6d5d23.jpg"),
                isAvenger: false,
                description: "Arguably the greatest and certainly the most horrific creation of scientific genius "
                    + "Dr. Henry Pym, Ultron is a criminally insane rogue sentient robot dedicated to"
                    + " conquest and the extermination of humanity."),
            SuperHero(name: "BlackPanther",
                photo: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/9/03/537ba26276348.jpg"),
                isAvenger: false,
                description: " T'Challa is a brilliant tactician, strategist, scientist, tracker and a master of all "
                    + "forms of unarmed combat whose unique hybrid fighting style incorporates acrobatics "
                    + "and aspects of animal mimicry. T'Challa being a royal descendent of a warrior race "
                    + "is also a master of armed combat, able to use a variety of weapons but prefers "
                    + "unarmed combat. He is a master planner who always thinks several steps ahead and "
                    + "will go to extreme measures to achieve his goals and protect the kingdom "
                    + "of Wakanda."),
            SuperHero(name: "Captain America",
                photo: URL(string: "https://x.annihil.us/u/prod/marvel/i/mg/9/80/537ba5b368b7d.jpg"),
                isAvenger: true,
                description: "Captain America represented the pinnacle of human physical perfection. He experienced a "
                    + "time when he was augmented to superhuman levels, but generally performed just below"
                    + " superhuman levels for most of his career. Captain America had a very high "
                    + "intelligence as well as agility, strength, speed, endurance, and reaction time "
                    + "superior to any Olympic athlete who ever competed."),
            SuperHero(name: "Winter Soldier",
                photo: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/7/40/537bca868687c.jpg"),
                isAvenger: false,
                description: "Olympic-class athlete and exceptional acrobat highly skilled in both unarmed and armed "
                    + "hand-to-hand combat and extremely accurate marksman. he is fluent in four languages "
                    + "including German and Russian."),
            SuperHero(name: "Captain Marvel",
                photo: URL(string: "https://x.annihil.us/u/prod/marvel/i/mg/6/30/537ba61b764b4.jpg"),
                isAvenger: false,
                description: " Ms. Marvel's current powers include flight, enhanced strength, durability and the "
                    + "ability to shoot concussive energy bursts from her hands."),
            SuperHero(name: "Iron Fist",
                photo: URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/6/60/537bb1756cd26.jpg"),
                isAvenger: false,
                description: "Through concentration, Iron Fist can harness his spiritual energy, or chi, to augment "
                    + "his physical and mental capabilities to peak human levels. By focusing his chi "
                    + "into his hand, he can tap the superhuman energy of Shou-Lao and temporarily "
                    + "render his fist superhumanly powerful, immune to pain and injury; however, this "
                    + "process is mentally draining, and he usually needs recovery time before he can "
                    + "repeat it. Iron Fist can heal himself of any injury or illness and project this "
                    + "power to heal others.")
            ]
    }

    func getAll(_ completion: @escaping ([SuperHero]) -> ()) {
        delay(1.5) {
            completion(self.superHeroes)
        }
    }

    func getSuperHero(withName name: String, completion: @escaping (SuperHero) -> ()) {
        delay(1.5) {
            if let superHeroByName = self.superHeroes.filter({ (superHero) -> Bool in
                superHero.name == name
                }).first {
                completion(superHeroByName)
            }
        }
    }

    fileprivate func delay(_ delay: Double, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure
        )
    }

}
