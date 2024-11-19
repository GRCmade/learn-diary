
// 左闭右闭的二分查找
function searchLeftClosedRightClosed(nums: number[], target: number): number {
    let l: number = 0;
    let r: number = nums.length - 1;

    while (l <= r) {
        let mid: number = Math.floor((l + r) / 2);
        if (nums[mid] === target) {
            return mid;
        } else if (nums[mid] < target) {
            l = mid + 1;
        } else {
            r = mid - 1;
        }
    }

    return -1;
}

// 左闭右开的二分查找
function searchLeftClosedRightOpen(nums: number[], target: number): number {
    let l: number = 0;
    let r: number = nums.length;

    while (l < r) {
        let mid: number = Math.floor((l + r) / 2);
        if (nums[mid] === target) {
            return mid;
        } else if (nums[mid] < target) {
            l = mid + 1;
        } else {
            r = mid;
        }
    }

    return -1;
}


console.log(searchLeftClosedRightClosed([1, 2, 3, 4, 5], 3)); // 输出: 2
console.log(searchLeftClosedRightClosed([1, 2, 3, 4, 5], 1)); // 输出: 0
console.log(searchLeftClosedRightClosed([1, 2, 3, 4, 5], 5)); // 输出: 4
console.log(searchLeftClosedRightClosed([1, 2, 3, 4, 5], 0)); // 输出: -1
console.log(searchLeftClosedRightClosed([1, 2, 3, 4, 5], 6)); // 输出: -1

console.log(searchLeftClosedRightOpen([1, 2, 3, 4, 5], 3)); // 输出: 2
console.log(searchLeftClosedRightOpen([1, 2, 3, 4, 5], 1)); // 输出: 0
console.log(searchLeftClosedRightOpen([1, 2, 3, 4, 5], 5)); // 输出: 4
console.log(searchLeftClosedRightOpen([1, 2, 3, 4, 5], 0)); // 输出: -1
console.log(searchLeftClosedRightOpen([1, 2, 3, 4, 5], 6)); // 输出: -1

