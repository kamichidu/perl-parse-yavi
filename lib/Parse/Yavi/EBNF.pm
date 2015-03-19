########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.182.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'lib\Parse\Yavi\EBNF.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package Parse::Yavi::EBNF;
use strict;

push @Parse::Yavi::EBNF::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }

#line 1 "lib\Parse\Yavi\EBNF.eyp"

use strict;
use warnings;


# Default lexical analyzer
our $LEX = sub {
    my $self = shift;
    my $pos;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(\:|\?|\;|\+|\||\(|\*|\))}gc and return ($1, $1);

      /\G('(?:[^']|\\')*'|"(?:[^"]|\\")*")/gc and return ('StringLiteral', $1);
      /\G(qr(.)(?:[^\2]|\\\2)*?\2)/gc and return ('Regex', $1);
      /\G([a-zA-Z_][a-zA-Z0-9_]*)/gc and return ('Identifier', $1);


      return ('', undef) if ($_ eq '') || (defined(pos($_)) && (pos($_) >= length($_)));
      /\G\s*(\S+)/;
      my $near = substr($1,0,10); 

      return($near, $near);

     # die( "Error inside the lexical analyzer near '". $near
     #     ."'. Line: ".$self->line()
     #     .". File: '".$self->YYFilename()."'. No match found.\n");
    }
  }
;


#line 68 lib\Parse\Yavi\EBNF.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@Parse::Yavi::EBNF::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.182',
    yyGRAMMAR  =>
