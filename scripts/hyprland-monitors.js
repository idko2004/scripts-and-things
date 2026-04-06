const { exec } = require("child_process");

let config =
{
	"HDMI-A-1":
	{
		width: 1920,
		height: 1080,
		refreshRate: 180,
		scale: 1,
		positionLeft: 0,
		positionTop: 770
	},
	"HDMI-A-2":
	{
		width: 1360,
		height: 768,
		refreshRate: 60,
		scale: 1,
		positionLeft: 0,
		positionTop: 0
	}
}

function getMonitorsJson()
{
	return new Promise(function(good, bad)
	{
		try
		{
			exec(`hyprctl monitors all -j`, function(error, stdout, stderr)
			{
				if(error)
				{
					console.error(`error: ${error.message}`);
					exec(`notify-send "ERROR CHANGING MONITORS (obtaining devices)" "${error.message}"`);
					//bad();
					good([]);
					return;
				}

				if (stderr)
				{
					console.error(`stderr: ${stderr}`);
					exec(`notify-send "ERROR CHANGING MONITORS (obtaining devices)" "${stderr}"`);
					//bad();
					good([]);
					return;
				}

				let json = JSON.parse(stdout);
				good(json);
			});
		}
		catch(error)
		{
			bad(error);
		}
	})
}

function setMonitor(monitorName, enable, options)
{
	return new Promise(function(good, bad)
	{
		try
		{
			console.log(monitorName, enable);
			if(enable)
			{
				if(!options)
				{
					bad("Se está tratando de encender un monitor pero no tiene una configuración asociada.");
					return;
				}

				exec(`hyprctl keyword monitor "${monitorName}, ${options.width}x${options.height}@${options.refreshRate}, ${options.positionLeft}x${options.positionTop}, ${options.scale}"`, function(error, stderr, stdout)
				{
					if(error)
					{
						console.error(`error: ${error.message}`);
						exec(`notify-send -u low "CHANGING MONITORS (${monitorName}: ON)" "${stderr}"`);
						//bad();
						good();
						return;
					}

					if (stderr)
					{
						console.error(`stderr: ${stderr}`);
						exec(`notify-send -u low "CHANGING MONITORS (${monitorName}: ON)" "${stderr}"`);
						//bad();
						good();
						return;
					}

					console.log(stdout);
					good();
				});
			}
			else
			{
				exec(`hyprctl keyword monitor "${monitorName}, disable"`, function(error, stderr, stdout)
				{
					if(error)
					{
						console.error(`error: ${error.message}`);
						exec(`notify-send -u low "CHANGING MONITORS (${monitorName}: OFF)" "${stderr}"`);
						//bad();
						good();
						return;
					}

					if (stderr)
					{
						console.error(`stderr: ${stderr}`);
						exec(`notify-send -u low "CHANGING MONITORS (${monitorName}: OFF)" "${stderr}"`);
						//bad();
						good();
						return;
					}

					console.log(stdout);
					good();
				});
			}
		}
		catch(error)
		{
			bad(error);
		}
	});
}

async function setOnlyMonitor(index, monitors)
{
	console.log('setOnlyMonitor', index);
	let monitorToTurnOn;
	for(let i = 0; i < monitors.length; i++)
	{
		let monitorName = monitors[i]['name'];
		if(i === index)
		{
			let options = config[monitorName];
			if(options === undefined) throw new Error('No se encuentra el monitor en la configuración');

			options.positionLeft = 0;
			options.positionTop = 0;

			await setMonitor(monitorName, true, options);
			continue;
		}
		await setMonitor(monitorName, false, undefined);
	}
}

async function enableAllMonitors(monitors)
{
	console.log('enableAllMonitors');
	//Disable all monitors first
	for(let i = 0; i < monitors.length; i++)
	{
		
		let monitorName = monitors[i]['name'];
		await setMonitor(monitorName, false);
	}

	//Reenable them again
	for(let i = 0; i < monitors.length; i++)
	{
		let monitorName = monitors[i]['name'];
		let options = config[monitorName];
		if(options === undefined) throw new Error('No se encuentra el monitor en la configuración');
		await setMonitor(monitorName, true, options);
	}
}

async function main()
{
	let monitors = await getMonitorsJson();

	let monitorsEnabled = [];
	for(let i = 0; i < monitors.length; i++)
	{
		monitorsEnabled.push(!monitors[i]['disabled']);
	}

	console.log(monitorsEnabled);

	//Check if all are true, if all are true, we should select only the first monitor now
	let allEnabled = true;
	for(let i = 0; i < monitorsEnabled.length; i++)
	{
		if(!monitorsEnabled[i]) allEnabled = false;
	}

	if(allEnabled)
	{
		setOnlyMonitor(0, monitors);
		return;
	}

	//Get the current monitor and toggle the next.
	for(let i = 0; i < monitorsEnabled.length; i++)
	{
		if(monitorsEnabled[i]) //Is this monitor enabled?
		{
			//If it is, disable it and enable the next
			let indexToEnable = i+1;
			
			//If it's the last, enable all monitors.
			if(indexToEnable >= monitorsEnabled.length)
			{
				await enableAllMonitors(monitors);
				return;
			}

			await setOnlyMonitor(indexToEnable, monitors);
			return;
		}
	}
}

main();
