Template.Header.events
	'click .alert': () ->
		Session.set 'alerts', null

Template.Header.helpers
	ways: () ->
		Random.choice ['In Definite Ways',
		 'Indefinite Ways',
		 'indefinite ways',
		 'in definite ways',
		 'indefiniteways',
		 ]

	showLogin: () ->
		Session.get 'showLogin' 


Template.Header.rendered = () ->
	$('body').on 'keyup', keyHandler LOGIN_PATTERN

LOGIN_PATTERN = [BACKSLASH, L, O, G, I, N]


