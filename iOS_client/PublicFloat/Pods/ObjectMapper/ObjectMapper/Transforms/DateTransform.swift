//
//  DateTransform.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2014-10-13.
//  Copyright (c) 2014 hearst. All rights reserved.
//

import Foundation

open class DateTransform: TransformType {
	open typealias Object = Date
	open typealias JSON = Double

	public init() {}

	open func transformFromJSON(_ value: AnyObject?) -> Date? {
		if let timeInt = value as? Double {
			return Date(timeIntervalSince1970: TimeInterval(timeInt))
		}
		return nil
	}

	open func transformToJSON(_ value: Date?) -> Double? {
		if let date = value {
			return Double(date.timeIntervalSince1970)
		}
		return nil
	}
}
