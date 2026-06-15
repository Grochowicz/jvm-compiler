ALEX = alex
HAPPY = happy
GHC = ghc

all: compilador

Lex.hs: Lex.x
	$(ALEX) Lex.x

Parser.hs: Parser.y
	$(HAPPY) Parser.y

compilador: Lex.hs Parser.hs Token.hs AST.hs ErrorMonad.hs Semantico.hs Main.hs
	$(GHC) -o compilador Main.hs

clean:
	rm -f Lex.hs Parser.hs *.hi *.o compilador
