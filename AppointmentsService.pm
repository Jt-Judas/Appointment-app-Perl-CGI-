#!C:\Perl64\bin\perl5.26.1.exe

package AppointmentsService;

#use lib 'C:\Users\Judas\Workspace\Appointments';
use lib 'C:\wamp\www\appointment';
use strict;
use warnings;
use Appointment;
use CGI;
my $cgi = CGI->new;
use AppointmentsDB;

my $json_appointments = AppointmentsDB::loadAppointments();
print $cgi->header('application/json;charset=UTF-8');
print $json_appointments;

1;

