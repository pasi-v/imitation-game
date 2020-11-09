10 gosub 9900: rem title and intro
20 a$="": rem input from player
100 end

1000 print "                --more--"
1001 get zz$:if zz$="" goto 1001
1002 return

9900 rem title screen
9910 print chr$(14): rem upper-lowercase characters
9915 poke 53280,0:poke 53281,0
9919 print
9920 print "{clr}             Imitation Game"
9921 print
9930 print "       An interactive short story"
9931 print
9932 print
9933 print "     Please use lowercase commands,"
9934 print "     like 'enter' or 'talk to jack'."
9935 print
9940 gosub 1000: rem more
9950 gosub 10000: rem intro
9960 return

10000 rem intro, not using the parser
10010 print "{clr}"
10011 print "It is a dark and stormy night, November"
10012 print "1986. The thunderstorm is rolling in,"
10013 print "the lightning bolts striking from cloud"
10014 print "to cloud and at the silver skyscrapers."
10015 print "The weather had been like this ever"
10016 print "since the huge Tesla towers had been"
10017 print "built in all the major cities across"
10018 print "the country, transferring wireless"
10019 print "energy and drawing in enormous"
10020 print "thunderstorms. You don't remember the"
10021 print "last time you actually saw the stars in"
10022 print "the night sky."
10023 print
10034 print "The Laurelin-Dorenan corporation tower"
10035 print "is reaching towards the flashing blue"
10036 print "light show of the heavens above. You"
10037 print "had received a most peculiar"
10038 print "invitation; the typical private eye of"
10039 print "West Chester, PA, did not get invited"
10040 print "to these towers of the high and mighty."
10041 print "But here you are, in spite of all your"
10042 print "'I have a bad feeling about this'."
10043 print
10024 gosub 1000: rem more
10044 print "You are in the ground floor lobby."
10045 print "There is an {wht}elevator{lblu}."
10046 print "Removeme: say enter"
10050 input a$
10060 if a$="enter" then a$="": goto 10080
10070 print "I did not understand": goto 10050
10080 print "You enter the elevator. It recognises"
10081 print "you. 'Destination: Top floor' it says"
10082 print "and shoots you smoothly upwards."
10083 print "After a couple of seconds it slows down"
10084 print "and you feel your stomach in your"
10085 print "throat, then the elevator stops and the"
10086 print "door opens. Your only way forward is"
10087 print "through the door into the huge"
10088 print "penthouse office."
10089 print
10090 print "Removeme: say enter"
10095 input a$
10096 if a$="enter" then a$="": goto 10100
10097 print "I did not understand": goto 10095
10100 print "A pale, almost glowing figure in white"
10101 print "dress is standing at the other end of"
10102 print "the room, watching the thunderstorm"
10103 print "raging outside. She turns, smiles at"
10104 print "you, and extends her slender hand."
10105 print "'Welcome, detective. I am glad you"
10106 print "came.'":print:print "The Lady. The CEO of Laurelin-"
10107 print "Dorenan. What is this?"
10108 print
10109 print "'My lady', you manage, averting your"
10110 print "gaze. 'How may I assist?'":print
10111 print "'We would require a small service from"
10112 print "someone not affiliated with our"
10113 print "corporation. For a handsome reward, and"
10114 print "our gratitude. The task is simple, but"
10115 print "requires a certain degree of..."
10116 print "creativity. You will be augmented with"
10117 print "a bit of unconventional computational"
10118 print "power, act as a messenger, and carry a"
10119 print "data packet to a location that can not"
10120 gosub 1000
10121 print "be reached wirelessly. The Tesla"
10122 print "Tower. I hope you are interested."
10130 print
10131 print "You are not. But you make the mistake"
10132 print "of looking at her smiling eyes. And"
10133 print "hear yourself bowing and saying"
10134 print "something stupid."
10140 print
10141 print "'Very well. Plug this in' she says,"
10142 print "giving you a chip. 'This is a"
10143 print "completely new prototype Commodore"
10144 print "model, and the data packet is inside"
10145 print "it. It also contains a virtual"
10146 print "assistant to help you with your"
10147 print "mission.'"
10150 print
10151 print "'Good luck, friend. And remember:"
10152 print "In a tree by the brook, there's a"
10153 print "songbird who sings.'"
10160 print
10161 print "You are dismissed and find yourself"
10162 print "back in the elevator, travelling"
10163 print "downwards, and soon back on the"
10170 gosub 1000
10171 print "street, outside the tower."
10180 print
10181 print "You feel something ticklish inside your"
10182 print "head. Then your world bursts into pain"
10183 print "and confusion as you feel the chip"
10184 print "powering up."
10185 gosub 1000
10190 gosub 13000
10200 gosub 14000
12000 return

13000 print "{clr}{red}"
13001 print "{rvon}                                       "
13002 print "{rvon} {rvof}                                     {rvon} "
13003 print "{rvon} {rvof}  Software Failure. Rebooting...     {rvon} "
13004 print "{rvon} {rvof}  Guru Meditation #03011892.ACDC     {rvon} "
13005 print "{rvon} {rvof}                                     {rvon} "
13006 print "{rvon}                                       "
13010 get zz$:if zz$="" goto 13010
13020 return

14000 print "{clr}{white}"
14001 print "Commodore Amiga 64, 64 MB RAM system"
14002 print "Wetware interface booting...": print
14010 print "Hello pilgrim, I am Nikola, your"
14011 print "virtual assistant. You may reach me"
14012 print "anytime by thinking 'talk' or"
14013 print "'nikola'. Whenever you have no idea"
14014 print "what to do next, ask me for 'help'."
14015 print "Say 'bye' when you don't want to talk"
14016 print "to me anymore."
14020 print
14021 print "Our mission is to reach the Tesla tower"
14022 print "and install there the small program you"
14023 print "are now carrying. Shouldn't be too hard"
14024 print "for our team."
14030 print
14031 print "I have to say it's really neat to be"
14032 print "inside your head. So much interesting"
14033 print "stuff here! I'm sure we'll get along"
14034 print "really well!"
14030 return