import common
/**
 **[Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists)** - Hard
 
 You are given an array of k linked-lists lists, each linked-list is sorted in 
 ascending order.

 Merge all the linked-lists into one sorted linked-list and return it.
 
 #### Constraints
 - `k == lists.length`
 - `0 <= k <= 10^4`
 - `0 <= lists[i].length <= 500`
 - `-10^4 <= lists[i][j] <= 10^4`
 - `lists[i]` is sorted in **ascending order.**
 - The sum of `lists[i].length` will not exceed `10^4`.
 
*/
public struct Solution_0023 {

    /**
     Runtime:    `O(n log k)`
     Space:      `O(k)`
     
     > `n` # nodes, `k` # lists
    
     divide and conquer to improve on `O(nk)` approach of merging one by one
     
     use `O(n)` merge two sorted lists from ``Solution_0021`` to merge in pairs,
     halving number of lists each time
     
     `log k` iterations until merged into single list
    */
    public static func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 1 else { return lists.first ?? nil }
        
        var remainingLists = lists
        while remainingLists.count > 1 {
            var merged: [ListNode?] = []
            
            for i in stride(from: 0, to: remainingLists.count, by: 2) {
                let list1 = remainingLists[i]
                let list2 = i+1 < remainingLists.count ? remainingLists[i+1] : nil
                
                // use the O(n) mergeTwoLists from leetcode #21
                merged.append(Solution_0021.mergeTwoLists(list1, list2))
            }

            // halving each time by pairing
            // total log k steps until k -> k/2 -> ... 1
            remainingLists = merged
        }

        // single remaining list will be head of all merged lists
        return remainingLists[0]
    }
}
