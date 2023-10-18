console.log('Cambiando tema de micro');

const filepath = '/home/idko/.config/micro/settings.json';

const darkTheme = 'railscast';
const lightTheme = 'bubblegum';

const fs = require('fs');
const log = require('./log');

const changeTo = process.env.CHANGE_THEME_TO;

log.setup('micro');

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

	config['colorscheme'] = theme;
	
	const result = JSON.stringify(config, null, 4);
	log.newLine(`\n---output:${result}`);

	await fs.promises.writeFile(filepath, result);
	log.newLine('archivo guardado');
	await log.finish();
}