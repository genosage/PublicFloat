//
//  ISO8601DateTransform.swift
//  ObjectMapper
//
//  Created by Jean-Pierre Mouilleseaux on 21 Nov 2014.
//
//

import Foundation

open class ISO8601DateTransform: DateFormatterTransform {

	public init() {
		let formatter = DateFormatter()
		formatter.locale = Locale(localeIdentifier: "en_US_POSIX")
		formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
		
		super.init(dateFormatter: formatter)
	}
	
}
