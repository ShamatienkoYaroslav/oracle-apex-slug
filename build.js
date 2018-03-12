const fs = require('fs-extra');
const charmap = require('./src/charmap');
const config = require('./config');

const mode = process.argv[2] || 'dev';

const configParams = config[mode];

const changeParams = (str, search, replacement) => {
  return str.replace(new RegExp(search, 'g'), replacement);
}

let head = fs.readFileSync('./src/head.txt').toString();
head = changeParams(head, '{{table_name}}', configParams.table.name);
head = changeParams(head, '{{table_constraint_name}}', configParams.table.constraintName);
head = changeParams(head, '{{pkg_name}}', configParams.package.name);

let footer = fs.readFileSync('./src/footer.txt').toString();
footer = changeParams(footer, '{{table_name}}', configParams.table.name);
footer = changeParams(footer, '{{pkg_name}}', configParams.package.name);

let items = '';
for (let key in charmap) {
  const value = charmap[key];

  const item = `INSERT INTO ${configParams.table.name} VALUES(N'${key}', '${value}');/\r\n`;
  items = items + item;
}

fs.outputFileSync(`./dist/slug${mode === 'dev' ? '_dev' : ''}.sql`, head + '\r\n' + items + footer);