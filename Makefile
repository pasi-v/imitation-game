TARGET := imitation-game.prg
X64 := /usr/local/bin/x64sc
PETCAT := /usr/local/bin/petcat

.PRECIOUS: %.d64

all: $(TARGET)

imitation-game.prg: imitation-game.bas
	$(PETCAT) -w2 -o imitation-game.prg -- imitation-game.bas

run: $(TARGET)
	$(X64) -basicload $<

clean:
	rm -f *.prg
