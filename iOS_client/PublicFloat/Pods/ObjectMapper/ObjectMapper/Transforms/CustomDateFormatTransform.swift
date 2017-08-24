//
//  CustomDateFormatTransform.swift
//  ObjectMapper
//
//  Created by Dan McCracken on 3/8/15.
//
//

import Foundation

open class CustomDateFormatTransform: DateFormatterTransform {
	
    public init(formatString: String) {
		let formatter = DateFormatter()
		formatter.locale = Locale(localeIdentifier: "en_US_POSIX")
		formatter.dateFormat = formatString
		
		super.init(dateFormatter: formatter)
    }
}
