$(document).ready(function() {
    bindClickHandlers()
})

const bindClickHandlers = () => {
 $('.all_jobs').on('click', (e) => {
     e.preventDefault()
     history.pushState(null, null, "jobs")
     //alert('i was clicked')
     fetch(`/jobs.json`)
     .then((response) => response.json())
     .then(jobs => {
        $('#app-container').html('')
        jobs.forEach(job => {    //or jobs.forEach(function(job) {
            let newJob = new Job(job)
            let jobHtml = newJob.formatIndex()
            $(`#app-container`).append(jobHtml)
            console.log(newJob)
        })
     })
        
    })
}

function Job(job) {
    this.id = job.id
    this.title = job.title
    this.salary = job.salary
    this.category = job.category
    this.company_name = job.company_name
    this.company_id = job.company_id 
    this.location = job.location
    this.created_at = job.created_at
}

Job.prototype.formatIndex = function() {
    let jobHtml = `
    <a href="/jobs/${this.id}"><h3>${this.title}</h3></a> |
    ${this.company_name} |
    ${this.location} |
    "Date Posted:"${this.created_at}`
    return jobHtml
}