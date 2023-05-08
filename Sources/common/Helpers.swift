import Foundation

/**
    Returns a set of unique elements from the input array, regardless of their order.

    - Parameter arr: The input array of type `T` that conforms to `Hashable`.
    - Returns: A set of unique elements from the input array.
 */
public func setOfUniqueElementsAnyOrder<T: Hashable>(_ arr: [T]) -> Set<T> {
    return Set(arr)
}

/**
    Returns a set of unique sets of elements from the input array of arrays, regardless of their order.

    - Parameter arr: The input array of arrays of type `T` that conforms to `Hashable`.
    - Returns: A set of unique sets of elements from the input array.
*/
public func setOfUniqueElementSetsAnyOrder<T: Hashable>(_ arr: [[T]]) -> Set<Set<T>> {
    let innerSets = arr.map { Set($0) }
    return Set(innerSets)
}
