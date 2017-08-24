//
//  Operators.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2014-10-09.
//  Copyright (c) 2014 hearst. All rights reserved.
//

/**
* This file defines a new operator which is used to create a mapping between an object and a JSON key value.
* There is an overloaded operator definition for each type of object that is supported in ObjectMapper.
* This provides a way to add custom logic to handle specific types of objects
*/

infix operator <- {}

// MARK:- Objects with Basic types

/// Object of Basic type
public func <- <T>(left: inout T, right: Map) {
    if right.mappingType == MappingType.fromJSON {
        FromJSON.basicType(&left, object: right.value())
    } else {
		ToJSON.basicType(left, map: right)
    }
}

/// Optional object of basic type
public func <- <T>(left: inout T?, right: Map) {
    if right.mappingType == MappingType.fromJSON {
        FromJSON.optionalBasicType(&left, object: right.value())
    } else {
        ToJSON.optionalBasicType(left, map: right)
    }
}

/// Implicitly unwrapped optional object of basic type
public func <- <T>(left: inout T!, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON.optionalBasicType(&left, object: right.value())
	} else {
		ToJSON.optionalBasicType(left, map: right)
	}
}

// MARK:- Raw Representable types

/// Object of Raw Representable type
public func <- <T: RawRepresentable>(left: inout T, right: Map) {
	left <- (right, EnumTransform())
}

/// Optional Object of Raw Representable type
public func <- <T: RawRepresentable>(left: inout T?, right: Map) {
	left <- (right, EnumTransform())
}

/// Implicitly Unwrapped Optional Object of Raw Representable type
public func <- <T: RawRepresentable>(left: inout T!, right: Map) {
	left <- (right, EnumTransform())
}

// MARK:- Arrays of Raw Representable type

/// Array of Raw Representable object
public func <- <T: RawRepresentable>(left: inout [T], right: Map) {
	left <- (right, EnumTransform())
}

/// Array of Raw Representable object
public func <- <T: RawRepresentable>(left: inout [T]?, right: Map) {
	left <- (right, EnumTransform())
}

/// Array of Raw Representable object
public func <- <T: RawRepresentable>(left: inout [T]!, right: Map) {
	left <- (right, EnumTransform())
}

// MARK:- Dictionaries of Raw Representable type

/// Dictionary of Raw Representable object
public func <- <T: RawRepresentable>(left: inout [String: T], right: Map) {
	left <- (right, EnumTransform())
}

/// Dictionary of Raw Representable object
public func <- <T: RawRepresentable>(left: inout [String: T]?, right: Map) {
	left <- (right, EnumTransform())
}

/// Dictionary of Raw Representable object
public func <- <T: RawRepresentable>(left: inout [String: T]!, right: Map) {
	left <- (right, EnumTransform())
}

// MARK:- Transforms

/// Object of Basic type with Transform
public func <- <T, Transform: TransformType where Transform.Object == T>(left: inout T, right: (Map, Transform)) {
    if right.0.mappingType == MappingType.fromJSON {
        let value: T? = right.1.transformFromJSON(right.0.currentValue)
        FromJSON.basicType(&left, object: value)
    } else {
        let value: Transform.JSON? = right.1.transformToJSON(left)
		ToJSON.optionalBasicType(value, map: right.0)
    }
}

/// Optional object of basic type with Transform
public func <- <T, Transform: TransformType where Transform.Object == T>(left: inout T?, right: (Map, Transform)) {
    if right.0.mappingType == MappingType.fromJSON {
        let value: T? = right.1.transformFromJSON(right.0.currentValue)
        FromJSON.optionalBasicType(&left, object: value)
    } else {
        let value: Transform.JSON? = right.1.transformToJSON(left)
        ToJSON.optionalBasicType(value, map: right.0)
    }
}

/// Implicitly unwrapped optional object of basic type with Transform
public func <- <T, Transform: TransformType where Transform.Object == T>(left: inout T!, right: (Map, Transform)) {
	if right.0.mappingType == MappingType.fromJSON {
		let value: T? = right.1.transformFromJSON(right.0.currentValue)
		FromJSON.optionalBasicType(&left, object: value)
	} else {
		let value: Transform.JSON? = right.1.transformToJSON(left)
		ToJSON.optionalBasicType(value, map: right.0)
	}
}

/// Array of Basic type with Transform
public func <- <T: TransformType>(left: inout [T.Object], right: (Map, T)) {
	let (map, transform) = right
	if map.mappingType == MappingType.fromJSON {
		let values = fromJSONArrayWithTransform(map.currentValue, transform: transform)
		FromJSON.basicType(&left, object: values)
	} else {
		let values = toJSONArrayWithTransform(left, transform: transform)
		ToJSON.optionalBasicType(values, map: map)
	}
}

