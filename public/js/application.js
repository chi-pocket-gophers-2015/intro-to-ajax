$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $("#new-link").click(function(event) {
  	event.preventDefault();

  	var request = $.ajax({
  		url: 'contacts/new'
  	});

  	request.success(function(response){
  		$('main').append(response);
  	});

  	$(this).hide();
  });

  // $('form').submit(function(){});
  $('body').on('submit', 'form', function(event) {
  	event.preventDefault();

  	var request = $.ajax({
  		url: 'contacts',
  		method: 'POST',
  		data: $(this).serialize()
  	});

  	request.done(function(response){
  		$('tbody').append(response);
  	});

  });
});