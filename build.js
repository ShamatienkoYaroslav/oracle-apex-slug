const fs = require('fs-extra');
const charmap = require('./src/charmap');
const config = require('./config');

const mode = process.argv[2] || 'dev';

const configParams = config[mode];

const changeParams = (str, search, replacement) => {
  return str.replace(new RegExp(search, 'g'), replacement);
}

let chars = '';
let index = 1;
for (let key in charmap) {
  const value = charmap[key];

  if (key === '$') {
    key = `N'$$'`;
  } else if (key === '‘') {
    key = `N"‘"`;
  } else if (key === '’') {
    key = `N"’"`;
  } else {
    key = `N'${key}'`;
  }

  const rec =`\r\n            v_chars(${index}).CYRILLIC_SYMBOL := ${key};\r\n            v_chars(${index}).LATIN_SYMBOLS := '${value}';\r\n`;
  chars = chars + rec;
  index++;
}

let template = fs.readFileSync('./src/template.txt').toString();
template = changeParams(template, '{{chars}}', chars);
template = changeParams(template, '{{pkg_name}}', configParams.package.name);

fs.outputFileSync(`./dist/slug${mode === 'dev' ? '_dev' : ''}.sql`, template);