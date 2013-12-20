# sessionLib.coffee

@toggleSessionVar = (name) -> 
	console.log name + ' is currently ' + Session.get name
	console.log 'toggling session variable: ' + name
	Session.set name , not Session.get name
	console.log name + 'is currently ' + Session.get name