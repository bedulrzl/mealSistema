//
//  Encodable+Extensions.swift
//  mealSistema
//
//  Created by Aprizal on 27/1/21.
//

import Foundation
extension Encodable {
  func asDictionary() throws -> [String: Any] {
    let data = try JSONEncoder().encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      throw NSError()
    }
    return dictionary
  }
}
