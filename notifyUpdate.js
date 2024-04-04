const fs = require('fs');
const { exec } = require("child_process");

const filePath = "/home/idko/.config/last-updated";

async function main()
{
	try
	{
		//Leer la fecha de un archivo
		const datefile = await fs.promises.readFile(filePath);

		const date = new Date(datefile);

		const now = new Date();

		const creationOfUniverse = new Date(0);

		//Ver si la fecha es mayor a una semana
		creationOfUniverse.setDate(8); //Una semana desde la creación del universo

		const oneWeekFromLastUpdated = date.getTime() + creationOfUniverse.getTime();

		if(oneWeekFromLastUpdated >= now.getTime())
		{
			const delta = new Date(now.getTime() - oneWeekFromLastUpdated);
			const deltaDays = delta.getDate();
			await exec(`notify-send "Time to update software" "${deltaDays} days since last time"`);
		}
		else console.log('No need to update yet');
	}
	catch(err)
	{
		await exec(`notify-send "notifyUpdate.js crashed! D:" "${err}"`);
	}
}

main();
