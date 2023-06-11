import Foundation

/**
 875 - Koko Eating Bananas - Medium
 
 Koko loves to eat bananas. There are `n` piles of bananas, the `ith` pile has `piles[i]` bananas. The guards have gone and will come back in h hours.

 Koko can decide her bananas-per-hour eating speed of `k`. Each hour, she chooses some pile of bananas and eats `k` bananas from that pile. If the pile has less than `k` bananas, she eats all of them instead and will not eat any more bananas during this hour.

 Koko likes to eat slowly but still wants to finish eating all the bananas before the guards return.

 Return the minimum integer `k` such that she can eat all the bananas within `h` hours.
 
 #### Constraints
 - `1 <= piles.length <= 10^4`
 - `piles.length <= h <= 10^9`
 - `1 <= piles[i] <= 10^9`
*/
public struct Solution_0875 {
    /**
     Runtime:    `O(n log m)`
     Space:      `O(1)`
     
     > `n` is # piles, `m` is max element in pile
    
     applys binary search.
     
     the `eatingSpeed` is computed in each iteration as middle of pointers
     total time for Koko to eat all `piles` at this speed is calculated.
     
     adjustments to speed are made based on `totalTime` and `H`
     - if `totalTime > H` then ran out of time, need to eat faster
     - else need to eat slower
     
     once `left >= right` we are at minimum speed, so return `left`
    */
    public static func minEatingSpeed(_ piles: [Int], _ H: Int) -> Int {
        var left = 1
        var right = piles.max()!

        while left < right {
            let eatingSpeed = left + (right - left) / 2

            var totalTime = 0
            for pile in piles {
                let timeTakenForPile = ceil(Double(pile) / Double(eatingSpeed))
                totalTime += Int(timeTakenForPile)
            }

            if totalTime > H {
                left = eatingSpeed + 1
            } else {
                right = eatingSpeed
            }
        }

        return left
    }
}
