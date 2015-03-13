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

      m{\G(\%token|\%union|\%type|\%\{|\%\}|\%\%|\:|\;|\+|\*|\)|\?|\||\()}gc and return ($1, $1);

      /\G([a-zA-Z_][a-zA-Z0-9_]*)/gc and return ('IDENTIFIER', $1);
      /\G('(?:[^']|\\')*'|"(?:[^"]|\\")*")/gc and return ('STRINGLITERAL', $1);
      /\G(qr(.)(?:[^\2]|\\\2)*?\2)/gc and return ('REGEX', $1);
      /\G([^\r\n]+)/gc and return ('RAW_REGEX', $1);
      /\G((?:.|\r|\n)*?)(?:\%\})/gc and return ('HEAD_CODE', $1);
      /\G(.*)\Z/gc and return ('TAIL_CODE', $1);


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


#line 71 lib\Parse\Yavi\EBNF.pm

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
  [ '_SUPERSTART' => '$start', [ 'file', '$end' ], 0 ],
  [ 'file_1' => 'file', [ 'header_section', '%%', 'body_section', '%%', 'tail_section' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-1', [ 'HEAD_CODE' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-1', [  ], 0 ],
  [ '_PAREN' => 'PAREN-2', [ '%{', 'OPTIONAL-1', '%}' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-3', [ 'PAREN-2' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-3', [  ], 0 ],
  [ 'header_section_7' => 'header_section', [ 'OPTIONAL-3', 'definitions' ], 0 ],
  [ '_STAR_LIST' => 'STAR-4', [ 'STAR-4', 'definition' ], 0 ],
  [ '_STAR_LIST' => 'STAR-4', [  ], 0 ],
  [ 'definitions_10' => 'definitions', [ 'STAR-4' ], 0 ],
  [ 'definition_11' => 'definition', [ '%token', 'IDENTIFIER', 'RAW_REGEX' ], 0 ],
  [ 'definition_12' => 'definition', [ '%union' ], 0 ],
  [ 'definition_13' => 'definition', [ '%type' ], 0 ],
  [ 'body_section_14' => 'body_section', [ 'ebnf' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-5', [ 'TAIL_CODE' ], 0 ],
  [ '_OPTIONAL' => 'OPTIONAL-5', [  ], 0 ],
  [ 'tail_section_17' => 'tail_section', [ 'OPTIONAL-5' ], 0 ],
  [ 'ebnf_18' => 'ebnf', [ 'rules' ], 0 ],
  [ '_STAR_LIST' => 'STAR-6', [ 'STAR-6', 'rule' ], 0 ],
  [ '_STAR_LIST' => 'STAR-6', [  ], 0 ],
  [ 'rules_21' => 'rules', [ 'STAR-6' ], 0 ],
  [ 'rule_22' => 'rule', [ 'rulename', ':', 'alternatives', ';' ], 0 ],
  [ 'rulename_23' => 'rulename', [ 'IDENTIFIER' ], 0 ],
  [ '_PLUS_LIST' => 'PLUS-7', [ 'PLUS-7', 'alternative' ], 0 ],
  [ '_PLUS_LIST' => 'PLUS-7', [ 'alternative' ], 0 ],
  [ '_PLUS_LIST' => 'PLUS-8', [ 'PLUS-8', 'alternative' ], 0 ],
  [ '_PLUS_LIST' => 'PLUS-8', [ 'alternative' ], 0 ],
  [ '_PAREN' => 'PAREN-9', [ '|', 'PLUS-8' ], 0 ],
  [ '_STAR_LIST' => 'STAR-10', [ 'STAR-10', 'PAREN-9' ], 0 ],
  [ '_STAR_LIST' => 'STAR-10', [  ], 0 ],
  [ 'alternatives_31' => 'alternatives', [ 'PLUS-7', 'STAR-10' ], 0 ],
  [ 'alternatives_32' => 'alternatives', [  ], 0 ],
  [ 'alternative_33' => 'alternative', [ 'expression', '?' ], 0 ],
  [ 'alternative_34' => 'alternative', [ 'expression', '*' ], 0 ],
  [ 'alternative_35' => 'alternative', [ 'expression', '+' ], 0 ],
  [ 'alternative_36' => 'alternative', [ 'expression' ], 0 ],
  [ '_PAREN' => 'PAREN-11', [ '|', 'alternative' ], 0 ],
  [ '_STAR_LIST' => 'STAR-12', [ 'STAR-12', 'PAREN-11' ], 0 ],
  [ '_STAR_LIST' => 'STAR-12', [  ], 0 ],
  [ 'expression_40' => 'expression', [ 'rulename' ], 0 ],
  [ 'expression_41' => 'expression', [ 'STRINGLITERAL' ], 0 ],
  [ 'expression_42' => 'expression', [ 'REGEX' ], 0 ],
  [ 'expression_43' => 'expression', [ '(', 'alternative', 'STAR-12', ')' ], 0 ],
],
    yyLABELS  =>
{
  '_SUPERSTART' => 0,
  'file_1' => 1,
  '_OPTIONAL' => 2,
  '_OPTIONAL' => 3,
  '_PAREN' => 4,
  '_OPTIONAL' => 5,
  '_OPTIONAL' => 6,
  'header_section_7' => 7,
  '_STAR_LIST' => 8,
  '_STAR_LIST' => 9,
  'definitions_10' => 10,
  'definition_11' => 11,
  'definition_12' => 12,
  'definition_13' => 13,
  'body_section_14' => 14,
  '_OPTIONAL' => 15,
  '_OPTIONAL' => 16,
  'tail_section_17' => 17,
  'ebnf_18' => 18,
  '_STAR_LIST' => 19,
  '_STAR_LIST' => 20,
  'rules_21' => 21,
  'rule_22' => 22,
  'rulename_23' => 23,
  '_PLUS_LIST' => 24,
  '_PLUS_LIST' => 25,
  '_PLUS_LIST' => 26,
  '_PLUS_LIST' => 27,
  '_PAREN' => 28,
  '_STAR_LIST' => 29,
  '_STAR_LIST' => 30,
  'alternatives_31' => 31,
  'alternatives_32' => 32,
  'alternative_33' => 33,
  'alternative_34' => 34,
  'alternative_35' => 35,
  'alternative_36' => 36,
  '_PAREN' => 37,
  '_STAR_LIST' => 38,
  '_STAR_LIST' => 39,
  'expression_40' => 40,
  'expression_41' => 41,
  'expression_42' => 42,
  'expression_43' => 43,
},
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	'%%' => { ISSEMANTIC => 0 },
	'%token' => { ISSEMANTIC => 0 },
	'%type' => { ISSEMANTIC => 0 },
	'%union' => { ISSEMANTIC => 0 },
	'%{' => { ISSEMANTIC => 0 },
	'%}' => { ISSEMANTIC => 0 },
	'(' => { ISSEMANTIC => 0 },
	')' => { ISSEMANTIC => 0 },
	'*' => { ISSEMANTIC => 0 },
	'+' => { ISSEMANTIC => 0 },
	':' => { ISSEMANTIC => 0 },
	';' => { ISSEMANTIC => 0 },
	'?' => { ISSEMANTIC => 0 },
	'|' => { ISSEMANTIC => 0 },
	HEAD_CODE => { ISSEMANTIC => 1 },
	IDENTIFIER => { ISSEMANTIC => 1 },
	RAW_REGEX => { ISSEMANTIC => 1 },
	REGEX => { ISSEMANTIC => 1 },
	STRINGLITERAL => { ISSEMANTIC => 1 },
	TAIL_CODE => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'lib\Parse\Yavi\EBNF.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			"%{" => 1
		},
		DEFAULT => -6,
		GOTOS => {
			'header_section' => 2,
			'file' => 3,
			'PAREN-2' => 5,
			'OPTIONAL-3' => 4
		}
	},
	{#State 1
		ACTIONS => {
			'HEAD_CODE' => 7
		},
		DEFAULT => -3,
		GOTOS => {
			'OPTIONAL-1' => 6
		}
	},
	{#State 2
		ACTIONS => {
			"%%" => 8
		}
	},
	{#State 3
		ACTIONS => {
			'' => 9
		}
	},
	{#State 4
		DEFAULT => -9,
		GOTOS => {
			'definitions' => 11,
			'STAR-4' => 10
		}
	},
	{#State 5
		DEFAULT => -5
	},
	{#State 6
		ACTIONS => {
			"%}" => 12
		}
	},
	{#State 7
		DEFAULT => -2
	},
	{#State 8
		DEFAULT => -20,
		GOTOS => {
			'body_section' => 14,
			'ebnf' => 13,
			'STAR-6' => 15,
			'rules' => 16
		}
	},
	{#State 9
		DEFAULT => 0
	},
	{#State 10
		ACTIONS => {
			"%token" => 17,
			"%union" => 19,
			"%type" => 18
		},
		DEFAULT => -10,
		GOTOS => {
			'definition' => 20
		}
	},
	{#State 11
		DEFAULT => -7
	},
	{#State 12
		DEFAULT => -4
	},
	{#State 13
		DEFAULT => -14
	},
	{#State 14
		ACTIONS => {
			"%%" => 21
		}
	},
	{#State 15
		ACTIONS => {
			'IDENTIFIER' => 22
		},
		DEFAULT => -21,
		GOTOS => {
			'rulename' => 23,
			'rule' => 24
		}
	},
	{#State 16
		DEFAULT => -18
	},
	{#State 17
		ACTIONS => {
			'IDENTIFIER' => 25
		}
	},
	{#State 18
		DEFAULT => -13
	},
	{#State 19
		DEFAULT => -12
	},
	{#State 20
		DEFAULT => -8
	},
	{#State 21
		ACTIONS => {
			'TAIL_CODE' => 26
		},
		DEFAULT => -16,
		GOTOS => {
			'tail_section' => 27,
			'OPTIONAL-5' => 28
		}
	},
	{#State 22
		DEFAULT => -23
	},
	{#State 23
		ACTIONS => {
			":" => 29
		}
	},
	{#State 24
		DEFAULT => -19
	},
	{#State 25
		ACTIONS => {
			'RAW_REGEX' => 30
		}
	},
	{#State 26
		DEFAULT => -15
	},
	{#State 27
		DEFAULT => -1
	},
	{#State 28
		DEFAULT => -17
	},
	{#State 29
		ACTIONS => {
			"(" => 36,
			'IDENTIFIER' => 22,
			'STRINGLITERAL' => 32,
			'REGEX' => 33
		},
		DEFAULT => -32,
		GOTOS => {
			'PLUS-7' => 35,
			'alternatives' => 31,
			'expression' => 37,
			'alternative' => 38,
			'rulename' => 34
		}
	},
	{#State 30
		DEFAULT => -11
	},
	{#State 31
		ACTIONS => {
			";" => 39
		}
	},
	{#State 32
		DEFAULT => -41
	},
	{#State 33
		DEFAULT => -42
	},
	{#State 34
		DEFAULT => -40
	},
	{#State 35
		ACTIONS => {
			"(" => 36,
			'IDENTIFIER' => 22,
			'STRINGLITERAL' => 32,
			'REGEX' => 33
		},
		DEFAULT => -30,
		GOTOS => {
			'STAR-10' => 40,
			'expression' => 37,
			'alternative' => 41,
			'rulename' => 34
		}
	},
	{#State 36
		ACTIONS => {
			"(" => 36,
			'IDENTIFIER' => 22,
			'STRINGLITERAL' => 32,
			'REGEX' => 33
		},
		GOTOS => {
			'expression' => 37,
			'alternative' => 42,
			'rulename' => 34
		}
	},
	{#State 37
		ACTIONS => {
			"?" => 43,
			"+" => 44,
			"*" => 45
		},
		DEFAULT => -36
	},
	{#State 38
		DEFAULT => -25
	},
	{#State 39
		DEFAULT => -22
	},
	{#State 40
		ACTIONS => {
			"|" => 47
		},
		DEFAULT => -31,
		GOTOS => {
			'PAREN-9' => 46
		}
	},
	{#State 41
		DEFAULT => -24
	},
	{#State 42
		DEFAULT => -39,
		GOTOS => {
			'STAR-12' => 48
		}
	},
	{#State 43
		DEFAULT => -33
	},
	{#State 44
		DEFAULT => -35
	},
	{#State 45
		DEFAULT => -34
	},
	{#State 46
		DEFAULT => -29
	},
	{#State 47
		ACTIONS => {
			"(" => 36,
			'IDENTIFIER' => 22,
			'STRINGLITERAL' => 32,
			'REGEX' => 33
		},
		GOTOS => {
			'expression' => 37,
			'PLUS-8' => 50,
			'alternative' => 49,
			'rulename' => 34
		}
	},
	{#State 48
		ACTIONS => {
			"|" => 51,
			")" => 53
		},
		GOTOS => {
			'PAREN-11' => 52
		}
	},
	{#State 49
		DEFAULT => -27
	},
	{#State 50
		ACTIONS => {
			"(" => 36,
			'IDENTIFIER' => 22,
			'STRINGLITERAL' => 32,
			'REGEX' => 33
		},
		DEFAULT => -28,
		GOTOS => {
			'expression' => 37,
			'alternative' => 54,
			'rulename' => 34
		}
	},
	{#State 51
		ACTIONS => {
			"(" => 36,
			'IDENTIFIER' => 22,
			'STRINGLITERAL' => 32,
			'REGEX' => 33
		},
		GOTOS => {
			'expression' => 37,
			'alternative' => 55,
			'rulename' => 34
		}
	},
	{#State 52
		DEFAULT => -38
	},
	{#State 53
		DEFAULT => -43
	},
	{#State 54
		DEFAULT => -26
	},
	{#State 55
		DEFAULT => -37
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 528 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule file_1
		 'file', 5,
sub {
#line 23 "lib\Parse\Yavi\EBNF.eyp"
{header => $_[1], body => $_[3], tail => $_[5]}}
#line 535 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-1', 1,
sub {
#line 27 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 542 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-1', 0,
sub {
#line 27 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 549 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _PAREN
		 'PAREN-2', 3,
sub {
#line 27 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforParenthesis}
#line 556 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-3', 1,
sub {
#line 27 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 563 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-3', 0,
sub {
#line 27 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 570 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule header_section_7
		 'header_section', 2,
sub {
#line 29 "lib\Parse\Yavi\EBNF.eyp"
{snippet => {}, definitions => $_[2]}}
#line 577 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _STAR_LIST
		 'STAR-4', 2,
sub {
#line 33 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 584 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _STAR_LIST
		 'STAR-4', 0,
sub {
#line 33 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 591 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule definitions_10
		 'definitions', 1, undef
#line 595 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule definition_11
		 'definition', 3,
sub {
#line 38 "lib\Parse\Yavi\EBNF.eyp"
{kind => 'token', name => $_[2], regex => $_[3]}}
#line 602 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule definition_12
		 'definition', 1,
sub {
#line 40 "lib\Parse\Yavi\EBNF.eyp"
{kind => 'union'}}
#line 609 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule definition_13
		 'definition', 1,
sub {
#line 42 "lib\Parse\Yavi\EBNF.eyp"
{kind => 'type'}}
#line 616 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule body_section_14
		 'body_section', 1, undef
#line 620 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-5', 1,
sub {
#line 50 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 627 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _OPTIONAL
		 'OPTIONAL-5', 0,
sub {
#line 50 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 634 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule tail_section_17
		 'tail_section', 1, undef
#line 638 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule ebnf_18
		 'ebnf', 1, undef
#line 642 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _STAR_LIST
		 'STAR-6', 2,
sub {
#line 58 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 649 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _STAR_LIST
		 'STAR-6', 0,
sub {
#line 58 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 656 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule rules_21
		 'rules', 1, undef
#line 660 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule rule_22
		 'rule', 4,
sub {
#line 63 "lib\Parse\Yavi\EBNF.eyp"
{kind => 'rule', name => $_[1], value => $_[3]}}
#line 667 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule rulename_23
		 'rulename', 1,
sub {
#line 68 "lib\Parse\Yavi\EBNF.eyp"
{kind => 'id', value => $_[1]}}
#line 674 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-7', 2,
sub {
#line 72 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 681 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-7', 1,
sub {
#line 72 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 688 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-8', 2,
sub {
#line 72 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 695 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _PLUS_LIST
		 'PLUS-8', 1,
sub {
#line 72 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_single }
#line 702 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _PAREN
		 'PAREN-9', 2,
sub {
#line 72 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforParenthesis}
#line 709 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _STAR_LIST
		 'STAR-10', 2,
sub {
#line 72 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 716 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _STAR_LIST
		 'STAR-10', 0,
sub {
#line 72 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 723 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule alternatives_31
		 'alternatives', 2, undef
#line 727 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule alternatives_32
		 'alternatives', 0, undef
#line 731 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule alternative_33
		 'alternative', 2,
sub {
#line 78 "lib\Parse\Yavi\EBNF.eyp"
{kind => '?', value => $_[1]}}
#line 738 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule alternative_34
		 'alternative', 2,
sub {
#line 80 "lib\Parse\Yavi\EBNF.eyp"
{kind => '*', value => $_[1]}}
#line 745 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule alternative_35
		 'alternative', 2,
sub {
#line 82 "lib\Parse\Yavi\EBNF.eyp"
{kind => '+', value => $_[1]}}
#line 752 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule alternative_36
		 'alternative', 1,
sub {
#line 84 "lib\Parse\Yavi\EBNF.eyp"
$_[1]}
#line 759 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _PAREN
		 'PAREN-11', 2,
sub {
#line 94 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforParenthesis}
#line 766 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _STAR_LIST
		 'STAR-12', 2,
sub {
#line 94 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 773 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule _STAR_LIST
		 'STAR-12', 0,
sub {
#line 94 "lib\Parse\Yavi\EBNF.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 780 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule expression_40
		 'expression', 1,
sub {
#line 89 "lib\Parse\Yavi\EBNF.eyp"
{kind => 'ref', value => $_[1]}}
#line 787 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule expression_41
		 'expression', 1,
sub {
#line 91 "lib\Parse\Yavi\EBNF.eyp"
{kind => 'string', value => $_[1]}}
#line 794 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule expression_42
		 'expression', 1,
sub {
#line 93 "lib\Parse\Yavi\EBNF.eyp"
{kind => 'regex', value => $_[1]}}
#line 801 lib\Parse\Yavi\EBNF.pm
	],
	[#Rule expression_43
		 'expression', 4,
sub {
#line 95 "lib\Parse\Yavi\EBNF.eyp"
{kind => 'group', value => $_[2]}}
#line 808 lib\Parse\Yavi\EBNF.pm
	]
],
#line 811 lib\Parse\Yavi\EBNF.pm
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
         'file_1', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         '_PAREN', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         'header_section_7', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'definitions_10', 
         'definition_11', 
         'definition_12', 
         'definition_13', 
         'body_section_14', 
         '_OPTIONAL', 
         '_OPTIONAL', 
         'tail_section_17', 
         'ebnf_18', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'rules_21', 
         'rule_22', 
         'rulename_23', 
         '_PLUS_LIST', 
         '_PLUS_LIST', 
         '_PLUS_LIST', 
         '_PLUS_LIST', 
         '_PAREN', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'alternatives_31', 
         'alternatives_32', 
         'alternative_33', 
         'alternative_34', 
         'alternative_35', 
         'alternative_36', 
         '_PAREN', 
         '_STAR_LIST', 
         '_STAR_LIST', 
         'expression_40', 
         'expression_41', 
         'expression_42', 
         'expression_43', );
  $self;
}

#line 98 "lib\Parse\Yavi\EBNF.eyp"


1;


=for None

=cut


#line 883 lib\Parse\Yavi\EBNF.pm



1;
