[Versión en español (en proceso...)](README-ESP.md) 

# Didactic pattern visualizer for Tidal Cycles using Processing 

Sound pattern visualizer programmed in Processing by the artist Ivan Abreu to study the potential and complexity of the syntax of the pattern system for sequencing <b>Tida Cycles</b> sounds, it is also a useful tool for composing having visual feedback of ordering and sound intentions and can be a fun visual software during the live act to unfold the musical composition and with them emphasize and direct attention to the subtleties that are semi-hidden in the multiple layers created by the artist.

<a href="https://tidalcycles.org/" target="_blank">Tidal Cycles</a> is a free/open source software, that allows you to make patterns with code, whether live coding music at algoraves or composing in the studio, created by Alex McLean.

#

Musical pattern example:

[![SC2 Video](https://ivanabreu.net/github/videoivan.jpg)](https://ivanabreu.net/github/soundpatternbyivanabreu01.mp4 "Click to play >")

```haskell

do
  asap $ connectionMax 3 # speedSequenser 4
  d5 $ grid "1 0!15"
  d1 $ s "bd(3,8)" # connectionN 1
  d2 $ s "hh(6,8)" # connectionN 2
  d3 $ every 3 ( density 8 ) $ density 2 $ n "<[d4,e2,g2] [d4,e4,g2]?>" 
     # s "superfork"  # connectionN 3

```


Musical pattern created by electronic musician and digital artist <b>CNDSD</b>:


[![SC2 Video](https://ivanabreu.net/github/videomali.jpg)](https://ivanabreu.net/github/soundpatternbycndsd.mp4 "Click to play >")

Code from previous video by <b>CNDSD</b>, using only defaults samples of TidalCycles:

```haskell
do
 asap $ connectionMax 5 # speedSequenser 2
 d5 $ slow 0.75 $ grid "1 0!8"
 d1 $ qtrigger 1 $ seqPLoop [
    (0,8, slow 0.75 $ cat [
    sometimesBy 0.15 (#crush 6)$ s "[bd(5,9),[superhat(2,9)]/2]"
    # n "[[2 4],[g5 ,b6 ,a3]]"  # accelerate 0.8 # note "[f5] g2" # gain (slow 2 $ range 0.9 1.2 $ sine) #connectionN 1,
    sometimesBy 0.25 (# speed "[[1 0.8],[1.5 2]*2]") $ s "[yeah(3,9),notes(7,9)]" # n "[[2][a4 ,d7 g6]b3]" # gain "1.2" #connectionN 2,
    sound "[print(2,9)]/4" # n "3" # gain "1.2" #room 0.1 #connectionN 3,
    sound " ~ ~ [sax]/12" # n "2" # gain "1.2" # legato 3 #room 0.5 #connectionN 4,
    sound "{super808 ~ ~ ~ ~ ~}%1.5" # n "g2" # gain "1.5" # legato 4 #room 1 #connectionN 5] ),
    (8,24, slow 0.75 $ stack [
    sometimesBy 0.15 (#crush 6)$ s "[bd(5,9),[superhat(2,9)]/2]"
    # n "[[2 4],[g5 ,b6 ,a3]]"  # accelerate 0.8 # note "[f5] g2" # gain (slow 2 $ range 0.9 1.2 $ sine) #connectionN 1,
    sometimesBy 0.25 (# speed "[[1 0.8],[1.5 2]*2]") $ s "[yeah(3,9),notes(7,9)]" # n "[[2][a4 ,d7 g6]b3]" # gain "1.2" #connectionN 2,
    sound "[print(2,9)]/4" # n "3" # gain "1.2" #room 0.1 #connectionN 3,
    sound " ~ ~ [sax]/12" # n "2" # gain "1.2" # legato 3 #room 0.5 #connectionN 4,
    sound "{super808 ~ ~ ~ ~ ~}%1.5" # n "g2" # gain "1.5" # legato 4 #room 1 #connectionN 5] )
    ] 
    
```
#
[Sending OSC messages to Processing (Getting started)](GETTING-STARTED.md)
#


### Visualize grids, time division and numbers of conecctions (layers or tracks) 

Examples to set pattern in Tidal to view grid and time division<br>
#### <b>1 creates a thicker line.<br>0 creates a thinner line.</b>

Grid with <b>four times</b>

<img src="https://ivanabreu.net/github/4t.jpg">

```haskell

d5 $ grid "1 0 0 0"

-- or

d5 $ grid "1 0!3"

```

Grid with <b>eight times</b>

<img src="https://ivanabreu.net/github/8t.jpg">

```haskell

d5 $ grid "1 0 0 0 0 0 0 0"

-- or

d5 $ grid "1 0!7"

```

#### Change the connection number you want to view and the speed of the sequencer animation.

* this instruction does not need to be sent with the cycles, so <b>asap</b> only sends it once.

<b>Two</b> connections

<img src="https://ivanabreu.net/github/twoconnections.jpg">

```haskell

asap $ connectionMax 2 # speedSequenser 2

```

<b>Six</b> connections

<img src="https://ivanabreu.net/github/sixconnections.jpg">

```haskell

asap $ connectionMax 6 # speedSequenser 2

```

<b>twelve</b> connections

<img src="https://ivanabreu.net/github/twelveconnections.jpg">

```haskell

asap $ connectionMax 12 # speedSequenser 2

```




### Visualize sound pattern 

Examples to set pattern in Tidal to view <b>sound pattern</b><br>
You'll need put the function <b># connectionN n</b>, where <b>n</b> is the number of layer or connection, example: d1, d2, d3.

1. Simple pattern example :

[![SC2 Video](https://ivanabreu.net/github/patternsimple01play.jpg)](https://ivanabreu.net/github/patternsimple01.mp4 "Click to play >")

```haskell

do
  asap $ connectionMax 2 # speedSequenser 4
  d5 $ grid "1 0 0 0"
  d1 $ s "bd cp" # connectionN 1

```

2. Simple pattern example :

[![SC2 Video](https://ivanabreu.net/github/patternsimple02play.jpg)](https://ivanabreu.net/github/patternsimple02.mp4 "Click to play >")

```haskell

do
  asap $ connectionMax 2 # speedSequenser 4
  d5 $ grid "1 0 0 0 0 0 0 0"
  d1 $ s "bd cp*4" # connectionN 1

```

3. Euclidian pattern example :

[![SC2 Video](https://ivanabreu.net/github/patterneuclidianplay.jpg)](https://ivanabreu.net/github/patterneuclidian.mp4 "Click to play >")

```haskell

do
  asap $ connectionMax 2 # speedSequenser 4
  d5 $ grid "1 0!7"
  d1 $ s "bd(3,8)" # connectionN 1
  d2 $ s "hh(6,8)" # connectionN 2

```

4. Pattern contracting and expanding time with a saw wave:

[![SC2 Video](https://ivanabreu.net/github/patterncpsplay.jpg)](https://ivanabreu.net/github/patterncps.mp4 "Click to play >")

```haskell

do
  asap $ qtrigger 1 $ connectionMax 2 # speedSequenser 2
  d5 $ grid "1 0!15"
  d1 $ note "{0!8 3 2!8 4 3 3 2!4}%16" # sound "bd" # gain (range 1.1 0.4 saw)
     # cps (slow 16 (range 2 0.125 saw)) # connectionN 1
  d2 $ note "0(5,16)" # sound "superhat" # gain (range 1.1 0.4 saw) # connectionN 2
  
```



### Contact or reports

Please share reports of success / failure with Ivan Abreu via email: data@ivanabreu.net or ivanabreuochoa@gmail.com
