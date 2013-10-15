Template.Page.rendered = () ->
	$('body').on 'keyup', keyHandler LOGIN_PATTERN

keyHandler = (keylist) ->
	handler keylist, keylist 

handler = (keylist, resetKeylist) ->
	(event) -> 
		console.log event.keyCode
		console.log keylist.length
		if keylist.length <= 1
			console.log 'login handled!'
			Session.set 'showLogin', true
		else if _.first(keylist) == event.keyCode
			overwriteLoginHandler handler _.rest(keylist), resetKeylist
			Meteor.setTimeout () -> 
				console.log 'reset!'
				overwriteLoginHandler keyHandler resetKeylist 
			, 5000
		else 
			overwriteLoginHandler keyHandler resetKeylist		


overwriteLoginHandler = (handler) ->
	overwriteHandler 'body', 'keyup', handler

LOGIN_PATTERN = [BACKSLASH, L, O, G, I, N]
