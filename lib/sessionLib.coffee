# sessionLib.coffee

@toggleSessionVar = (name) -> 
	# console.log 'toggling session variable: ' + name
	Session.set name , not Session.get name