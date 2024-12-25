console.log('Cambiando tema de vscodium');

const filepath = '/home/idko/.var/app/com.vscodium.codium/config/VSCodium/User/settings.json';

const darkTheme = 'Bluloco Dark Italic';
const lightTheme = 'Solarized Light';

const fs = require('fs');
const log = require('./log');

const changeTo = process.env.CHANGE_THEME_TO;

log.setup('vscodium');

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
	if(changeTo === 'dark')
	{
		theme = darkTheme;
	}
	else
	{
		theme = lightTheme;
	}


	const file = await fs.promises.readFile(filepath, 'utf-8');
	log.newLine(`\n---input:${file}`);

	const config = JSON.parse(file);

	config['workbench.colorTheme'] = theme;
	
	const result = JSON.stringify(config, null, 4);
	log.newLine(`\n---output:${result}`);

	await fs.promises.writeFile(filepath, result);
	log.newLine('archivo guardado');
	await log.finish();
}
