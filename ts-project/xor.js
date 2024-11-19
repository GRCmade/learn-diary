function solution(cards) {
    var uniqueNumber = 0;
    for (var _i = 0, cards_1 = cards; _i < cards_1.length; _i++) {
        var card = cards_1[_i];
        console.log(uniqueNumber, card);
        uniqueNumber ^= card;
    }
    return uniqueNumber;
}
function main() {
    // Add your test cases here
    console.log(solution([1, 1, 2, 2, 3, 3, 4, 5, 5]) === 4);
    console.log(solution([0, 1, 0, 1, 2]) === 2);
}
main();
