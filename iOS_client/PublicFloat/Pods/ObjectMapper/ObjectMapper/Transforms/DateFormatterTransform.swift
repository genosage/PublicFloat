//
//  DateFormatterTransform.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2015-03-09.
//  Copyright (c) 2015 hearst. All rights reserved.
//

import Foundation

open class DateFormatterTransform: TransformType {
	open typealias Object = Date
	open typealias JSON = String
	
	let dateFormatter: DateFormatter
	
	public init(dateFormatter: DateFormatter) {
		self.dateFormatter = dateFormatter
	}
	
	open func transformFromJSON(_ value: AnyObject?) -> Date? {
		if let dateString = value as? String {
			return dateFormatter.date(from: dateString)
		}
		return nil
	}
	
	open func transformToJSON(_ value: Date?) -> String? {
		if let date = value {
			return dateFormatter.string(from: date)
		}
		return nil
	}
}
