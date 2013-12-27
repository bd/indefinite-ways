
Template.Project.events
	'click .remove-project': (e, t) ->
		project = t.data._id
		Projects.update project, {$set: {published: false}}
