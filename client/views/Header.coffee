Template.Header.events
	'click .alert': () ->
		Session.set 'alerts', null

	'click #consultingLink': () ->
		Session.set "showConsulting" , true
		Session.set "showAbout", false

	'click #aboutLink': () ->
		Session.set "showAbout", true
		Session.set "showConsulting", false

	'click #projectsLink': () ->
		Session.set "showProjects", true
		Session.set "showAbout", false
		Session.set "showConsulting", false

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


