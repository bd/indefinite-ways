#General Functions for DOM manipulation

# Replaces (all) event handlers of a given type on a given element with a new handler
@overwriteHandler = (selector, eventType, handler) ->
	$(selector).unbind eventType
	$(selector).on eventType, handler

#Constants
@BACKSLASH = 220
@G = 71
@I = 73
@L = 76
@N = 78
@O = 79