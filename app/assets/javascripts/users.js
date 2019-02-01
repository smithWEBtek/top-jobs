$(function () {
	console.log('users.js loaded ...');
	getUsers()
})

function getUsers() {
	$('a#all-users-link').on('click', function (e) {
		e.preventDefault()

		$.ajax({
			url: 'http://localhost:3000/users.json',
			method: 'get',
			dataType: 'json'
		}).done(function (response) {

			console.log("response: ", response);
		})
	})
}