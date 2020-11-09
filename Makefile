TARGETS := imitation-game
X64 := /usr/local/bin/x64sc
PETCAT := /usr/local/bin/petcat

.PRECIOUS: %.d64

all: $(TARGETS)

imitation-game.prg: imitation-game.bas
	$(PETCAT) -w2 -o imitation-game.prg -- imitation-game.bas

%: %.prg
	$(X64) -basicload $<

clean:
	rm -f $(TARGETS) *.prg
