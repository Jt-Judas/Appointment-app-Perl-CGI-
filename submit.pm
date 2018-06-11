#!C:\Perl64\bin\perl5.26.1.exe

package Submit;
use lib 'C:\Users\Judas\Workspace\Appointments';
use strict;
use warnings;
use Appointment;
use CGI;
my $cgi = CGI->new;
use AppointmentsDB; 

my $date = $cgi->param('date');
my $time = $cgi->param('time');
my $descr = $cgi->param('description');

my $appointment = new Appointment($date,$time,$descr);
AppointmentsDB::insertAppointment($appointment);
print $cgi->header('application/json;charset=UTF-8');

1;