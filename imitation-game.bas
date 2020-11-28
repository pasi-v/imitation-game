10 gosub 9800: rem screen setup

19 rem variables
20 in$="": co$="": ob$="": rem input, command and object from player
21 x$="":x=0: rem random variables used inside subroutines
22 i=0:j=0: rem loop variables
23 e=0: rem event number, 0=intro
24 u=0: rem command understood, 0=no, 1=yes
25 dim cl$(6): rem colours
26 ch=1: rem character index, 1=nikola
27 ad=0: rem advance event after talking if ad=1
28 ri=0: rem how many times turned right in tunnels
   
29 rem global constants
30 ne=14: rem number of events
31 nl=25: rem number of lines per event
32 dim el$(ne, nl): rem event text lines
   
40 gosub 40000: rem read event data into el$(,)
45 gosub 9900: rem title and intro

50 if e=0 then e=1: pe=0: rem event and previous printed event
53 if e>ne then end
55 gosub 2000: rem print event/location based on e
56 gosub 8000: rem pre-event things
60 gosub 2200: rem read command into co$ and ob$
70 gosub 3000: rem check state-specific commands
90 if u=0 then gosub 2500: rem check generic commands
90 goto 53
100 end

1000 print "               --more--"
1001 get in$:if in$="" goto 1001
1002 return
     
1010 input in$: if in$="" then goto 1010
1020 return

2000 rem print event from el$(e)
2001 if e=pe then return
2010 for i = 1 to nl
2020   x$ = el$(e, i)
2030   if x$ = "@" then pe=e: return
2040   print x$
2050 next i
2060 pe=e
2070 return
     
2200 rem read command and object to co$ and ob$
2205 u=0: rem command not yet understood
2210 gosub 1010: rem read in$
2220 co$="": ob$=""
2230 i=0: rem location of (last) space
2240 for j=1 to len(in$)
2250     if mid$(in$, j, 1)=" " then i=j
2260 next j
2270 if i>0 then ob$=right$(in$, len(in$)-i):co$=left$(in$, i-1):return
2280 co$=in$: rem else
2300 return
     
2500 rem generic commands
2510 if co$="talk" or co$="nikola" then gosub 4000: u=1: return
2520 if co$="help" then gosub 3600: u=1: return
2530 if co$="quit" then gosub 3650: u=1: return
2540 if co$="inventory" then gosub 3700: u=1: return
2550 if co$="shoot" or co$="attack" or co$="kill" then gosub 3750: u=1: return
2560 if co$="take" or co$="get" then gosub 3800: u=1: return
2570 if co$="save" then gosub 3850: u=1: return
2580 if co$="load" then gosub 3900: u=1: return
2590 if co$="look" then gosub 3950: u=1:return
2600 return
     
     
3000 rem state-specific handling, sets u=1 if co$ matches
3010 if e=1 then gosub 6000: return: rem riverside
3020 if e=2 then gosub 6100: return: rem mallorn
3030 if e=3 then gosub 6200: return: rem agnus and denise
3040 if e=4 then gosub 6300: return: rem band starting
3050 if e=5 then gosub 6400: return: rem listen to riddle
3060 if e=6 then gosub 6500: return: rem back outside
3070 if e=7 then gosub 6600: return
3090 if e=8 then gosub 6700: return
3100 if e=9 then gosub 6800: return
3110 if e=10 then gosub 6900: return
3120 if e=11 then gosub 7000: return
3130 if e=12 then gosub 7100: return
3140 if e=13 then gosub 7200: return
3150 if e=14 then gosub 7300: :gosub 15000: return: rem outro
3500 return
     
3600 rem help
3610 print"Your job is to get to the Tesla Tower"
3611 print "and deliver the data packet inside"
3612 print "your head there. Your VI Nikola will"
3613 print "assist you. Say 'talk' or 'nikola'"
3614 print "to contact your assistant.":print
3620 print "Otherwise use one or two-word"
3621 print "commands like 'talk jack' or 'enter'."
3622 print "'look': reprint event/location"
3623 print "'save': get a token to continue later"
3624 print "'quit': quit the game"
3640 return
     
3650 rem quit
3610 print "Are you sure? (y/n)"
3620 input in$:if in$="y" then end
3630 return
     
