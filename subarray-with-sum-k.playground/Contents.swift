import UIKit
import XCTest

class SubArraySum {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var i = 0
        var dict = [Int: Int]()
        dict[0] = 1
        var totalSubarrays = 0
        var currentSum = 0
        while i < nums.count {
            currentSum = currentSum + nums[i]
            if let frequency = dict[currentSum - k] {
                totalSubarrays = totalSubarrays + frequency
            }
            if let value = dict[currentSum] {
                dict[currentSum] = value + 1
            } else {
                dict[currentSum] = 1
            }
            i = i + 1
        }
        return totalSubarrays
    }
}


let array = [3,9,2,4,1,-7,2,6,-5,8,-3,-7,6,2,1]
let array1 = [2,4,6,8,3,7,9,12]
let result = SubArraySum().subarraySum(array1, 6)
print(result)

class SubArraySumTests: XCTestCase {
    func testPositiveTestCase() {
        let result = SubArraySum().subarraySum(array1, 6)
        XCTAssertTrue(result == 2)
    }

    func testNegativeTestCase() {
        let result = SubArraySum().subarraySum(array1, 5)
        XCTAssertFalse(result != 0 )
    }
}

SubArraySumTests.defaultTestSuite.run()
