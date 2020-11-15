#!/bin/sh
petcat -w2 -o imitation-game.prg -- imitation-game.bas
x64sc -basicload imitation-game.prg