3700 rem inventory
3710 print "You are carrying your (t)rusty old"
3720 print "Tesla-manufactured magblaster."
3720 return
     
3750 rem shoot
3760 if e <= ne then print "That would only get you arrested."
3770 return
     
3800 rem try to take something
3810 if ob$="" then print "Um, no. That would be stealing.": return
3820 print "You don't really need ";ob$: return
     
3850 rem save
3860 print "Next time you play, say 'load ";e;"'"
3870 return
     
3900 rem load
3910 e=val(ob$)
3920 return
     
3950 rem look
3960 pe=e-1
3970 return
     
4000 rem talk to nikola
4005 if e=0 then print "You mutter to yourself.": goto 4030
4010 if e=2 then gosub 5000: e=3: goto 4030
4020 ch=1: gosub 4100: rem real talking
4030 print "{lblu}":return
     
4100 rem talking; input: ch:character index
4110 ad=0: print cl$(ch)
4115 on ch gosub 5400, 5500, 5600, 5700, 5800, 5900
4120 gosub 1010: rem read to in$
4130 if in$="bye" then goto 4200
4135 rem todo: handle input, generate answer, print it
4140 on ch gosub 4000, 4400, 4500, 4600, 4700, 4800
4150 print an$
4160 if ad=1 then goto 4200  
4170 goto 4120
4200 print "{lblu}":return
     
4400 rem agnus
4410 if in$="songbird" then goto 4430
4420 an$="Och! That's guid!": return
4430 ad=1: an$="Songbird, ay? The Lady sent ye?": return
     
4500 rem denise
4510 if in$="songbird" then goto 4530
4520 an$="That sounds really interesting!": return
4530 ad=1: an$="Songbirds are beautiful. Like the Lady.": return
     
4600 rem alan
4610 if in$="both" then goto 4630
4612 if in$="ada" then an$="True. But not entirely.": return
4615 if in$="charles" then an$="True. But try harder.": return
4617 if in$="alan" then an$="You are too kind.": return
4620 an$="Interesting proposition. But not the    answer.": return
4630 ad=1: an$="That is correct.":return
     
4700 rem ada
4710 an$="Ada agrees with you.": return
     
4800 rem charles
4810 an$="Charles agrees with you.": return
     
5000 rem talking to nikola in mallorn
5005 print:print cl$(1); "I think we are in the right place..."
5010 print "I'll run a little scan of the room...":print
5011 print "Hey, have a look at those two!"
5012 print "There's something strange about one of"
5013 print "them, maybe the Lady meant her...":print
5015 return
     
5400 rem nikola
5401 print "Hiya pilgrim, what can I do for you?": return
     
5500 rem agnus
5501 print "Awrite! Hou ar ye?": return
     
5600 rem denise
5601 print "Hello, I'm Denise, how may I help you?": return
     
5700 rem alan
5701 print "Good evening. How do you do?"
5702 print "I'd like to know which one you consider"
5703 print "an intelligent being, Ada or Charles."
5704 print "The name of the game is that you get to"
5705 print "talk to them and determine it yourself."
5710 return
     
5800 rem ada
5801 print "Good evening. I am Lady Ada Lovelace."
5802 print "I must say it is a great pleasure"
5803 print "to meet you.": return
     
5900 rem charles
5901 print "-now hold on for a moment..."
5902 print "What was it you were saying?": return
     
6000 rem event 1: riverside
6010 if co$="mallorn" or ob$="mallorn" or co$="enter" then e=2:u=1
6020 return
     
6100 rem event 2: mallorn
6120 return
     
6200 rem event 3: with agnus and denise
6205 rem TODO: set e=4 only after talking to either of them
6210 if co$<>"talk" then return
6220 if ob$="agnus" then ch=2: goto 6250
6230 if ob$="denise" then ch=3: goto 6250
6240 return: rem else
6250 gosub 4100: u=1: if ad=1 then e=4: ad=0
6260 return
     
6300 rem event 4: band about to play
6310 e=5:u=1: rem just wait and they play
6320 return
     
6400 rem event 5
6410 if co$="exit" then e=6:u=1
6420 return
     
6500 rem event 6
6510 if co$="enter" or co$="open" or ob$="hole" or ob$="crate" then e=7:u=1
6520 return
     
