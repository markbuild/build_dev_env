const { argv } = require('process');
const lines = process.argv.slice(2)[0].split('\n');

const excelRows = lines
  .filter(line => line.includes(','))
  .map(line => line.replace(/,(\s)/g, '\t'));

console.log(excelRows.join('\n'))
