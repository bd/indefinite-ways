#General Functions for DOM manipulation

# Replaces (all) event handlers of a given type on a given element with a new handler
@overwriteHandler = (selector, eventType, handler) ->
	$(selector).unbind eventType
	$(selector).on eventType, handler

# TODO: componentize properly--
# extract result method to parameters
@keyHandler = (keylist) ->
	handler keylist, keylist 

handler = (keylist, resetKeylist) ->
	(event) -> 
		if keylist.length <= 1
			Session.set 'showLogin', not Session.get 'showLogin'
		else if _.first(keylist) == event.keyCode
			overwriteLoginHandler handler _.rest(keylist), resetKeylist
			Meteor.setTimeout () -> 
				overwriteLoginHandler keyHandler resetKeylist 
			, 5000
		else 
			overwriteLoginHandler keyHandler resetKeylist		


overwriteLoginHandler = (handler) ->
	overwriteHandler 'body', 'keyup', handler



#Constants
@BACKSLASH = 220
@G = 71
@I = 73
@L = 76
@N = 78
@O = 79