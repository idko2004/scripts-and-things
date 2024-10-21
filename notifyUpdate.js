const fs = require('fs');
const { exec } = require("child_process");

const filePath = `${getHome()}/.config/last-updated`;

async function main()
{
	try
	{
		//Leer la fecha de un archivo
		const datefile = await fs.promises.readFile(filePath);

		const date = new Date(datefile);

		const now = new Date();

		const delta = new Date(now.getTime() - date.getTime());
		const deltaDays = delta.getDate();

		if(deltaDays >= 10)
		{
			await exec(`notify-send "Time to update software" "${deltaDays} days since last time"`);
		}
		else console.log(`No need to update yet, ${deltaDays} days.`);
	}
	catch(err)
	{
		await exec(`notify-send "notifyUpdate.js crashed! D:" "${err}"`);
	}
}

function getHome()
{
	return process.env.HOME;
}

main();
