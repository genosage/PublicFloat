//
//  EnumTransform.swift
//  ObjectMapper
//
//  Created by Kaan Dedeoglu on 3/20/15.
//  Copyright (c) 2015 hearst. All rights reserved.
//

import Foundation

open class EnumTransform<T: RawRepresentable>: TransformType {
	open typealias Object = T
	open typealias JSON = T.RawValue
	
	public init() {}
	
	open func transformFromJSON(_ value: AnyObject?) -> T? {
		if let raw = value as? T.RawValue {
			return T(rawValue: raw)
		}
		return nil
	}
	
	open func transformToJSON(_ value: T?) -> T.RawValue? {
		if let obj = value {
			return obj.rawValue
		}
		return nil
	}
}
