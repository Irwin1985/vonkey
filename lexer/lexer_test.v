module lexer
import token

struct Test {
	expected_type token.TokenType
	expected_literal string
}

fn test_next_token() {
	input := '=+(){},;'
	mut tests := []Test{}
	tests << Test{token.assign, '='}	
	tests << Test{token.plus, '+'}
	tests << Test{token.lparen, '('}
	tests << Test{token.rparen, ')'}
	tests << Test{token.lbrace, '{'}
	tests << Test{token.rbrace, '}'}
	tests << Test{token.comma, ','}
	tests << Test{token.semicolon, ';'}
	tests << Test{token.eof, ''}
	
	mut l := new(input)

	for i, tt in tests {
		tok := l.next_token() or { panic(err.msg) }

		if tok.@type != tt.expected_type {
			println("tests[$i] - literal wrong. expected = '${tt.expected_literal}', got = '${tok.literal}'")
		}

	}
}