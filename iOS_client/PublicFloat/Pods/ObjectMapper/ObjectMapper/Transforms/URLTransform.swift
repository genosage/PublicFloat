//
//  URLTransform.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2014-10-27.
//  Copyright (c) 2014 hearst. All rights reserved.
//

import Foundation

open class URLTransform: TransformType {
	open typealias Object = URL
	open typealias JSON = String

	public init() {}

	open func transformFromJSON(_ value: AnyObject?) -> URL? {
		if let URLString = value as? String {
			return URL(string: URLString)
		}
		return nil
	}

	open func transformToJSON(_ value: URL?) -> String? {
		if let URL = value {
			return URL.absoluteString
		}
		return nil
	}
}