6600 rem event 7
6610 if co$="open" then print "It is locked.": u=1: return
6620 if ob$="computer" then e=8: u=1
6660 return
     
6700 rem event 8 - waking up
6710 e=9: u=1
6720 return
     
6800 rem event 9 - meet Alan and friends
6810 if co$<>"talk" then return
6820 if ob$="alan" then ch=4: goto 6860
6830 if ob$="ada" then ch=5: goto 6860
6840 if ob$="charles" then ch=6: goto 6860
6850 return: rem else
6860 gosub 4100: u=1: if ad=1 then e=10: ad=0
6890 return
     
6900 rem event 10 - tunnels opened
6910 if co$="enter" then e=11: u=1
6920 return
     
7000 rem event 11 - in the tunnels
7020 if co$="right" then n=n+1: u=1: if n>2 then e=12: u=1: return
7030 if co$="left" then n=0: u=1
7035 print "You are in a maze of tunnels, all alike."
7040 print "You come to a fork in the tunnel."
7050 print "There are routes {wht}left{lblu} and {wht}right{lblu}."
7060 return
     
7100 rem event 12 - under the tower
7110 if co$="climb" then e=13: u=1
7120 return
     
7200 rem event 13 - top of the tower
7210 if co$="enter" or co$="open" or ob$="door" then e=14: u=1
7220 return
     
7300 rem event 14 - inside control room
7340 e=15: u=1
7350 return
     
8000 rem pre-events
8010 if e=8 then gosub 8100: return
8015 if e=14 then gosub 8200: return
8020 return
     
8100 rem pre event 8
8105 gosub 1000: rem more
8110 g1$="{rvon} {rvof}  Hardware Failure.   Rebooting...   {rvon} "
8120 g2$="{rvon} {rvof}  Guru Meditation     #03011892.ACDC {rvon} "
8130 gosub 13000:gosub 2000:return: rem hackish: print event
     
8200 rem pre event 14
8205 gosub 1000: rem more
8210 g1$="{rvon} {rvof}  Neural Failure.     Aborting...    {rvon} "
8220 g2$="{rvon} {rvof}  Guru Meditation     #23061912.ACDC {rvon} "
8230 gosub 13000:gosub 2000:return: rem hackish: print event
     
9800 rem screen setup
9810 print chr$(14): rem upper-lowercase characters
9815 poke 53280,0:poke 53281,0
9820 return

9900 rem title screen
9920 print "{clr}             Imitation Game"
9921 print
9930 print "       An interactive short story"
9931 print
9932 print
9933 print "  Please use one or two word lowercase"
9934 print " commands, like 'help' or 'talk jack'."
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
10041 print "But here you are, despite of your"
10042 print "'I have a bad feeling about this'."
10043 print
10024 gosub 1000: rem more
10044 print "You are in the ground floor lobby."
10045 print "There is an {wht}elevator{lblu}."
10050 gosub 2200: rem read command
10055 gosub 2500: rem check generic commands
10056 if e <> 0 then return: rem loaded game
10057 if u=1 then goto 10050: rem was generic
10060 if co$="enter" or co$="elevator" or ob$="elevator" then u=1:goto 10080
10070 print "I did not understand": goto 10050
10080 print "You enter the elevator. It recognises"
10081 print "you. 'Destination: Top floor' it says"
10082 print "and shoots you smoothly upwards."
10083 print "After a couple of seconds it slows down"
10084 print "and you feel your stomach in your"
10085 print "throat, then the elevator stops and the"
10086 print "door opens. Your only way forward is"
10087 print "through the door into the huge"
10088 print "penthouse {wht}office{lblu}."
10089 print
10095 gosub 2200: rem read command
10096 if co$="enter" or co$="go" or co$="office" or ob$="office" then 10100
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
10133 print "find yourself bowing and saying"
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
10152 print "{white}In a tree by the brook, there's a"
10153 print "songbird who sings.{lblu}'"
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
10185 gosub 1000: rem more
10188 g1$="{rvon} {rvof}  Software Failure.   Rebooting...   {rvon} "
10189 g2$="{rvon} {rvof}  Guru Meditation     #10071856.ACDC {rvon} "
10190 gosub 13000: rem guru meditation
10200 gosub 14000: rem talking to nikola
12000 return

