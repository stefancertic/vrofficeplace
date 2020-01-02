use strict;
use warnings;
use MIME::Base64;
use HTTP::Request::Common qw(POST);
use LWP::UserAgent;

# Uncomment if you are running on Mac OSX Sierra 
$ENV{'PERL_LWP_SSL_VERIFY_HOSTNAME'} = 0;

# Get Your username at https://www.vrofficeplace.com/image-api/
# or directly via https://www.vrofficeplace.com/admin/register.php
# Each account comes with free test credits.

my $username = 'Your Username';
my $password = 'Your Password';


open (my $image1, 'image1.jpg') or die "$!";
binmode $image1;
my $raw_string1 = do{ local $/ = undef; <$image1>; };
my $encoded1 = encode_base64( $raw_string1 );


open (my $image2, 'image2.jpg') or die "$!";
binmode $image2;
my $raw_string2 = do{ local $/ = undef; <$image2>; };
my $encoded2 = encode_base64( $raw_string2 );

#print $encoded1 . "\n";
#print $encoded2 . "\n";

my $ua = LWP::UserAgent->new;

my $req = POST 'https://vrofficeplace.com/admin/api/faceapi.php',
                [ username => $username, password => $password, image1 => $encoded1, image2 => $encoded2 ];

print $ua->request($req)->as_string;
