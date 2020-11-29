TARGET := imitation-game.prg
X64 := /usr/local/bin/x64sc
PETCAT := /usr/local/bin/petcat
C1541 := /usr/local/bin/c1541

.PRECIOUS: %.d64

all: $(TARGET)

imitation-game.prg: imitation-game.bas
	$(PETCAT) -w2 -o imitation-game.prg -- imitation-game.bas

imitation-game.d64: imitation-game.prg
	$(C1541) -format imitation-game,id d64 $@ -write $<

run: $(TARGET)
	$(X64) -basicload $<

clean:
	rm -f *.prg
