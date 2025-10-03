//
//  MenuData.swift
//  guidedBreathingApp Watch App
//
//  Created by Renan Toniolo Rocha on 18/09/25.
//

import Foundation
import Combine

class MenuData: ObservableObject {
    enum Section: String, CaseIterable {
        case spirit = "spirit"
        case breaht = "breaht"
        case reflect = "reflect"
    }
    
    let section: Section
    
    var title: String {
        switch section {
        case .spirit:
            return "Espirito"
        case .breaht:
            return "Respiração"
        case .reflect:
            return "Refelxão"
        }
    }
    
    var icon: String {
        switch section {
        case .spirit:
            return "figure.mind.and.body"
        case .breaht:
            return "aqi.medium"
        case .reflect:
            return "wind"
        }
    }
    
    var description: String {
        switch section {
        case .spirit:
            return "Descubra o poder da meditação guiada para acalmar sua mente e renovar seu espírito."
        case .breaht:
            return "Respirar é se conectar com o momento presente. Aprenda técnicas de respiração para aliviar o estresse e aumentar sua concentração."
        case .reflect:
            return "Refletir é iluminar o caminho para o autoconhecimento. Explore práticas de reflexão para cultivar a gratidão e a clareza mental."
        }
    }
    
    @Published var timerInt = 1
    
    var timerStr: String {
        if timerInt == 1 {
            return "\(timerInt) Minuto"
        }
        return "\(timerInt) Minutos"
    }
    
    init(section: Section) {
        self.section = section
        
        self.timerInt = PreferenceManager.shared.getTimer(section: section) ?? 1
    }
    
    public func setTime(timer: Int) {
        self.timerInt = timer
        PreferenceManager.shared.setTimer(section: self.section, timer: timer)
    }
}
