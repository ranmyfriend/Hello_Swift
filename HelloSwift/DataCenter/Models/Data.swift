//
//  Data.swift
//
//  Created by Ranjith Kumar on 30/10/2016
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct Data {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kDataMetaKey: String = "__meta"
  private let kDataClassKey: String = "___class"
  private let kDataCreatedKey: String = "created"
  private let kDataTitleKey: String = "Title"
  private let kDataObjectIdKey: String = "objectId"
  private let kDataBodyKey: String = "Body"

  // MARK: Properties
  public var meta: String?
  public var class_: String?
  public var created: Int?
  public var title: String?
  public var objectId: String?
  public var body: String?

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
    meta = json[kDataMetaKey].string
    class_ = json[kDataClassKey].string
    created = json[kDataCreatedKey].int
    title = json[kDataTitleKey].string
    objectId = json[kDataObjectIdKey].string
    body = json[kDataBodyKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = meta { dictionary[kDataMetaKey] = value }
    if let value = class_ { dictionary[kDataClassKey] = value }
    if let value = created { dictionary[kDataCreatedKey] = value }
    if let value = title { dictionary[kDataTitleKey] = value }
    if let value = objectId { dictionary[kDataObjectIdKey] = value }
    if let value = body { dictionary[kDataBodyKey] = value }
    return dictionary
  }

}
