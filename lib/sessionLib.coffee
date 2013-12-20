# sessionLib.coffee

@toggleSessionVar = (name) -> 
	Session.set name , not Session.get name

@toggleSessionSpecific = (name, value) ->
	 console.log 'set '+name+' to '+value
	 if not Session.get name
		 Session.set name, value
	 else
		 Session.set name, false	