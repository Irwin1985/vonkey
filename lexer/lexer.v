module lexer
import token

struct Lexer {
	input string
mut:
	position int // current position in input (points to current char)
	read_position int // current reading position in input (after current char)
	ch byte
}

pub fn new(input string) Lexer {
	mut l := Lexer {
		input: input
		position: 0
		read_position: 0
	}
	l.read_char()
	return l
}

fn (mut l Lexer) read_char() {
	if l.read_position >= l.input.len {
		l.ch = 0
	} else {
		l.ch = l.input[l.read_position]
	}
	l.position = l.read_position
	l.read_position += 1
}

pub fn (mut l Lexer) next_token() ?token.Token {
	mut tok := token.Token{token.eof, ""}
	match l.ch {
		`=` { tok = new_token(token.assign, l.ch) }
		`;` { tok = new_token(token.semicolon, l.ch) }
		`(` { tok = new_token(token.lparen, l.ch) }
		`)` { tok = new_token(token.rparen, l.ch) }
		`,` { tok = new_token(token.comma, l.ch) }
		`+` { tok = new_token(token.plus, l.ch) }
		`{` { tok = new_token(token.lbrace, l.ch) }
		`}` { tok = new_token(token.rbrace, l.ch) }
		0 { /*nothing because tok is eof already*/ }
		else { return error('invalid character `${l.ch}`') }
	}
	l.read_char()
	return tok
}

fn new_token(token_type token.TokenType, ch byte) token.Token {
	return token.Token{
		token_type
		ch.ascii_str()
	}
}