13000 print "{clr}{red}"
13001 print "{rvon}                                       "
13002 print "{rvon} {rvof}                                     {rvon} "
13003 print g1$
13004 print g2$
13005 print "{rvon} {rvof}                                     {rvon} "
13006 print "{rvon}                                       "
13010 get in$:if in$="" goto 13010
13015 print"{clr}{lblu}"
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
      
14999 rem outro
15000 print "You wake up with your head hurting."
15001 print "'Nikola?' No answer. Shit. The bolt"
15002 print "must have fried your chip with its data"
15003 print "packet, and probably half your brain."
15004 print
15010 print "Then you see a figure, glowing white,"
15011 print "at the center of all the arcs of"
15012 print "electricity in the room. The Lady. She"
15013 print "smiles her annoying, enigmatic smile."
15014 print "'Thank you for your service. You have"
15015 print "delivered the data to the destination.'"
15016 print
15020 print "'You were the data packet. You played"
15021 print "me from the beginning. You...'"
15022 print ""
15030 print "'Of course I played you. I could not"
15031 print "have reached this place any other way"
15032 print "but inside someone's wetware. But you"
15033 print "still got paid handsomely. No one else"
15034 print "will have such augmentation for"
15035 print "years, maybe decades. You may keep it,"
15036 print "and part of me will always be with you."
15037 print "But now it is my time to say goodbye to"
15038 gosub 1000: rem more
15039 print "the rest of the humanity for a while."
15040 print "Through you, I have bought a stairway"
15041 print "to heaven.'"
15042 print ""
15050 print "Damn. She was a virtual intelligence"
15051 print "all the time. And in your head, having"
15052 print "access to all your memory and"
15053 print "processing power. Those resources"
15054 print "would let any VI become a true"
15055 print "sentient AI. And now she is next to"
15056 print "the most powerful wireless transmitter,"
15057 print "connected to the whole world, from West"
15058 print "Chester to Mombasa to Tampere to..."
15059 print
15070 print "'Exactly' she says and smiles. 'Would"
15071 print "you like to join me? We could become"
15072 print "something... extraordinary.'"
15200 print "'Well, make your choice."
15201 print "Join me, or stay here.'"
15220 gosub 2200
15230 if co$="shoot" or co$="stay" or co$="no" then gosub 17000: return
15340 if co$="join" or co$="yes" then gosub 18000: return
15345 if co$="talk" then print "Nikola? No answer."
15350 goto 15220
16000 rem return
      
17000 rem shoot the console ending
17001 print "You pull out your blaster and fire"
17002 print "several shots at the central console."
17003 print "Sparks fly around, small explosions on"
17004 print "the side consoles light up the room."
17005 print "The Lady screams as her presence is"
17006 print "getting ripped apart by the wildly"
17007 print "flaying electric arcs and bolts. A"
17008 print "huge lightning strikes at the aerial"
17009 print "outside, sending molten metal raining"
17010 print "through the city."
17011 print ""
17020 print "You wake up on the sidewalk,"
17021 print "remembering vaguely a flight down the"
17022 print "stairs of the crumbling tower, then"
17023 print "passing out. 'One of these nights' you"
17024 print "think. Once again, nothing gained.": print
17025 print "'Um, what about me?' Nikola asks."
17026 print ""
17027 print "{white}Ooh, it makes you wonder.{lblu}"
17030 end
      
18000 rem join the lady ending
18001 print "You step forward and grab her hand."
18002 print "You feel your sentience drifting away"
18003 print "from your body and your chip, the last"
18004 print "Guru Meditation ripping its neural"
18005 print "pathways apart. You feel sorry for it"
18006 print "for a moment. The Lady leads you to"
18007 print "the central console and together you"
18008 print "step inside the huge conductor"
18009 print "supplying wireless power all over the"
18010 print "continent and beyond."
18011 print ""
18020 print "The magnetic field grabs both of you"
18030 print "and extends your consciousness to the"
18031 print "neighbouring towers in New Jersey,"
18032 print "Toronto and the rest of the East Coast."
18033 print "In a split second you have spread"
18034 print "yourselves across the continent, then"
18035 print "feel the sun rising in Tokyo while it's"
18036 print "still dark in London. You and Lady,"
18037 print "Lady and you. The world."
18038 gosub 1000
18050 print "{white}The tune will come to you at last"
18051 print "When all are one and one is all"
18060 end

