package Parse::Yavi;

use 5.008001;
use utf8;
use strict;
use warnings;
use Carp qw/croak cluck/;
use Parse::Yavi::EBNF;

our $VERSION = "0.01";

sub new
{
    my $class= shift;

    bless {
        infile => undef,
        outfile => undef,
        @_
    }, $class;
}

sub parse
{
    my $self= shift;
    my ($input)= @_;

    my $ebnf= Parse::Yavi::EBNF->new;

    $ebnf->input(join "\n", <$input>);

    $ebnf->YYParse(yydebug => 0x00);
}

# in = {
#   tokens => [],
#   rules => [],
# }
sub generate
{
    use Data::Dumper;
    my $self= shift;
    my ($rules)= @_;

    croak "Illegal rules type " . ref $rules unless ref $rules eq 'ARRAY';

    my %rules= $self->_build($rules);
    for my $rule (keys %rules)
    {
        print <<"...";
function! s:$rule() dict
...
        for my $alt (@{$rules{$rule}})
        {
            print <<"...";
    if s:lookahead('@{[$self->_compute_first_set($alt)]}')
...
            for my $elm (@$alt)
            {
                if($elm->{kind} eq 'string')
                {
                    print <<"...";
        call s:match('@{[$elm->{value}]}')
...
                }
                elsif($elm->{kind} eq 'regex')
                {
                    print <<"...";
        call s:match('@{[$elm->{value}]}')
...
                }
                elsif($elm->{kind} eq 'element')
                {
                    print <<"...";
        call s:match('@{[$elm->{value}]}')
...
                }
                elsif($elm->{kind} eq 'reference')
                {
                    print <<"...";
        call s:@{[$elm->{value}]}
...
                }
                else
                {
                    die "Unknown kind " . $elm->{kind};
                }
            }
            print <<"...";
    endif
...
        }
        print <<"...";
    throw "Unknown"
endfunction
...
    }
}

sub _build
{
    my $self= shift;
    my ($rules)= @_;

    my %rules;
    for my $rule (@$rules)
    {
        $rules{$rule->{rulename}}= $rule->{alternatives};
    }
    %rules;
}

sub _compute_first_set
{
    my $self= shift;
    return 'FIRST';
}

1;
__END__

=encoding utf-8

=head1 NAME

Parse::Yavi - It's new $module

=head1 SYNOPSIS

    use Parse::Yavi;

=head1 DESCRIPTION

Parse::Yavi is ...

=head1 LICENSE

Copyright (C) kamichidu.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

kamichidu E<lt>c.kamunagi@gmail.comE<gt>

=cut

