console.log('Cambiando tema de alacritty');

const filepath = '/home/idko/.config/alacritty/alacritty.toml';

const darkTheme = '/home/idko/.config/alacritty/alacritty-dark.toml';
const lightTheme = '/home/idko/.config/alacritty/alacritty-light.toml';

const fs = require('fs');
const log = require('./log');

const changeTo = process.env.CHANGE_THEME_TO;

log.setup('alacritty');

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


	const file = await fs.promises.readFile(theme, 'utf-8');
	log.newLine(`\n---input:${file}`);

	await fs.promises.writeFile(filepath, file);
	log.newLine('archivo guardado');
	await log.finish();
}