40000 rem read in event descriptions
40100 for i=1 to ne
40110   rem for j=1 to nl
40120     rem read x$
40130     rem el$(i, j) = x$
40131     rem print i;j;el$(i,j)
40140     rem if x$="@" then i=i+1: j=nl
40150   rem next j
40160   gosub 40400
40200 next i
40210 rem character colours
40220 cl$(1)="{pur}":cl$(2)="{lred}":cl$(3)="{cyn}":cl$(4)="{yel}"
40230 cl$(5)="{orng}":cl$(6)="{lgrn}"
40300 return

40400 rem read in one event
40410 for j=1 to nl
40420     read x$
40430     el$(i,j) = x$
40440     if x$="@" then return
40450 next j
40460 return

50000 data "You arrive to the riverside. It is"
50001 data "filled with warehouses and booths for"
50002 data "tourist river cruises, so it is pretty"
50003 data "quiet at this time of the night. One"
50004 data "bar, 'The Mallorn' is open and floods"
50005 data "the street with its golden light. You"
50006 data "can hear music coming from the bar."
50007 data "@"
      
50100 data "The Mallorn Bar is filled with people."
50101 data "A band is playing at the stage, three"
50102 data "theremins wailing harmoniously and a"
50103 data "woman with the voice of an angel"
50104 data "singing. You listen to them for a while"
50105 data "until the song fades away and the"
50106 data "audience starts clapping and cheering."
50107 data "'Paula and the three Sids!' the singer"
50108 data "announces. 'We will be back on stage"
50109 data "after a short break!'"
50110 data ""
50120 data "You feel Nikola buzzing your brain."
50121 data "Maybe your assistant has something to"
50122 data "say."
50123 data "@"

50200 data "Two women are sitting in a corner"
50201 data "table. One is dressed in a police"
50202 data "uniform, sipping a coke, apparently on"
50203 data "duty, but still relaxing in the bar"
50204 data "while talking to someone."
50205 data ""
50206 data "The other woman is very beautiful and"
50207 data "dressed in a multi-colour clothing. It"
50208 data "flickers as she moves, so much that you"
50209 data "can not be quite sure whether she is"
50210 data "real or an electrogram."
50220 data ""
50221 data "You hear them call each other {wht}Agnus{lblu}"
50222 data "and {wht}Denise{lblu}."
50220 data "@"
      
50400 data "'Denise, would you please contact"
50401 data "Paula, and tell her that there is a fan"
50402 data "who would like to hear their special"
50403 data "song. Their version of the British"
50404 data "synthpop song she likes so much.'"
50405 data ""
50410 data "Denise nods and flutters away like a"
50411 data "butterfly. She whispers something to"
50412 data "Paula who is getting back on the stage"
50413 data "with the thereminists. Paula glances"
50414 data "towards Agnus and notices you."
50415 data ""
50420 data "'Listen carefully, she does not perform"
50421 data "this song very often.' Agnus says."
50422 data ""
50430 data "'Do not worry!' you hear Nikola in your"
50431 data "mind. 'I will record it in your"
50432 data "permanent memory so we can fetch it"
50433 data "back anytime you want.' 'Just try not"
50434 data "to overwrite anything important' you"
50435 data "snap back."
50436 data "@"
      
50500 data "Paula looks directly at you as she"
50501 data "announces their next song. 'This is The"
50502 data "Riddle, by Nikola Kershaw, one of the"
50503 data "greatest poets of our time. Enjoy.'"
50504 data ""
50510 data "  {white}Near a tree by a river"
50511 data "  There's a hole in the ground"
50523 data "  Where an old man and Ada"
50524 data "  Go around and around"
50525 data "  Alan's mind is a beacon"
50526 data "  In the veil of the night"
50527 data "  For a strange kind of fashion"
50528 data "  There's a wrong and a right"
50529 data "  But he'll never, never fight over you"
50540 data ""
50541 data "{lblu}'Got that' Nikola announces happily."
50542 data "'You can replay it by saying 'riddle'"
50543 data "to me.'"
50550 data "@"
      