/// Optional array of Basic type with Transform
public func <- <T: TransformType>(left: inout [T.Object]?, right: (Map, T)) {
	let (map, transform) = right
	if map.mappingType == MappingType.fromJSON {
		let values = fromJSONArrayWithTransform(map.currentValue, transform: transform)
		FromJSON.optionalBasicType(&left, object: values)
	} else {
		let values = toJSONArrayWithTransform(left, transform: transform)
		ToJSON.optionalBasicType(values, map: map)
	}
}

/// Implicitly unwrapped optional array of Basic type with Transform
public func <- <T: TransformType>(left: inout [T.Object]!, right: (Map, T)) {
	let (map, transform) = right
	if map.mappingType == MappingType.fromJSON {
		let values = fromJSONArrayWithTransform(map.currentValue, transform: transform)
		FromJSON.optionalBasicType(&left, object: values)
	} else {
		let values = toJSONArrayWithTransform(left, transform: transform)
		ToJSON.optionalBasicType(values, map: map)
	}
}

/// Dictionary of Basic type with Transform
public func <- <T: TransformType>(left: inout [String: T.Object], right: (Map, T)) {
	let (map, transform) = right
	if map.mappingType == MappingType.fromJSON {
		let values = fromJSONDictionaryWithTransform(map.currentValue, transform: transform)
		FromJSON.basicType(&left, object: values)
	} else {
		let values = toJSONDictionaryWithTransform(left, transform: transform)
		ToJSON.optionalBasicType(values, map: map)
	}
}

/// Optional dictionary of Basic type with Transform
public func <- <T: TransformType>(left: inout [String: T.Object]?, right: (Map, T)) {
	let (map, transform) = right
	if map.mappingType == MappingType.fromJSON {
		let values = fromJSONDictionaryWithTransform(map.currentValue, transform: transform)
		FromJSON.optionalBasicType(&left, object: values)
	} else {
		let values = toJSONDictionaryWithTransform(left, transform: transform)
		ToJSON.optionalBasicType(values, map: map)
	}
}

/// Implicitly unwrapped optional dictionary of Basic type with Transform
public func <- <T: TransformType>(left: inout [String: T.Object]!, right: (Map, T)) {
	let (map, transform) = right
	if map.mappingType == MappingType.fromJSON {
		let values = fromJSONDictionaryWithTransform(map.currentValue, transform: transform)
		FromJSON.optionalBasicType(&left, object: values)
	} else {
		let values = toJSONDictionaryWithTransform(left, transform: transform)
		ToJSON.optionalBasicType(values, map: map)
	}
}

private func fromJSONArrayWithTransform<T: TransformType>(_ input: AnyObject?, transform: T) -> [T.Object] {
	if let values = input as? [AnyObject] {
		return values.flatMap { value in
			return transform.transformFromJSON(value)
		}
	} else {
		return []
	}
}

private func fromJSONDictionaryWithTransform<T: TransformType>(_ input: AnyObject?, transform: T) -> [String: T.Object] {
	if let values = input as? [String: AnyObject] {
		return values.filterMap { value in
			return transform.transformFromJSON(value)
		}
	} else {
		return [:]
	}
}

private func toJSONArrayWithTransform<T: TransformType>(_ input: [T.Object]?, transform: T) -> [T.JSON]? {
	return input?.flatMap { value in
		return transform.transformToJSON(value)
	}
}

private func toJSONDictionaryWithTransform<T: TransformType>(_ input: [String: T.Object]?, transform: T) -> [String: T.JSON]? {
	return input?.filterMap { value in
		return transform.transformToJSON(value)
	}
}

// MARK:- Mappable Objects - <T: Mappable>

/// Object conforming to Mappable
public func <- <T: Mappable>(left: inout T, right: Map) {
    if right.mappingType == MappingType.fromJSON {
        FromJSON.object(&left, object: right.currentValue)
    } else {
		ToJSON.object(left, map: right)
    }
}

/// Optional Mappable objects
public func <- <T: Mappable>(left: inout T?, right: Map) {
    if right.mappingType == MappingType.fromJSON {
        FromJSON.optionalObject(&left, object: right.currentValue)
    } else {
		ToJSON.optionalObject(left, map: right)
    }
}

/// Implicitly unwrapped optional Mappable objects
public func <- <T: Mappable>(left: inout T!, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON.optionalObject(&left, object: right.currentValue)
	} else {
		ToJSON.optionalObject(left, map: right)
	}
}

// MARK:- Dictionary of Mappable objects - Dictionary<String, T: Mappable>

