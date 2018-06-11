#!C:\Perl64\bin\perl5.26.1.exe

package AppointmentsDB;

use DBI;
use strict;
use JSON;

# define database name and driver
my $driver   = "SQLite";
my $db_name = "appointments.db";
my $dbd = "DBI:$driver:dbname=$db_name";
 
my $username = "";
my $password = "";
 
# create and connect to a appointments database.
my $dbh = DBI->connect($dbd, $username, $password, { RaiseError => 1 })
                      or die $DBI::errstr;

# create appointments table
my $stmt = qq(CREATE TABLE IF NOT EXISTS APPOINTMENT
             (ID INTEGER PRIMARY KEY     AUTOINCREMENT,
              DATE        TEXT    NOT NULL,
              TIME        TEXT    NOT NULL,
              DESCRIPTION TEXT   NOT NULL);
	      );
	      
my $ret = $dbh->do($stmt);

#check if the table is created successfully
if($ret < 0) {
   print STDERR $DBI::errstr;
} else {
   print STDERR "Table created successfully\n";
}
 
# define a subroutine to insert an appointment into the table 
 sub insertAppointment{
    my ($appointment) = @_;
    my $date = $appointment->getDate();
    my $time = $appointment->getTime();
    my $description = $appointment->getDescription();
   
     $dbh = DBI->connect($dbd, $username, $password, { RaiseError => 1 })
                      or die $DBI::errstr;
                      
    $stmt = $dbh->prepare('INSERT INTO APPOINTMENT(DATE,TIME,DESCRIPTION) VALUES (?, ?, ?)');
    $stmt->execute($date, $time, $description);
    $dbh->disconnect();
 }

# define a subroutine to select all the appointments from the appointments table
sub loadAppointments{
   $dbh = DBI->connect($dbd, $username, $password, { RaiseError => 1 })
                      or die $DBI::errstr;
   
   $stmt = qq(SELECT * from APPOINTMENT;);
   my $obj = $dbh->prepare($stmt);
   $ret = $obj->execute() or die $DBI::errstr;
   my @appointments;
   while (my $row = $obj->fetchrow_hashref) {
      push @appointments, $row;
   }
   
   my $json_str = encode_json(\@appointments);
   $dbh->disconnect();
   return $json_str;
}

# quit the database
$dbh->disconnect();
print STDERR "Exit the database\n";

1;