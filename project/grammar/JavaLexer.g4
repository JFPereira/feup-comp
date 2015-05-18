lexer grammar JavaLexer;

tokens {
	WHITESPACE_CHANNEL,
	COMMENTS_CHANNEL
}

// LEXER

// §3.9 Keywords

ABSTRACT
:
	'abstract'
;

ASSERT
:
	'assert'
;

BOOLEAN
:
	'boolean'
;

BREAK
:
	'break'
;

BYTE
:
	'byte'
;

CASE
:
	'case'
;

CATCH
:
	'catch'
;

CHAR
:
	'char'
;

CLASS
:
	'class'
;

CONST
:
	'const'
;

CONTINUE
:
	'continue'
;

DEFAULT
:
	'default'
;

DO
:
	'do'
;

DOUBLE
:
	'double'
;

ELSE
:
	'else'
;

ENUM
:
	'enum'
;

EXTENDS
:
	'extends'
;

FINAL
:
	'final'
;

FINALLY
:
	'finally'
;

FLOAT
:
	'float'
;

FOR
:
	'for'
;

IF
:
	'if'
;

GOTO
:
	'goto'
;

IMPLEMENTS
:
	'implements'
;

IMPORT
:
	'import'
;

INSTANCEOF
:
	'instanceof'
;

INT
:
	'int'
;

INTERFACE
:
	'interface'
;

LONG
:
	'long'
;

NATIVE
:
	'native'
;

NEW
:
	'new'
;

PACKAGE
:
	'package'
;

PRIVATE
:
	'private'
;

PROTECTED
:
	'protected'
;

PUBLIC
:
	'public'
;

RETURN
:
	'return'
;

SHORT
:
	'short'
;

STATIC
:
	'static'
;

STRICTFP
:
	'strictfp'
;

SUPER
:
	'super'
;

SWITCH
:
	'switch'
;

SYNCHRONIZED
:
	'synchronized'
;

THIS
:
	'this'
;

THROW
:
	'throw'
;

THROWS
:
	'throws'
;

TRANSIENT
:
	'transient'
;

TRY
:
	'try'
;

VOID
:
	'void'
;

VOLATILE
:
	'volatile'
;

WHILE
:
	'while'
;

// §3.10.1 Integer Literals

IntegerLiteral
:
	DecimalIntegerLiteral
	| HexIntegerLiteral
	| OctalIntegerLiteral
	| BinaryIntegerLiteral
;

fragment
DecimalIntegerLiteral
:
	DecimalNumeral IntegerTypeSuffix?
;

fragment
HexIntegerLiteral
:
	HexNumeral IntegerTypeSuffix?
;

fragment
OctalIntegerLiteral
:
	OctalNumeral IntegerTypeSuffix?
;

fragment
BinaryIntegerLiteral
:
	BinaryNumeral IntegerTypeSuffix?
;

fragment
IntegerTypeSuffix
:
	[lL]
;

fragment
DecimalNumeral
:
	'0'
	| NonZeroDigit
	(
		Digits?
		| Underscores Digits
	)
;

fragment
Digits
:
	Digit
	(
		DigitOrUnderscore* Digit
	)?
;

fragment
Digit
:
	'0'
	| NonZeroDigit
;

fragment
NonZeroDigit
:
	[1-9]
;

fragment
DigitOrUnderscore
:
	Digit
	| '_'
;

fragment
Underscores
:
	'_'+
;

fragment
HexNumeral
:
	'0' [xX] HexDigits
;

fragment
HexDigits
:
	HexDigit
	(
		HexDigitOrUnderscore* HexDigit
	)?
;

fragment
HexDigit
:
	[0-9a-fA-F]
;

fragment
HexDigitOrUnderscore
:
	HexDigit
	| '_'
;

fragment
OctalNumeral
:
	'0' Underscores? OctalDigits
;

fragment
OctalDigits
:
	OctalDigit
	(
		OctalDigitOrUnderscore* OctalDigit
	)?
;

fragment
OctalDigit
:
	[0-7]
;

fragment
OctalDigitOrUnderscore
:
	OctalDigit
	| '_'
;

fragment
BinaryNumeral
:
	'0' [bB] BinaryDigits
;

fragment
BinaryDigits
:
	BinaryDigit
	(
		BinaryDigitOrUnderscore* BinaryDigit
	)?
;

fragment
BinaryDigit
:
	[01]
;

fragment
BinaryDigitOrUnderscore
:
	BinaryDigit
	| '_'
;

// §3.10.2 Floating-Point Literals

FloatingPointLiteral
:
	DecimalFloatingPointLiteral
	| HexadecimalFloatingPointLiteral
;

fragment
DecimalFloatingPointLiteral
:
	Digits '.' Digits? ExponentPart? FloatTypeSuffix?
	| '.' Digits ExponentPart? FloatTypeSuffix?
	| Digits ExponentPart FloatTypeSuffix?
	| Digits FloatTypeSuffix
;

fragment
ExponentPart
:
	ExponentIndicator SignedInteger
;

fragment
ExponentIndicator
:
	[eE]
;

fragment
SignedInteger
:
	Sign? Digits
;

fragment
Sign
:
	[+-]
;

fragment
FloatTypeSuffix
:
	[fFdD]
;

fragment
HexadecimalFloatingPointLiteral
:
	HexSignificand BinaryExponent FloatTypeSuffix?
;

fragment
HexSignificand
:
	HexNumeral '.'?
	| '0' [xX] HexDigits? '.' HexDigits
;

fragment
BinaryExponent
:
	BinaryExponentIndicator SignedInteger
;

fragment
BinaryExponentIndicator
:
	[pP]
;

// §3.10.3 Boolean Literals

