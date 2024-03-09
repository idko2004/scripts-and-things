console.log('Cambiando tema de gtk3');

const filepath = '/home/idko/.config/gtk-3.0/settings.ini';

const darkTheme = 'Yaru-dark'
const lightTheme = 'Yaru';
const darkIcons = 'Colloid-dark';
const lightIcons = 'Colloid-light';

const ini = require('ini');
const fs = require('fs');
const log = require('./log');

const changeTo = process.env.CHANGE_THEME_TO;

log.setup('gtk3');

main();

async function main()
{
	if(!['dark', 'light'].includes(changeTo))
	{
		log.newLine(`${changeTo} no es un tema válido`);
		return;
	}
	log.newLine(`cambiando a tema ${changeTo}`);

	let theme;
	let icons;
	if(changeTo === 'dark')
	{
		theme = darkTheme;
		icons = darkIcons;
	}
	else
	{
		theme = lightTheme;
		icons = lightIcons;
	}


	const file = await fs.promises.readFile(filepath, 'utf-8');
	log.newLine(`\n---input:${file}`);

	iniObj = ini.parse(file);

	iniObj.Settings['gtk-theme-name'] = theme;
	iniObj.Settings['gtk-icon-theme-name'] = icons;
	
	const result = ini.stringify(iniObj);
	log.newLine(`\n---output:${result}`);

	await fs.promises.writeFile(filepath, result);
	log.newLine('archivo guardado');
	await log.finish();
}