[#[productionNameAndLabel => lhs, [ rhs], bypass]]
  [ '_SUPERSTART' => '$start', [ 'yavi', '$end' ], 0 ],
  [ 'yavi_1' => 'yavi', [ 'ebnf' ], 0 ],
  [ 'ebnf_2' => 'ebnf', [ 'rulelist' ], 0 ],
  [ '_STAR_LIST' => 'STAR-1', [ 'STAR-1', 'rule' ], 0 ],
  [ '_STAR_LIST' => 'STAR-1', [  ], 0 ],
  [ 'rulelist_5' => 'rulelist', [ 'STAR-1' ], 0 ],
  [ 'rule_6' => 'rule', [ 'id', ':', 'alternatives', ';' ], 0 ],
  [ '_PAREN' => 'PAREN-2', [ '|', 'alternative' ], 0 ],
  [ '_STAR_LIST' => 'STAR-3', [ 'STAR-3', 'PAREN-2' ], 0 ],
  [ '_STAR_LIST' => 'STAR-3', [  ], 0 ],
  [ 'alternatives_10' => 'alternatives', [ 'alternative', 'STAR-3' ], 0 ],
  [ '_STAR_LIST' => 'STAR-4', [ 'STAR-4', 'element' ], 0 ],
  [ '_STAR_LIST' => 'STAR-4', [  ], 0 ],
  [ 'alternative_13' => 'alternative', [ 'STAR-4' ], 0 ],
  [ 'element_14' => 'element', [ 'optional' ], 0 ],
  [ 'element_15' => 'element', [ 'zero_or_more' ], 0 ],
  [ 'element_16' => 'element', [ 'one_or_more' ], 0 ],
  [ 'element_17' => 'element', [ 'text' ], 0 ],
  [ 'element_18' => 'element', [ 'id' ], 0 ],
  [ 'element_19' => 'element', [ '(', 'alternatives', ')' ], 0 ],
  [ 'optional_20' => 'optional', [ 'element', '?' ], 0 ],
  [ 'zero_or_more_21' => 'zero_or_more', [ 'element', '*' ], 0 ],
  [ 'one_or_more_22' => 'one_or_more', [ 'element', '+' ], 0 ],
  [ 'text_23' => 'text', [ 'StringLiteral' ], 0 ],
  [ 'text_24' => 'text', [ 'Regex' ], 0 ],
  [ 'id_25' => 'id', [ 'Identifier' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'yavi_1' => 1,
  'ebnf_2' => 2,
  '_STAR_LIST' => 3,
  '_STAR_LIST' => 4,
  'rulelist_5' => 5,
  'rule_6' => 6,
  '_PAREN' => 7,
  '_STAR_LIST' => 8,
  '_STAR_LIST' => 9,
  'alternatives_10' => 10,
  '_STAR_LIST' => 11,
  '_STAR_LIST' => 12,
  'alternative_13' => 13,
  'element_14' => 14,
  'element_15' => 15,
  'element_16' => 16,
  'element_17' => 17,
  'element_18' => 18,
  'element_19' => 19,
  'optional_20' => 20,
  'zero_or_more_21' => 21,
  'one_or_more_22' => 22,
  'text_23' => 23,
  'text_24' => 24,
  'id_25' => 25,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'(' => { ISSEMANTIC => 0 },
	')' => { ISSEMANTIC => 0 },
	'*' => { ISSEMANTIC => 0 },
	'+' => { ISSEMANTIC => 0 },
	':' => { ISSEMANTIC => 0 },
	';' => { ISSEMANTIC => 0 },
	'?' => { ISSEMANTIC => 0 },
	'|' => { ISSEMANTIC => 0 },
	Identifier => { ISSEMANTIC => 1 },
	Regex => { ISSEMANTIC => 1 },
	StringLiteral => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'lib\Parse\Yavi\EBNF.eyp',
    yystates =>
[
	{#State 0
		DEFAULT => -4,
		GOTOS => {
			'ebnf' => 1,
			'STAR-1' => 2,
			'yavi' => 3,
			'rulelist' => 4
		}
	},
	{#State 1
		DEFAULT => -1
	},
	{#State 2
		ACTIONS => {
			'' => -5,
			'Identifier' => 5
		},
		GOTOS => {
			'rule' => 7,
			'id' => 6
		}
	},
	{#State 3
		ACTIONS => {
			'' => 8
		}
	},
	{#State 4
		DEFAULT => -2
	},
	{#State 5
		DEFAULT => -25
	},
	{#State 6
		ACTIONS => {
			":" => 9
		}
	},
	{#State 7
		DEFAULT => -3
	},
	{#State 8
		DEFAULT => 0
	},
	{#State 9
		DEFAULT => -12,
		GOTOS => {
			'alternatives' => 10,
			'alternative' => 11,
			'STAR-4' => 12
		}
	},
	{#State 10
		ACTIONS => {
			";" => 13
		}
	},
	{#State 11
		DEFAULT => -9,
		GOTOS => {
			'STAR-3' => 14
		}
	},
	{#State 12
		ACTIONS => {
			'Regex' => 15,
			";" => -13,
			'StringLiteral' => 16,
			"(" => 21,
			"|" => -13,
			'Identifier' => 5,
			")" => -13
		},
		GOTOS => {
			'zero_or_more' => 20,
			'text' => 22,
			'id' => 23,
			'optional' => 17,
			'one_or_more' => 18,
			'element' => 19
		}
	},
	{#State 13
		DEFAULT => -6
	},
	{#State 14
		ACTIONS => {
			"|" => 25,
			";" => -10,
			")" => -10
		},
		GOTOS => {
			'PAREN-2' => 24
		}
	},
	{#State 15
		DEFAULT => -24
	},
	{#State 16
		DEFAULT => -23
	},
	{#State 17
		DEFAULT => -14
	},
	{#State 18
		DEFAULT => -16
	},
	{#State 19
		ACTIONS => {
			'Regex' => -11,
			"?" => 26,
			";" => -11,
			"+" => 27,
			'StringLiteral' => -11,
			"(" => -11,
			"|" => -11,
			"*" => 28,
			'Identifier' => -11,
			")" => -11
		}
	},
	{#State 20
		DEFAULT => -15
	},
	{#State 21
		DEFAULT => -12,
		GOTOS => {
			'alternatives' => 29,
			'alternative' => 11,
			'STAR-4' => 12
		}
	},
	{#State 22
		DEFAULT => -17
	},
	{#State 23
		DEFAULT => -18
	},
	{#State 24
		DEFAULT => -8
	},
	{#State 25
		DEFAULT => -12,
		GOTOS => {
			'alternative' => 30,
			'STAR-4' => 12
		}
	},
	{#State 26
		DEFAULT => -20
	},
	{#State 27
		DEFAULT => -22
	},
	{#State 28
		DEFAULT => -21
	},
	{#State 29
		ACTIONS => {
			")" => 31
		}
	},
	{#State 30
		DEFAULT => -7
	},
	{#State 31
		DEFAULT => -19
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 330 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule yavi_1
		 'yavi', 1, undef
#line 334 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule ebnf_2
		 'ebnf', 1, undef
#line 338 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 2,
sub {
#line 23 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 345 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 0,
sub {
#line 23 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 352 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule rulelist_5
		 'rulelist', 1, undef
#line 356 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule rule_6
		 'rule', 4,
sub {
#line 28 "lib\Parse\Yavi\EBNF.eyp"
{rulename => $_[1], alternatives => $_[3]}}
#line 363 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _PAREN
		 'PAREN-2', 2,
sub {
#line 32 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforParenthesis}
#line 370 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _STAR_LIST
		 'STAR-3', 2,
sub {
#line 32 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 377 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _STAR_LIST
		 'STAR-3', 0,
sub {
#line 32 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 384 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule alternatives_10
		 'alternatives', 2,
sub {
#line 33 "lib\Parse\Yavi\EBNF.eyp"

            my @alts;

            push @alts, $_[1];
            for my $rest (@{$_[2]})
            {
                my ($bar, $alt)= @$rest;
                push @alts, $alt;
            }

            \@alts;
        }
#line 402 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _STAR_LIST
		 'STAR-4', 2,
sub {
#line 48 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 409 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _STAR_LIST
		 'STAR-4', 0,
sub {
#line 48 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 416 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule alternative_13
		 'alternative', 1, undef
#line 420 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule element_14
		 'element', 1, undef
#line 424 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule element_15
		 'element', 1, undef
#line 428 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule element_16
		 'element', 1, undef
#line 432 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule element_17
		 'element', 1, undef
#line 436 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule element_18
		 'element', 1,
sub {
#line 57 "lib\Parse\Yavi\EBNF.eyp"
{kind => 'reference', value => $_[1]}}
#line 443 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule element_19
		 'element', 3,
sub {
#line 59 "lib\Parse\Yavi\EBNF.eyp"
$_[2]}
#line 450 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule optional_20
		 'optional', 2,
sub {
#line 64 "lib\Parse\Yavi\EBNF.eyp"
{kind => 'element', value => $_[1], modifier => '?'}}
#line 457 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule zero_or_more_21
		 'zero_or_more', 2,
sub {
#line 69 "lib\Parse\Yavi\EBNF.eyp"
{kind => 'element', value => $_[1], modifier => '*'}}
#line 464 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule one_or_more_22
		 'one_or_more', 2,
sub {
#line 74 "lib\Parse\Yavi\EBNF.eyp"
{kind => 'element', value => $_[1], modifier => '+'}}
#line 471 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule text_23
		 'text', 1,
sub {
#line 79 "lib\Parse\Yavi\EBNF.eyp"

            my $s= $_[1];
            $s=~ s/^['"]|['"]$//g;
            {kind => 'string', value => $s};
        }
#line 482 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule text_24
		 'text', 1,
sub {
#line 85 "lib\Parse\Yavi\EBNF.eyp"

            my $s= $_[1];
            $s=~ s/^qr(.)//;
            $s=~ s/$1$//;
            {kind => 'regex', value => $s};
        }
#line 494 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule id_25
		 'id', 1, undef
#line 498 lib\Parse\Yavi\EBNF.pm
	]
],
#line 501 lib\Parse\Yavi\EBNF.pm
    yybypass       => 0,
    yybuildingtree => 0,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {}
,
    yystateconflict => {  },
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'yavi_1', 
         'ebnf_2', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'rulelist_5', 
         'rule_6', 
         '_PAREN', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'alternatives_10', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'alternative_13', 
         'element_14', 
         'element_15', 
         'element_16', 
         'element_17', 
         'element_18', 
         'element_19', 
         'optional_20', 
         'zero_or_more_21', 
         'one_or_more_22', 
         'text_23', 
         'text_24', 
         'id_25', );
  $self;
}

#line 97 "lib\Parse\Yavi\EBNF.eyp"


1;


=for None

=cut


#line 555 lib\Parse\Yavi\EBNF.pm



1;
