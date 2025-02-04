#!/usr/bin/osascript -l JavaScript

const terminal = Application("Terminal");

const skipKeys = {
	content: true,
	history: true,

	closeable: true,
	zoomed: true,
	pcls: true,
	name: true,
	miniaturizable: true,
	miniaturized: true,
	resizable: true,
	zoomable: true,

	contents: true,
	history: true
};

function toObj(path, objIn) {
	const objInType = typeof objIn;

	if('function' == objInType) {
		const value = objIn();
		const valueType = typeof value;
		// console.log('objInType:', path, objInType, valueType);
		return value;
	}

	if('object' == objInType) {
		if(Array.isArray(objIn)) {
			// console.log('objInType:', path, objInType, 'Array');
			return objIn.map((e, i) => toObj(path.concat(i), e));
		}

		// console.log('objInType:', path, objInType);

		const objOut = {};
		for(let key in objIn) {
			if(skipKeys[key]) {
				continue;
			}
			objOut[key] = toObj(path.concat(key), objIn[key]);
		}
		return objOut;
	}

	// console.log('objInType:', path, objInType);
	return objIn;
}

function windowInfo() {
	const windows = terminal.windows();
	let frontWindowGroupId = null;
	const winGroups = {};
	for(let winId in windows) {
		const win	  = windows[winId];
		const winPath  = ['win', winId];
		const winProps = toObj(winPath, win.properties());
		// console.log(winPath, JSON.stringify(winProps, null, 2));
	
		const winOrigin = winProps.origin;
		const key = [winOrigin.x,winOrigin.y].join(":");
	
		if(winProps.frontmost) {
			frontWindowGroupId = key;
		}

		let winGroup = winGroups[key];
		if(!winGroup) {
			winGroup = [];
			winGroups[key] = winGroup;
		}
		winGroup.push({ win, winPath, winProps, winOrigin });
		// console.log(winPath, key, JSON.stringify(winOrigin, null, 2));

		/*
		for(let tabId in win.tabs) {
			const tab = win.tabs[tabId];
			const tabPath = winPath.concat(['tabs', tabId]);
			const tabProps = toObj(tabPath, tab.properties());
			console.log(tabPath, JSON.stringify(tabProps, null, 2));
		}
		*/
	}

	return {
		frontWindowGroupId,
		groups: winGroups
	};
}

function isFrontWindow() {
	const winInfo = windowInfo();
	const frontWindowGroup = winInfo.groups[winInfo.frontWindowGroupId];
	// console.log(JSON.stringify(frontWindowGroup, null, 2));
	if(frontWindowGroup.length == 1) {
		return 'true';
	}
	return 'false';
}

isFrontWindow();

