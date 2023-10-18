console.log('Cambiando tema de gtk4');

const filepath = '/home/idko/.config/gtk-4.0/settings.ini';

const ini = require('ini');
const fs = require('fs');
const log = require('./log');

const changeTo = process.env.CHANGE_THEME_TO;

log.setup('gtk4');

main();

async function main()
{
	if(!['dark', 'light'].includes(changeTo))
	{
		log.newLine(`${changeTo} no es un tema válido`);
		return;
	}
	log.newLine(`cambiando a tema ${changeTo}`);

	const file = await fs.promises.readFile(filepath, 'utf-8');
	log.newLine(`\n---input:${file}`);

	iniObj = ini.parse(file);

	let preferDark;
	if(changeTo === 'light') preferDark = false;
	else preferDark = true;

	iniObj.Settings['gtk-application-prefer-dark-theme'] = preferDark;
	
	const result = ini.stringify(iniObj);
	log.newLine(`\n---output:${result}`);

	await fs.promises.writeFile(filepath, result);
	log.newLine('archivo guardado');
	await log.finish();
}