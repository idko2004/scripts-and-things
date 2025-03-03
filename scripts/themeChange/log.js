const fs = require('fs');

let whoIsRunning = '';

let logs = '';

function setup(who)
{
	whoIsRunning = who;
	logs += `${who}: ${new Date().toString()}\n`;
}

function newLine(log)
{
	if(whoIsRunning === undefined) return;

	if(typeof log === 'object') log = JSON.stringify(log, null, 4);

	logs += '\n' + log;
	console.log(log);
}

async function finish()
{
	if(whoIsRunning === undefined) return;

	const path = `/home/idko/.config/awesome/themeChange/logs/log-${whoIsRunning}.txt`;

	await fs.promises.writeFile(path, logs);
}

module.exports =
{
	setup,
	newLine,
	finish
}