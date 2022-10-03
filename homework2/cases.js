
const factorial = (n) => {
    
    if (n == 1){
        return 1;
    }
    else if (n == 0){
        return 0;
    }
    else {
        return n * factorial(n - 1);
    }

};

const permutation = (n, r) => {
    
    return factorial(n) / factorial(n - r);

};

const multiPermutation = (n, r) => {

    return n**r;
};

const combination = (n, r) => {

    return permutation(n, r) / factorial(r);

};

const multiCombination = (n, r) => {

    return combination(n + r - 1, r);

};

module.exports = {
    permutation,
    combination,
    multiPermutation,
    multiCombination
};