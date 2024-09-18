const fs = require("fs");
const OUTPUT = "OUTPUT";

fs.writeFileSync(OUTPUT, "", "utf8");
console.log = new Proxy(console.log, {
  apply: function (target, thisArg, argumentsList) {
    target.apply(thisArg, argumentsList);

    const logMessage =
      argumentsList.map((e) => JSON.stringify(e, null, 2)).join(" ") + "\n";
    fs.appendFileSync(OUTPUT, logMessage, "utf8");
    return true;
  },
});
/*------------------------------------*/

function solution(params) {
  return params;
}

/*------------------------------------*/
const cases = [["param"]];

for (const idx in cases) {
  console.log(`<<case : ${parseInt(idx) + 1}>>`);
  console.log(solution(...cases[idx]));
}