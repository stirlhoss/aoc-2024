let fs = require("node:fs");

input = fs.readFileSync("./input.txt", "utf-8").split("\n");

let inputSplit = input.map((e) => e.split("   "));

let left = [];
let right = [];

inputSplit.forEach((e) => {
  if (e[0] === "") {
    return;
  } else {
    left.push(parseInt(e[0]));
    right.push(parseInt(e[1]));
  }
});

left.map((e) => {
  if (e === NaN) console.log(e);
});

let sorted_left = left.sort();
let sorted_right = right.sort();
let total = 0;
let index = 0;

while (index < sorted_left.length) {
  total += Math.abs(sorted_left[index] - sorted_right[index]);
  console.log(total);
  index++;
}

console.log(total);
