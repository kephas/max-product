# Problem statement
You are given an integer array nums and an integer m.

Return the maximum product of the first and last elements of any subsequence of nums of size m.

A subsequence is a collection that can be obtained from the original sequence nums through 
deletion.

## Example 1:

- Input: nums = [-1,-9,2,3,-2,-3,1], m = 1
- Output: 81
- Explanation: The subsequence [-9] has the largest product of the first and last elements: -9 * -9 = 81. Therefore, the answer is 81.

## Example 2:

- Input: nums = [1,3,-5,5,6,-4], m = 3
- Output: 20
- Explanation: The subsequence [-5, 6, -4] has the largest product of the first and last elements.

## Example 3:

- Input: nums = [2,-1,2,-6,5,2,-5,7], m = 2
- Output: 35
- Explanation: The subsequence [5, 7] has the largest product of the first and last elements.

# Solution

`maxProd` is a naive implementation. It runs in quadratic time to the size of the list.

`maxProdFast` is an optimized implementation. It runs in linear time by pre-computing at each place in the list what the biggest positive and negative number is between there and the end of the list.

You can run a benchmark of the two functions with the following command:

```
$ hpack && cabal run bench -- --output bench.html
```