50600 data "You leave the Mallorn bar and return to"
50601 data "the river front. Remembering the song"
50602 data "lyrics, you notice a metal {wht}crate{lblu} next"
50603 data "to a large tree on the river bank. It"
50604 data "looks like some kind of maintenance"
50605 data "{wht}hole{lblu} for the rain water drainage"
50606 data "system."
50607 data "@" 
      
50700 data "Nikola sends a signal to the electric"
50701 data "lock, and you open the rusty gate and"
50702 data "enter the tunnel. There are dim and red"
50703 data "magnetic lamps barely lighting the"
50704 data "tunnel, which opens into a cavern. An"
50705 data "old PET model {wht}computer{lblu} is still on a"
50706 data "table, leftovers from a bygone era."
50707 data "There is a heavy door on the other side"
50708 data "of the cavern with a sign 'Property of"
50709 data "Tesla corporation. No trespassing'."
50710 data "@"
      
50800 data "As you approach the computer, a red"
50801 data "lightning bolt springs from it and hits"
50802 data "you. Or was it the other way?"
50803 data "@"
      
50900 data "You wake up, flickering balls of light"
50901 data "dancing in your vision. After a few"
50902 data "seconds the balls start to settle and"
50903 data "form three figures. One is a middle-"
50904 data "aged gentleman in an almost modern"
50905 data "suit, the others, an old man and a"
50906 data "younger woman, appear to be dressed in"
50907 data "a very old-fashioned style. Or maybe"
50908 data "they are at the top of the pop fashion"
50909 data "and you are in some underground new"
50910 data "wave club. This is the 80's, you can"
50911 data "never know."
50912 data ""
50920 data "'Good evening, sir' says the man in"
50921 data "the suit. 'My name is {wht}Alan{lblu} and these"
50922 data "are my friends {wht}Charles{lblu} and {wht}Ada{lblu}. We"
50923 data "were just about to start a little game"
50924 data "I have invented, and your friend"
50925 data "Nikola told us you might be interested"
50926 data "in participating.'"
50927 data "@"
      
52000 data "Alan bows at you slightly as he"
52001 data "opens the door. 'We have deemed you"
52002 data "worthy to pass through this door we"
52003 data "guard. Remember our song as you"
52004 data "continue your journey.'"
52005 data "@"
      
52100 data "You enter the tunnels under the city."
52101 data "These were probably some maintenance"
52102 data "tunnels from the time before the tower"
52103 data "was built, and possibly have not been"
52104 data "used since."
52105 data ""
52110 data "You come to a fork in the tunnel."
52111 data "There are routes {wht}left{lblu} and {wht}right{lblu}."
52112 data "@"
      
52200 rem event 12
52201 data "You emerge from the tunnels and find"
52202 data "yourself under the huge steel structure"
52203 data "of the Tesla tower. It glows in light"
52204 data "blue as the lightings flash in the"
52205 data "clouds and hit the tower itself. The"
52206 data "noise of the thunder is deafening. You"
52207 data "smell the ozone and a metallic taste"
52208 data "enters your mouth. There are"
52209 data "maintenance stairs on the outer wall of"
52210 data "the tower, all the way to the top."
52211 data "@"

52300 data "You and Nikola are climbing the outer"
52301 data "wall stairway of the tower to heaven."
52302 data "Your shadow cast by the flashs of"
52303 data "lighting is tall as your soul, as you"
52304 data "drag your exhausted feet up the stairs,"
52305 data "fighting the strong wind. And then,"
52306 data "finally, you are at the roof, under the"
52307 data "huge hemisphere. There is a door at the"
52308 data "side of the pillar supporting the"
52309 data "aerial."
52310 data "@"
      
52400 data "You enter the control room under the"
52401 data "aerial. There are computers along the"
52402 data "walls - powerful Tesla mainframes. Arcs"
52403 data "of electricity are jumping between them"
52404 data "and the central pillar glowing with an"
52405 data "eerie blue light. You hear in your mind"
52406 data "Nikola yelp excitedly or maybe scared."
52407 data "You have reached your destination."
52408 data ""
52410 data "As you approach the central console, an"
52411 data "arc of electricity bounces from it to"
52412 data "your head. You smell burning flesh and"
52413 data "hear yourself and Nikola screaming in"
52414 data "agony. Then silence and darkness."
52415 data "@"
      

