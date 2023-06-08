import Foundation

/**
 875 - Koko Eating Bananas - Medium
 
 `n` is # piles, `m` is max element in pile
*/
public struct Solution_0875 {
    /**
     Runtime:    `O(n log m)`
     Space:      `O(1)`
    
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
