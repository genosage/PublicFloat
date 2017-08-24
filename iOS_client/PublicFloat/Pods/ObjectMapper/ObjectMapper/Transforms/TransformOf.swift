//
//  TransformOf.swift
//  ObjectMapper
//
//  Created by Syo Ikeda on 1/23/15.
//  Copyright (c) 2015 hearst. All rights reserved.
//

open class TransformOf<ObjectType, JSONType>: TransformType {
	open typealias Object = ObjectType
	open typealias JSON = JSONType

	fileprivate let fromJSON: (JSONType?) -> ObjectType?
	fileprivate let toJSON: (ObjectType?) -> JSONType?

	public init(fromJSON: (JSONType?) -> ObjectType?, toJSON: (ObjectType?) -> JSONType?) {
		self.fromJSON = fromJSON
		self.toJSON = toJSON
	}

	open func transformFromJSON(_ value: AnyObject?) -> ObjectType? {
		return fromJSON(value as? JSONType)
	}

	open func transformToJSON(_ value: ObjectType?) -> JSONType? {
		return toJSON(value)
	}
}
