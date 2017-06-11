//
//  PredicateBuilder.swift
//  PredicateBuilder
//
//  Created by Muronaka Hiroaki on 2017/06/11.
//  Copyright © 2017年 Muronaka Hiroaki. All rights reserved.
//

import Foundation

public typealias pred = PredicateBuilder

public class PredicateBuilder {

    public enum NSNumberType {
        case intValue, uintValue, floatValue,
        doubleValue, int8Value, decimalValue,
        int32Value, int64Value, int16Value,
        uint8Value, uint32Value, uint64Value
        
        func toValue(num: NSNumber) -> Any {
            switch(self) {
            case .intValue:
                return num.intValue
            case .int8Value:
                return num.int8Value
            case .int16Value:
                return num.int16Value
            case .int32Value:
                return num.int32Value
            case .int64Value:
                return num.int64Value
            case .uintValue:
                return num.uintValue
            case .uint8Value:
                return num.uint8Value
            case .uint32Value:
                return num.uint32Value
            case .uint64Value:
                return num.uint64Value
            case .decimalValue:
                return num.decimalValue
            case .floatValue:
                return num.floatValue
            case .doubleValue:
                return num.doubleValue
            }
            
        }
    }
    
    public enum StringOptions: String, CustomStringConvertible {
        case none = "", c = "c", d = "d", cd = "cd"
        
        public var description: String {
            switch self {
            case .none:
                return ""
            default:
                return "[\(self.rawValue)]"
            }
        }
    }
    
    public let aggrigate: String?
    public let src:String
    
    public init(src:String, aggrigate: String? = nil) {
        self.src = src
        self.aggrigate = aggrigate
    }
    
    public func eq(_ value: Any) -> NSPredicate {
        return build("==", value:value)
    }
    
    public func less(_ value: Any) -> NSPredicate {
        return build("<", value:value)
    }
    
    public func lessThanEquals(_ value: Any) -> NSPredicate {
        return build("<=", value:value)
    }
    
    public func greaterThanEquals(_ value: Any) -> NSPredicate {
        return build(">=", value:value)
    }
    
    public func greater(_ value: Any) -> NSPredicate {
        return build(">", value:value)
    }
    
    public func notEq(_ value: Any) -> NSPredicate {
        return build("!=", value:value)
    }
    
    public func `in`(_ value: Any) -> NSPredicate {
        return build("IN", value: value)
    }
    
    public func contains(_ value: Any) -> NSPredicate {
        return build("CONTAINS", value: value)
    }
    
    public func between(begin: Any, end: Any) -> NSPredicate {
        return between([begin, end])
    }
    public func between(_ value: [Any]) -> NSPredicate {
        return build("BETWEEN", value: value)
    }
    
    public func beginsWith(_ value: Any, options: StringOptions = .none) -> NSPredicate {
        return build("BEGINSWITH", value: value, options: options)
    }
    
    public func endsWith(_ value: Any, options: StringOptions = .none) -> NSPredicate {
        return build("ENDSWITH", value: value, options: options)
    }
    
    public func like(_ value: Any, options: StringOptions = .none) -> NSPredicate {
        return build("LIKE", value: value, options: options)
    }
    
    public func MATCHS(_ value: Any, options: StringOptions = .none) -> NSPredicate {
        return build("MATCHS", value: value, options: options)
    }
    
   
    private func build(_ ope:String, value: Any, options: StringOptions) -> NSPredicate {
        return build("\(ope)\(options)", value: value)
    }
    
    private func build(_ ope:String, value: Any) -> NSPredicate {
        let expression = NSExpression(forConstantValue: value)
        return NSPredicate(format: "\(aggrigate ?? "") \(src) \(ope) %@", expression)
    }
     
    public func avg(_ type: NSNumberType) -> PredicateBuilder {
        return aggirigateVariable(valName: "avg", type: type)
    }
    
    public func min(_ type: NSNumberType) -> PredicateBuilder {
        return aggirigateVariable(valName: "min", type: type)
    }
    
    public func max(_ type: NSNumberType) -> PredicateBuilder {
        return aggirigateVariable(valName: "max", type: type)
    }
    
    public func count(_ type: NSNumberType) -> PredicateBuilder {
        return aggirigateVariable(valName: "count", type: type)
    }
    
    
    private func aggirigateVariable(valName: String, type: NSNumberType) -> PredicateBuilder {
        return PredicateBuilder(src: "\(src).@\(valName).\(type)")
    }
    
     
    public static func any(_ src: String) -> PredicateBuilder {
        return PredicateBuilder(src: src, aggrigate: "ANY")
    }
    public static func all(_ src: String) -> PredicateBuilder {
        return PredicateBuilder(src: src, aggrigate: "ALL")
    }
    
    public static func none(_ src: String) -> PredicateBuilder {
        return PredicateBuilder(src: src, aggrigate: "NONE")
    }
    
    public static func some(_ src: String) -> PredicateBuilder {
        return PredicateBuilder(src: src, aggrigate: "SOME")
    }
}


public func &&(lhs: NSPredicate, rhs: NSPredicate) -> NSPredicate {
    let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [lhs, rhs])
    return predicate
}

public func &&(lhs: NSPredicate, rhs:[NSPredicate]) -> NSPredicate {
    var array = [lhs]
    array.append(contentsOf: rhs)
    let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: array)
    return predicate
}

public prefix func !(predicate: NSPredicate) -> NSPredicate {
    return NSCompoundPredicate(notPredicateWithSubpredicate: predicate)
}

public func ==(lhs: PredicateBuilder, rhs: Any) -> NSPredicate {
    return lhs.eq(rhs)
}

public func !=(lhs: PredicateBuilder, rhs: Any) -> NSPredicate {
    return lhs.notEq(rhs)
}


public func <(lhs: PredicateBuilder, rhs: Any) -> NSPredicate {
    return lhs.less(rhs)
}

public func <=(lhs: PredicateBuilder, rhs: Any) -> NSPredicate {
    return lhs.lessThanEquals(rhs)
}

public func >(lhs: PredicateBuilder, rhs: Any) -> NSPredicate {
    return lhs.greater(rhs)
}

public func >=(lhs: PredicateBuilder, rhs: Any) -> NSPredicate {
    return lhs.greaterThanEquals(rhs)
}

