const { exec } = require("child_process");

main();

async function main()
{
	await exec("pactl -f json list sinks short", async function(error, stdout, stderr)
	{
		if (error)
		{
			console.error(`error: ${error.message}`);
			exec(`notify-send "ERROR CHANGING AUDIO DEVICE" "${error.message}"`);
			return;
		}
		if (stderr)
		{
			console.error(`stderr: ${stderr}`);
			exec(`notify-send "ERROR CHANGING AUDIO DEVICE" "${stderr}"`);
			return;
		}
		const sinks = parseListSinks(stdout);
		const defaultSink = await getDefaultSink();
		const sinkIndex = sinks.indexOf(defaultSink);
		console.log({sinkIndex});

		let newSinkIndex = sinkIndex + 1;
		if(newSinkIndex >= sinks.length) newSinkIndex = 0;

		let newSink = sinks[newSinkIndex];
		if(newSink === undefined)
		{
			console.error("SINK IS UNDEFINED");
			exec(`notify-send "ERROR CHANGING AUDIO DEVICE" "SINK IS UNDEFINED"`);
			return;
		}

		await exec(`pactl set-default-sink ${newSink}`, (error, stdout, stderr) =>
		{
			let notificationTitle = "Audio device changed";
			let notificationBody =  "Audio is now on ";

			let sinkNameSplit = newSink.split(".");
			let lastPartSinkName = sinkNameSplit[sinkNameSplit.length - 1];

			notificationBody += lastPartSinkName;

			if(error) notificationBody += `\n${error}`;
			if(stdout) notificationBody += `\n${stdout}`;
			if(stderr) notificationBody += `\n${stderr}`;

			exec(`notify-send "${notificationTitle}" "${notificationBody}"`);
		});
	});

}

function parseListSinks(listSinksOutput)
{
	console.log(listSinksOutput);

	try
	{
		sinks = JSON.parse(listSinksOutput);
		console.log(sinks);

		let sinksNames = [];
		for(let i = 0; i < sinks.length; i++)
		{
			sinksNames.push(sinks[i].name);
		}

		console.log({sinksNames});
		return sinksNames;
	}
	catch(err)
	{
		console.error(err);
		exec(`notify-send "ERROR CHANGING AUDIO DEVICE" "${err}"`);
	}
}

function getDefaultSink()
{
	return new Promise(async (resolve, reject) =>
	{
		await exec("pactl get-default-sink", (error, stdout, stderr) =>
		{
			if (error)
			{
				console.error(`error: ${error.message}`);
				exec(`notify-send "ERROR CHANGING AUDIO DEVICE" "${error.message}"`);
				reject();
				return;
			}
			if (stderr)
			{
				console.error(`stderr: ${stderr}`);
				exec(`notify-send "ERROR CHANGING AUDIO DEVICE" "${stderr}"`);
				reject();
				return;
			}
			console.log({'default sink': stdout.trim()});
			resolve(stdout.trim());
		});
	});
}
