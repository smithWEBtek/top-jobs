$(document).ready(function() {
    bindClickHandlers()
})

const bindClickHandlers = () => {
 $('.all_jobs').on('click', (e) => {
     e.preventDefault()
     //alert('i was clicked')
     fetch(`/jobs.json`)
     .then((res) => res.json())
     .then(data => console.log(data))
        
    })
}