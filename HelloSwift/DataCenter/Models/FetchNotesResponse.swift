//
//  FetchNotesResponse.swift
//
//  Created by Ranjith Kumar on 30/10/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct FetchNotesResponse {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kFetchNotesResponseTotalObjectsKey: String = "totalObjects"
  private let kFetchNotesResponseOffsetKey: String = "offset"
  private let kFetchNotesResponseDataKey: String = "data"

  // MARK: Properties
  public var totalObjects: Int?
  public var offset: Int?
  public var data: [Data]?

  // MARK: SwiftyJSON Initalizers
  /**
   Initates the instance based on the object
   - parameter object: The object of either Dictionary or Array kind that was passed.
   - returns: An initalized instance of the class.
  */
  public init(object: Any) {
    self.init(json: JSON(object))
  }

  /**
   Initates the instance based on the JSON that was passed.
   - parameter json: JSON object from SwiftyJSON.
   - returns: An initalized instance of the class.
  */
  public init(json: JSON) {
    totalObjects = json[kFetchNotesResponseTotalObjectsKey].int
    offset = json[kFetchNotesResponseOffsetKey].int
    if let items = json[kFetchNotesResponseDataKey].array { data = items.map { Data(json: $0) } }
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = totalObjects { dictionary[kFetchNotesResponseTotalObjectsKey] = value }
    if let value = offset { dictionary[kFetchNotesResponseOffsetKey] = value }
    if let value = data { dictionary[kFetchNotesResponseDataKey] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
