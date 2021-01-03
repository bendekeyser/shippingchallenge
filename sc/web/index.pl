use strict;
use warnings;
use Tie::File;
use MongoDB;   


# connect to specific host and port
my $client = MongoDB::MongoClient->new(
    host => '192.168.56.5',
    port => 2717,
    username => 'ben',
    password => 'test');
my $db = $client->get_database("databank");
my $users = $db->get_collection("gebruikers");
my $all = $users->find();
my $var = $all->next;
my $naam = "Naam: ". $var->{name} . "\n";

open (HTML,">","./index.html") || die $!;

#-----Building HTML file---------------------------
print HTML "<!DOCTYPE html>
<html>
        <head>
        <title>Shippingchallenge</title>
        </head>
   <body>
<h1>Perl script!</h1>
$naam

</body>
</html>";


close (HTML);
