//
//  Filters.swift
//  Demotivator
//
//  Created by Раисат Рамазанова on 09.08.2021.
//

import Foundation

enum FilterType : String {
    case Chrome = "CIPhotoEffectChrome"
    case Fade = "CIPhotoEffectFade"
    case Instant = "CIPhotoEffectInstant"
    case Mono = "CIPhotoEffectMono"
    case Noir = "CIPhotoEffectNoir"
    case Process = "CIPhotoEffectProcess"
    case Tonal = "CIPhotoEffectTonal"
    case Transfer =  "CIPhotoEffectTransfer"
    
    static func randomFilter() -> String {
        let filterToGetRandomly = [FilterType.Chrome, FilterType.Fade, FilterType.Instant, FilterType.Mono, FilterType.Noir, FilterType.Process, FilterType.Tonal, FilterType.Transfer]
            let index = Int(arc4random_uniform(UInt32(filterToGetRandomly.count)))
            let strings = String(filterToGetRandomly[index].rawValue)
            return strings
        }
}
