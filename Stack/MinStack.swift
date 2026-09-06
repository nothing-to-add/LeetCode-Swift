/**
 * Question Link: https://leetcode.com/problems/min-stack/
 * Primary idea: Use a helper stack to save minimum values. Push a value onto
 *               it only when it is less than or equal to the current minimum,
 *               and remove it when the corresponding value is popped.
 * Time Complexity: O(1) for every operation because stack appends, removals,
 *                  and reads from the end take constant time.
 * Space Complexity: O(n) because the main stack and helper stacks can each
 *                   retain up to one entry per pushed value.
 */

class MinStack {
    private var stack: [Int]
    private var minStack: [Int]
    private let defaultReturn: Int = -100

    init() {
        stack = []
        minStack = []
    }
    
    func push(_ value: Int) {
        stack.append(value)

        if minStack.isEmpty || value <= minStack.last! {
            minStack.append(value)
        }
    }
    
    func pop() {
        guard let last = stack.last else {
            return
        }

        stack.removeLast()

        if let minLast = minStack.last, last == minLast {
            minStack.removeLast()
        }
    }
    
    func top() -> Int {
        return stack.last ?? defaultReturn
    }
    
    func getMin() -> Int {
        return minStack.last ?? defaultReturn
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(value)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */