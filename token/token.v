module token

pub type TokenType = string

pub struct Token {
pub mut:
	@type TokenType
	literal string
}

const (
	illegal = 'ILLEGAL'
	eof = 'EOF'

	// Identifiers + literals
	ident = 'IDENT' // add, foo, bar, x, y, ...
	int = 'INT' // 1343456

	// Operators
	assign = '='
	plus = '+'

	// Delimiters
	comma = ','
	semicolon = ';'

	lparen = '('
	rparen = ')'
	lbrace = '{'
	rbrace = '}'

	// keywords
	function = 'FUNCTION'
	let = 'LET'	
)

