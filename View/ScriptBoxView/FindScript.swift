//
//  File.swift
//  
//
//  Created by yusang on 2023/03/29.
//

import Foundation

//private func setSequenceView(currentScene: EnumScene) -> any View {
//    switch currentScene {
//    case .opeaning:
//        return SequenceOpeningView()
//    case .sequence1:
//        return SequenceOneView()
//    case .sequence2:
//        return SequenceTwoView()
//    case .sequence3:
//        return SequenceThreeView()
//    case .ending:
//        return SequenceEndingView()
//    }
//}


func findScript(scriptCount: Int, scripts: [Script]) -> String {
    var script = ""
    script = "\(scripts[scriptCount].1)"
    //
    return script
}
