//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    
    
    var storyNumber = 0
    
    var stories = [
    
        Story(title: "You were on a spaceshuttle that just crashed on Mars. You see a light in the horizon but you are low on food and oxygen.", choice1: "Go towards the light and check it out", choice1Destination: 2, choice2: "Go to sleep and hope it was just a dream.", choice2Destination: 1),
        Story(title: "You went to sleep and never woke up.", choice1: "The", choice1Destination: 0, choice2: "End", choice2Destination: 0),
        Story(title: "About an hour into your hike you approach a canyon. It will take much longer to go around but it will be much safer.", choice1: "Go around.", choice1Destination: 5, choice2: "Enter the canyon.", choice2Destination: 4),
        Story(title: "You put it in your mouth and instantly regret it as you take your last breath.", choice1: "The", choice1Destination: 0, choice2: "End", choice2Destination: 0),
        Story(title: "In the canyon you discover a fruit that has never been seen before. You are really hungry and you really need the energy.", choice1: "Eat it.", choice1Destination: 3, choice2: "I probably shouldn't...", choice2Destination: 6),
        Story(title: "After hours and hours of trekking on the harsh terrain, you decide to nap. You never wake up.", choice1: "The", choice1Destination: 0, choice2: "End", choice2Destination: 0),
        Story(title: "You leave the canyon and approach a building. You are greeted by a doorway with a passkey to enter. There is a note that gives the hint to the passcode that says, 'What you are looking for is pass'. The rest of the password was ripped off the paper. You see behind you there is a terrifying beast approaching.'", choice1: "Type in 'password' as the passkey", choice1Destination: 8, choice2: "Type in 'passkey' as the password", choice2Destination: 7),
        Story(title: "You make it into the building and shut the door on the creature. You find food and live to fight another day.", choice1: "You Won!", choice1Destination: 0, choice2: "The End", choice2Destination: 0),
        Story(title: "You typed in 'password' but the correct passkey was 'passkey'. The animal devours you seconds later.", choice1: "The", choice1Destination: 0, choice2: "End", choice2Destination: 0)
        ]
    
    func getStoryTitle() -> String {
        return stories[storyNumber].title
    }

    func getChoice1() -> String {
        return stories[storyNumber].choice1
    }
    
    func getChoice2() -> String {
        return stories[storyNumber].choice2
    }
    
   mutating func nextStory(userChoice: String) {
        
        let currentStory = stories[storyNumber]
        if userChoice == currentStory.choice1 {
            storyNumber = currentStory.choice1Destination
        } else if userChoice == currentStory.choice2 {
            storyNumber = currentStory.choice2Destination
        }
    }
    
    
    
}


