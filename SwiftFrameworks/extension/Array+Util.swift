//
//  Array+Utils.swift
//
//  Created by bujiandi(慧趣小歪) on 14/10/4.
//

import Foundation

//extension DictionaryLiteral {
//    // 用指定分隔符 连接 数组元素 为 字符串
//    public func componentsJoinedByString(separator:String, includeElement:(Generator.Element) -> String) -> String {
//        var result:String = ""
//        for item:Generator.Element in self {
//            if !result.isEmpty { result += separator }
//            result += includeElement(item)
//        }
//        return result
//    }
//}
extension CollectionType {
    
    // 用指定分隔符 连接 数组元素 为 字符串
//    public func componentsJoinedByString(separator:String, includeElement:(Generator.Element) -> String = { "\($0)" }) -> String {
//        var result:String = ""
//        for item:Self.Generator.Element in self {
//            if !result.isEmpty { result += separator }
//            result += includeElement(item)
//        }
//        return result
//    }
    
    public func set<T:Hashable>(@noescape includeElement:(Generator.Element) -> T) -> Set<T> {
        var set = Set<T>()
        for item:Self.Generator.Element in self {
            set.insert(includeElement(item))
        }
        return set
    }
    
    public func joined(separator separator:String, includeElement:(Generator.Element) -> String = { "\($0)" }) -> String {
        var result:String = ""
        for item:Self.Generator.Element in self {
            if !result.isEmpty { result += separator }
            result += includeElement(item)
        }
        return result
    }
    
    // 利用闭包功能 给数组添加 查找首个符合条件元素 的 方法
    public func find(includeElement: (Self.Generator.Element) -> Bool) -> Self.Generator.Element? {
        for item in self where includeElement(item) {
            return item
        }
        return nil
    }
    
    
}
/*
extension Array {
    
    // 过滤符合条件的数组元素
    public func filter(includeElement: (Element) -> Bool) -> [Element] {
        var items:[Element] = []
        for item in self where includeElement(item) {
            items.append(item)
        }
        return items
    }
    
    // 利用闭包功能 给数组添加 查找首个符合条件元素下标 的 方法
    public func indexOf(includeElement: (Element) -> Bool) -> Int {
        for var i:Int = 0; i<count; i++ {
            if includeElement(self[i]) {
                return i
            }
        }
        return NSNotFound
    }
//    // 利用闭包功能 给数组添加 包涵方法
//    public func contains(includeElement: (Element) -> Bool) -> Bool {
//        for item in self where includeElement(item) {
//            return true
//        }
//        return false
//    }
    

}
*/