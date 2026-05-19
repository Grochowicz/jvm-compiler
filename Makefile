ALEX = alex
HAPPY = happy

all:
	$(ALEX) Lex.x
	$(HAPPY) Parser.y

clean:
	rm Lex.hs Parser.hs
