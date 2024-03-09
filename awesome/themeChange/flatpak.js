console.log('Cambiando tema de flatpak');

const darkTheme = 'Yaru-dark'; /*Jasper-Dark-Nord';*/
const lightTheme = 'Yaru'; /*'Jasper-Light-Nord';*/
const darkIcons = 'Colloid-dark';
const lightIcons = 'Colloid-light';

const log = require('./log');

const changeTo = process.env.CHANGE_THEME_TO;

log.setup('flatpak');

const { exec } = require("child_process");

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

	const commandTheme = `flatpak override --user --env GTK_THEME=${theme}`;
	
	const commandIcons = `flatpak override --user --env ICON_THEME=${icons}`;

	log.newLine(`ejecutando: ${commandTheme}`);
	await exec(commandTheme, function(error, stdout, stderr)
	{
		if (error) {
			log.newLine(`error: ${error.message}`);
			return;
		}
		if (stderr) {
			log.newLine(`stderr: ${stderr}`);
			return;
		}
		log.newLine(`stdout: ${stdout}`);
	});

	log.newLine(`ejecutando: ${commandIcons}`);
	await exec(commandIcons, function(error, stdout, stderr)
	{
		if (error) {
			log.newLine(`error: ${error.message}`);
			return;
		}
		if (stderr) {
			log.newLine(`stderr: ${stderr}`);
			return;
		}
		log.newLine(`stdout: ${stdout}`);
	});

	await log.finish();
}