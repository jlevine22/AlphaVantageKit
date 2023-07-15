//
//  ApiRequest.swift
//  
//
//  Created by Eugene Rysaj on 06.03.2020.
//

import Foundation

public protocol ApiRequest {
  associatedtype Response: Decodable

  var queryItems: [URLQueryItem] { get }
}
