//
//  TransformType.swift
//  ObjectMapper
//
//  Created by Syo Ikeda on 2/4/15.
//  Copyright (c) 2015 hearst. All rights reserved.
//

public protocol TransformType {
	associatedtype Object
	associatedtype JSON

	func transformFromJSON(_ value: AnyObject?) -> Object?
	func transformToJSON(_ value: Object?) -> JSON?
}