/// Dictionary of Mappable objects <String, T: Mappable>
public func <- <T: Mappable>(left: inout Dictionary<String, T>, right: Map) {
    if right.mappingType == MappingType.fromJSON {
        FromJSON.objectDictionary(&left, object: right.currentValue)
    } else {
        ToJSON.objectDictionary(left, map: right)
    }
}

/// Optional Dictionary of Mappable object <String, T: Mappable>
public func <- <T: Mappable>(left: inout Dictionary<String, T>?, right: Map) {
    if right.mappingType == MappingType.fromJSON {
        FromJSON.optionalObjectDictionary(&left, object: right.currentValue)
    } else {
        ToJSON.optionalObjectDictionary(left, map: right)
    }
}

/// Implicitly unwrapped Optional Dictionary of Mappable object <String, T: Mappable>
public func <- <T: Mappable>(left: inout Dictionary<String, T>!, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON.optionalObjectDictionary(&left, object: right.currentValue)
	} else {
		ToJSON.optionalObjectDictionary(left, map: right)
	}
}

/// Dictionary of Mappable objects <String, T: Mappable>
public func <- <T: Mappable>(left: inout Dictionary<String, [T]>, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON.objectDictionaryOfArrays(&left, object: right.currentValue)
	} else {
		ToJSON.objectDictionaryOfArrays(left, map: right)
	}
}

/// Optional Dictionary of Mappable object <String, T: Mappable>
public func <- <T: Mappable>(left: inout Dictionary<String, [T]>?, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON.optionalObjectDictionaryOfArrays(&left, object: right.currentValue)
	} else {
		ToJSON.optionalObjectDictionaryOfArrays(left, map: right)
	}
}

/// Implicitly unwrapped Optional Dictionary of Mappable object <String, T: Mappable>
public func <- <T: Mappable>(left: inout Dictionary<String, [T]>!, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON.optionalObjectDictionaryOfArrays(&left, object: right.currentValue)
	} else {
		ToJSON.optionalObjectDictionaryOfArrays(left, map: right)
	}
}

// MARK:- Array of Mappable objects - Array<T: Mappable>

/// Array of Mappable objects
public func <- <T: Mappable>(left: inout Array<T>, right: Map) {
    if right.mappingType == MappingType.fromJSON {
        FromJSON.objectArray(&left, object: right.currentValue)
    } else {
		ToJSON.objectArray(left, map: right)
    }
}

/// Optional array of Mappable objects
public func <- <T: Mappable>(left: inout Array<T>?, right: Map) {
    if right.mappingType == MappingType.fromJSON {
        FromJSON.optionalObjectArray(&left, object: right.currentValue)
    } else {
		ToJSON.optionalObjectArray(left, map: right)
    }
}

/// Implicitly unwrapped Optional array of Mappable objects
public func <- <T: Mappable>(left: inout Array<T>!, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON.optionalObjectArray(&left, object: right.currentValue)
	} else {
		ToJSON.optionalObjectArray(left, map: right)
	}
}

// MARK:- Array of Array of Mappable objects - Array<Array<T: Mappable>>

/// Array of Array Mappable objects
public func <- <T: Mappable>(left: inout Array<Array<T>>, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON.twoDimensionalObjectArray(&left, object: right.currentValue)
	} else {
		ToJSON.twoDimensionalObjectArray(left, map: right)
	}
}

/// Optional array of Mappable objects
public func <- <T: Mappable>(left:inout Array<Array<T>>?, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON.optionalTwoDimensionalObjectArray(&left, object: right.currentValue)
	} else {
		ToJSON.optionalTwoDimensionalObjectArray(left, map: right)
	}
}

/// Implicitly unwrapped Optional array of Mappable objects
public func <- <T: Mappable>(left: inout Array<Array<T>>!, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON.optionalTwoDimensionalObjectArray(&left, object: right.currentValue)
	} else {
		ToJSON.optionalTwoDimensionalObjectArray(left, map: right)
	}
}

// MARK:- Set of Mappable objects - Set<T: Mappable where T: Hashable>

/// Array of Mappable objects
public func <- <T: Mappable where T: Hashable>(left: inout Set<T>, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON.objectSet(&left, object: right.currentValue)
	} else {
		ToJSON.objectSet(left, map: right)
	}
}


/// Optional array of Mappable objects
public func <- <T: Mappable where T: Hashable>(left: inout Set<T>?, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON.optionalObjectSet(&left, object: right.currentValue)
	} else {
		ToJSON.optionalObjectSet(left, map: right)
	}
}

/// Implicitly unwrapped Optional array of Mappable objects
public func <- <T: Mappable where T: Hashable>(left: inout Set<T>!, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON.optionalObjectSet(&left, object: right.currentValue)
	} else {
		ToJSON.optionalObjectSet(left, map: right)
	}
}
