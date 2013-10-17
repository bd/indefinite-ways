# sessionLib.coffee

@toggleSessionVar = (name) -> Session.set name , not Session.get name