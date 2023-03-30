
import SwiftUI
import AVFoundation
import Combine

struct SequenceOpeningView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    let backgroundMusicFiles = ["BGM_Adventure_Begin", "BGM_Adventure_mystery"]
    let soundEffectFiles = ["SFX_Opening_exp_medium6", "SFX_Opening_sounds_falling7", "SFX_Opening_sounds_powerup15", "SFX_Opening_lowhealth_alarmloop7", "SFX_Opening_sounds_powerup6", "SFX_Opening_sounds_button11", "SFX_Opening_movement_dooropen4", "Walk"] // add the names of your sound effect files here
    let musicFileExtension = "wav" // add the extension of your music files here
    let musicFileExtension1 = "wav"
    //let backgroundMusicCountInterval = 1...2 // play background music when the count is within this range
    //let soundEffectCountIntervals = [2, 4] // play sound effects when the count is equal to these values
    
    let volume: Float = 0.1 // adjust this value to set the volume
    let volume1: Float = 0.3
    
    @State private var currentCount = 0
    @State private var backgroundMusicPlayer: AVPlayer?
    @State private var soundEffectPlayer: AVPlayer?
    @State private var currentPlayCount = 0
    
    @State
    var isCharcterActive = false
    @State
    var blackbackground1 = false
    @State
    var crowd = false
    @State
    var crowd2 = false
    
    private func handleSequenceView(scriptCount: Int) {
        switch scriptCount {
        case 0:
            blackbackground1 = true
        case 3:
            setTimeoutClosure(timeCount: 1500) {
                blackbackground1 = false
                crowd = true
            }
        case 11:
            crowd = false
            crowd2 = true
        case 12:
            crowd2 = false
        default:
            print("scriptCount", scriptCount)
        }
    }
    
    //var test1 = 0
    var isHidden: Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading){
            if crowd {
                ZStack{
                    CharacterView(objectName: walker.name, makeDirection: EnumDirection.Back_2, start: (80.0, 550.0), end: (0.0, 0.0))
                    CharacterView(objectName: luna.name, makeDirection: EnumDirection.Back_2, start: (124.0, 560.0), end: (0.0, 0.0))
                    CharacterView(objectName: muho.name, makeDirection: EnumDirection.Back_2, start: (168.0, 540.0), end: (0.0, 0.0))
                    CharacterView(objectName: coffee.name, makeDirection: EnumDirection.Back_2, start: (222.0, 560.0), end: (0.0, 0.0))
                    CharacterView(objectName: olive.name, makeDirection: EnumDirection.Back_2, start: (266.0, 570.0), end: (0.0, 0.0))
                    CharacterView(objectName: henry.name, makeDirection: EnumDirection.Back_2, start: (310.0, 540.0), end: (0.0, 0.0))
                }
                
                if blackbackground1 {
                    Image("Background_Black")
                        .position(x: -100, y: -150)
                }
                
                
            }
            if crowd2 {
                ZStack{
                    CharacterView(objectName: walker.name, makeDirection: EnumDirection.Back_1, start: (80.0, 550.0), end: (-20.0, -420.0))
                    CharacterView(objectName: luna.name, makeDirection: EnumDirection.Back_1, start: (124.0, 560.0), end: (-10.0, -400.0))
                    CharacterView(objectName: muho.name, makeDirection: EnumDirection.Back_1, start: (168.0, 540.0), end: (0.0, -370.0))
                    CharacterView(objectName: coffee.name, makeDirection: EnumDirection.Back_1, start: (222.0, 560.0), end: (0.0, -410.0))
                    CharacterView(objectName: olive.name, makeDirection: EnumDirection.Back_1, start: (266.0, 570.0), end: (20.0, -400.0))
                    CharacterView(objectName: henry.name, makeDirection: EnumDirection.Back_1, start: (310.0, 540.0), end: (40.0, -370.0))
                }
            }
        }
        .onReceive(globalStore.$scriptCount, perform: { currentCount in
            handleSequenceView(scriptCount: currentCount)
            
            switch currentCount {
                //                case backgroundMusicCountInterval:
                //                    // Play background music when the count is within the specified interval
                //                    let musicFileName = backgroundMusicFiles[currentCount - 1] // count starts at 1, but array index starts at 0
                //                    let musicFileUrl = Bundle.main.url(forResource: musicFileName, withExtension: musicFileExtension)!
                //                    backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                //                    backgroundMusicPlayer?.volume = volume
                //                    backgroundMusicPlayer?.play()
            case 0 :
                let musicFileName = backgroundMusicFiles[0] // count starts at 1, but array index starts at 0
                let musicFileUrl = Bundle.main.url(forResource: musicFileName, withExtension: musicFileExtension)!
                backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                backgroundMusicPlayer?.volume = volume
                backgroundMusicPlayer?.play()
//
//            case 3 :
//                backgroundMusicPlayer?.pause()
            case 3 :
                //backgroundMusicPlayer?.pause()
                let musicFileName = backgroundMusicFiles[1] // count starts at 1, but array index starts at 0
                let musicFileUrl = Bundle.main.url(forResource: musicFileName, withExtension: musicFileExtension)!
                backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
                backgroundMusicPlayer?.volume = volume
                backgroundMusicPlayer?.play()
                
                let effectFileName = soundEffectFiles[0] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 4 :
                let effectFileName = soundEffectFiles[1] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 6 :
                let effectFileName = soundEffectFiles[2] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 7 :
                let effectFileName = soundEffectFiles[3] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 8 :
                let effectFileName = soundEffectFiles[4] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 9 :
                let effectFileName = soundEffectFiles[5] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 11 :
                let effectFileName = soundEffectFiles[7] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()
            case 12 :
                let effectFileName = soundEffectFiles[6] // count starts at 1, but array index starts at 0
                let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: musicFileExtension1)!
                soundEffectPlayer = AVPlayer(url: effectFileUrl)
                soundEffectPlayer?.volume = volume1
                soundEffectPlayer?.play()

                //                case 3:
                //                    // Stop all music when the count is 6
                //                    backgroundMusicPlayer?.pause()
                //                    soundEffectPlayers.forEach { player in
                //                        player.pause()
                //                    }
                //soundEffectPlayers.removeAll()
                
            default:
                break
            }
        })
    }
}
