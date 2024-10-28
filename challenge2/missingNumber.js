

function missingNumber(arr) {
    const n = arr.length; 

    // sum from 1 to n+1
    const sumArr = (n + 1) * (n + 2) / 2; 

    // Sum of the actual numbers in the arr
    const actualSum = arr.reduce((sum, num) => sum + num, 0); 

    // return => missing number in arr
    return sumArr - actualSum; 
}

// Example usage:
const arr = [3, 7, 1, 2, 6, 4]; 
const result = missingNumber(arr)
console.log(result); 
