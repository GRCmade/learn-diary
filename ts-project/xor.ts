function solution(cards: number[]): number {
  let uniqueNumber = 0;
  for (let card of cards) {
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