$(function() {
  
   $('#btnSubmit').click(function(){
       submitForm();
       getAppointments();
       location.reload();
    });
   
   getAppointments();
   
});

function submitForm(){
 var date = $('#date').val();
 var time = $('#time').val();
 var description = $('#description').val();
 var submit_url = "Submit.pm";
 var data = {date,time,description};
 
 $.ajax({
     type: 'POST',
     data:data,
     url: submit_url,
     success: function(response){
      console.log(response);
     }
   });
}

function getAppointments(){
  var get_url = "AppointmentsService.pm";

   $.ajax({
     type: 'GET',
     url: get_url,
     success: function(response){
       var json_string = JSON.parse(JSON.stringify(response));
       loadData(json_string);
     },
     error: function(error) {
        console.log(error);
    }
   });
}

function loadData(appointments){
	
 $('#tblAppointments').html(`
        <h1>Registered Appointments</h1>
        <hr>
        <table >
        <tr><th style="border:1px solid black;width:150px;">Date</th><th style="border:1px solid black;width:150px;">Time</th><th style="border:1px solid black;width:150px;">Description</th></tr>
          ${appointments.map(function(appt){
           return `<tr><td style="border:1px solid black;width:150px;">${appt.DATE}</td><td style="border:1px solid black;width:150px;">${appt.TIME}</td><td style="border:1px solid black;width:150px;">${appt.DESCRIPTION}</td></tr>`;
           })}
        </table>
    `);
}




