package Appointment;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $self = {
        date => shift,
        time  => shift,
        description  => shift,
    };
    
    bless $self, $class;
    return $self;
}

sub setDate {
    my ( $self, $date ) = @_;
    $self->{date} = $date if defined($date);
    return $self->{date};
}

sub getDate {
    my( $self ) = @_;
    return $self->{date};
}

sub setTime {
    my ( $self, $time ) = @_;
    $self->{time} = $time if defined($time);
    return $self->{time};
}

sub getTime {
    my( $self ) = @_;
    return $self->{time};
}

sub setDescription {
    my ( $self, $description ) = @_;
    $self->{description} = $description if defined($description);
    return $self->{description};
}

sub getDescription {
    my( $self ) = @_;
    return $self->{description};
}

1;