BooleanLiteral
:
	'true'
	| 'false'
;

// §3.10.4 Character Literals

CharacterLiteral
:
	'\'' SingleCharacter '\''
	| '\'' EscapeSequence '\''
;

fragment
SingleCharacter
:
	~['\\]
;

// §3.10.5 String Literals

StringLiteral
:
	'"' StringCharacters? '"'
;

fragment
StringCharacters
:
	StringCharacter+
;

fragment
StringCharacter
:
	~["\\]
	| EscapeSequence
;

// §3.10.6 Escape Sequences for Character and String Literals

fragment
EscapeSequence
:
	'\\' [btnfr"'\\]
	| OctalEscape
	| UnicodeEscape
;

fragment
OctalEscape
:
	'\\' OctalDigit
	| '\\' OctalDigit OctalDigit
	| '\\' ZeroToThree OctalDigit OctalDigit
;

fragment
UnicodeEscape
:
	'\\' 'u' HexDigit HexDigit HexDigit HexDigit
;

fragment
ZeroToThree
:
	[0-3]
;

// §3.10.7 The Null Literal

NullLiteral
:
	'null'
;

// §3.11 Separators

LPAREN
:
	'('
;

RPAREN
:
	')'
;

LBRACE
:
	'{'
;

RBRACE
:
	'}'
;

LBRACK
:
	'['
;

RBRACK
:
	']'
;

SEMI
:
	';'
;

COMMA
:
	','
;

DOT
:
	'.'
;

// §3.12 Operators

ASSIGN
:
	'='
;

GT
:
	'>'
;

LT
:
	'<'
;

BANG
:
	'!'
;

TILDE
:
	'~'
;

QUESTION
:
	'?'
;

COLON
:
	':'
;

EQUAL
:
	'=='
;

LE
:
	'<='
;

GE
:
	'>='
;

NOTEQUAL
:
	'!='
;

AND
:
	'&&'
;

OR
:
	'||'
;

INC
:
	'++'
;

DEC
:
	'--'
;

ADD
:
	'+'
;

SUB
:
	'-'
;

MUL
:
	'*'
;

DIV
:
	'/'
;

BITAND
:
	'&'
;

BITOR
:
	'|'
;

CARET
:
	'^'
;

MOD
:
	'%'
;

ADD_ASSIGN
:
	'+='
;

SUB_ASSIGN
:
	'-='
;

MUL_ASSIGN
:
	'*='
;

DIV_ASSIGN
:
	'/='
;

AND_ASSIGN
:
	'&='
;

OR_ASSIGN
:
	'|='
;

XOR_ASSIGN
:
	'^='
;

MOD_ASSIGN
:
	'%='
;

LSHIFT_ASSIGN
:
	'<<='
;

RSHIFT_ASSIGN
:
	'>>='
;

URSHIFT_ASSIGN
:
	'>>>='
;

// §3.8 Identifiers (must appear after all keywords in the grammar)

Identifier
:
	JavaLetter JavaLetterOrDigit*
;

fragment
JavaLetter
:
	[a-zA-Z$_] // these are the "java letters" below 0xFF

	| // covers all characters above 0xFF which are not a surrogate
	~[\u0000-\u00FF\uD800-\uDBFF]
	{Character.isJavaIdentifierStart(_input.LA(-1))}?

	| // covers UTF-16 surrogate pairs encodings for U+10000 to U+10FFFF
	[\uD800-\uDBFF] [\uDC00-\uDFFF]
	{Character.isJavaIdentifierStart(Character.toCodePoint((char)_input.LA(-2), (char)_input.LA(-1)))}?

;

fragment
JavaLetterOrDigit
:
	[a-zA-Z0-9$_] // these are the "java letters or digits" below 0xFF

	| // covers all characters above 0xFF which are not a surrogate
	~[\u0000-\u00FF\uD800-\uDBFF]
	{Character.isJavaIdentifierPart(_input.LA(-1))}?

	| // covers UTF-16 surrogate pairs encodings for U+10000 to U+10FFFF
	[\uD800-\uDBFF] [\uDC00-\uDFFF]
	{Character.isJavaIdentifierPart(Character.toCodePoint((char)_input.LA(-2), (char)_input.LA(-1)))}?

;

//
// Additional symbols not defined in the lexical specification
//

AT
:
	'@'
;

ELLIPSIS
:
	'...'
;

//
// Whitespace and comments
//

WS
:
	[ \t\r\n\u000C]+ -> skip
;

COMMENT
:
	'/*' ~['@jQ'] .*? '*/' -> skip
;

LINE_COMMENT
:
	'//' ~[\r\n]* -> skip
;

JQBegin
:
	'/*@jQ' -> pushMode ( JQUERY )
;

mode JQUERY;

JQEnd
:
	'*/' -> popMode
;

IN
:
	'in'
;

OUT
:
	'out'
;

ID
:
	[a-zA-Z_] [a-zA-Z0-9_]*
;

QUOTES
:
	'\"'
;

APOSTROPHE
:
	'\''
;

/*
SEMICOLON
:
	';'
;
*/
DOLLAR
:
	'$'
;

OP
:
	'|='
	| '*='
	| '~='
	| '$='
	| '='
	| '!='
	| '^='
;

/*
OPEN_PARENTHESIS
:
	'('
;

CLOSE_PARENTHESIS
:
	')'
;

OPEN_BRACKET
:
	'['
;

CLOSE_BRACKET
:
	']'
;
*/
JQUERY_WS
:
	[ \t\r\n]+ -> channel ( WHITESPACE_CHANNEL )
;

SINGLE_LINE_COMMENT
:
	'//' .*? '\n' -> channel ( COMMENTS_CHANNEL )
;
