//
//  GenericsService.swift
//  ChallengeChuckNorris
//
//  Created by Ellington Cavalcante on 17/07/23.
//

import UIKit
import Alamofire

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    case errorRequest(AFError)
}
