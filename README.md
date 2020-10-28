```diff
# [Versión en español](README-ESP.md) 
```
[Versión en español](README-ESP.md) 

# Didactic pattern visualizer for Tidal Cycles 

Sound pattern visualizer programmed in Processing by the artist Ivan Abreu to study the potential and complexity of the syntax of the pattern system for sequencing <b>Tida Cycles</b> sounds, it is also a useful tool for composing having visual feedback of ordering and sound intensities and can be a fun visual software during the live act to unfold the musical composition and with them emphasize and direct attention to the subtleties that are semi-hidden in the multiple layers created by the artist.

#

Musical pattern created by electronic musician and digital artist <b>CNDSD</b>:

[![SC2 Video](https://ivanabreu.net/github/videomali.jpg)](https://ivanabreu.net/videos/soundpatternbycndsd.mp4 "Click to play >")

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

### Sending OSC messages to Processing.

You'll need execute tidal code in your editor (usually Atom) ...

```haskell

-- didactic pattern visualizer  
-- testing on TidalCycles 3.10.0

let targetdpv = Target {oName = "didacticpatternvisualizer",
                     oAddress = "127.0.0.1",
                     oPort = 1818,
                     oLatency = 0.2,
                     oWindow = Nothing,
                     oSchedule = Live
                    }
    formatsdpv = [OSC "/didacticpatternvisualizer"  Named {required = []} ]
    oscmapdpv = [(targetdpv, formatsdpv),
                 (superdirtTarget, [superdirtShape])
                 ]

    streamdpv <- startStream defaultConfig oscmapdpv

let grid = pS "grid"
    connectionN = pI "connectionN"
    connectionMax = pI "connectionMax"
    speedSequenser = pF "speedSequenser"

asap = streamOnce streamdpv

let d1 = streamReplace streamdpv 1
    d2 = streamReplace streamdpv 2
    d3 = streamReplace streamdpv 3
    d4 = streamReplace streamdpv 4
    d5 = streamReplace streamdpv 5
    
```

```haskell

-- didactic pattern visualizer  
-- testing on TidalCycles 3.14.1

import Sound.Tidal.Context

let targetdpv :: OSCTarget
    targetdpv = superdirtTarget {oName = "didacticpatternvisualizer",
                                oPort = 1818,
                                oLatency = 0.1,
                                oTimestamp = MessageStamp
                               }
    -- formatsdpv = [ OSC "/didacticpatternvisualizer"  Named {required = []} ]
    grid = pS "grid"
    connectionN = pI "connectionN"
    connectionMax = pI "connectionMax"
    speedSequenser = pF "speedSequenser"


tidal <- startMulti [superdirtTarget {oLatency = 0.1, oAddress = "127.0.0.1", oPort = 57120},
                     targetdpv
                    ]
         (defaultConfig {cFrameTimespan = 1/20})

let  p = streamReplace tidal
     hush = streamHush tidal
     list = streamList tidal
     mute = streamMute tidal
     unmute = streamUnmute tidal
     solo = streamSolo tidal
     unsolo = streamUnsolo tidal
     once = streamOnce tidal
     asap = once
     nudgeAll = streamNudgeAll tidal
     all = streamAll tidal
     resetCycles = streamResetCycles tidal
     setcps = asap . cps
     xfade i = transition tidal True (Sound.Tidal.Transition.xfadeIn 4) i
     xfadeIn i t = transition tidal True (Sound.Tidal.Transition.xfadeIn t) i
     histpan i t = transition tidal True (Sound.Tidal.Transition.histpan t) i
     wait i t = transition tidal True (Sound.Tidal.Transition.wait t) i
     waitT i f t = transition tidal True (Sound.Tidal.Transition.waitT f t) i
     jump i = transition tidal True (Sound.Tidal.Transition.jump) i
     jumpIn i t = transition tidal True (Sound.Tidal.Transition.jumpIn t) i
     jumpIn' i t = transition tidal True (Sound.Tidal.Transition.jumpIn' t) i
     jumpMod i t = transition tidal True (Sound.Tidal.Transition.jumpMod t) i
     mortal i lifespan release = transition tidal True (Sound.Tidal.Transition.mortal lifespan release) i
     interpolate i = transition tidal True (Sound.Tidal.Transition.interpolate) i
     interpolateIn i t = transition tidal True (Sound.Tidal.Transition.interpolateIn t) i
     clutch i = transition tidal True (Sound.Tidal.Transition.clutch) i
     clutchIn i t = transition tidal True (Sound.Tidal.Transition.clutchIn t) i
     anticipate i = transition tidal True (Sound.Tidal.Transition.anticipate) i
     anticipateIn i t = transition tidal True (Sound.Tidal.Transition.anticipateIn t) i
     forId i t = transition tidal False (Sound.Tidal.Transition.mortalOverlay t) i
     d1 = p 1 . (|< orbit 0)
     d2 = p 2 . (|< orbit 1)
     d3 = p 3 . (|< orbit 2)
     d4 = p 4 . (|< orbit 3)
     d5 = p 5 . (|< orbit 4)
     d6 = p 6 . (|< orbit 5)
     d7 = p 7 . (|< orbit 6)
     d8 = p 8 . (|< orbit 7)
     d9 = p 9 . (|< orbit 8)
     d10 = p 10 . (|< orbit 9)
     d11 = p 11 . (|< orbit 10)
     d12 = p 12 . (|< orbit 11)
     d13 = p 13
     d14 = p 14
     d15 = p 15
     d16 = p 16



let  setI = streamSetI tidal
     setF = streamSetF tidal
     setS = streamSetS tidal
     setR = streamSetI tidal
     setB = streamSetB tidal
     
``` 

### Visualize grids and time division 

Examples to set pattern in Tidal to view grid and time division<br>
#### <b>1 creates a thicker line.<br>0 creates a thinner line.</b>

Grid with <b>four times</b>

<img width="700px" src="https://ivanabreu.net/github/4t.jpg">

```haskell

s4 $ grid "1 0 0 0"

-- or

s4 $ grid "1 0!4"

```

Grid with <b>eight times</b>

<img width="700px" src="https://ivanabreu.net/github/8t.jpg">

```haskell

s4 $ grid "1 0 0 0 0 0 0 0"

-- or

s4 $ grid "1 0!7"

```

### Visualize sound pattern 

Examples to set pattern in Tidal to view <b>sound pattern</b><br>
You'll need put the function <b># connectionN n</b>, where <b>n</b> is the number of layer playing ("s" or "d")

Example 1:<br>
<img width="700px" src="https://ivanabreu.net/github/pattern1_1x4.jpg">

```haskell

do
  d1 $ s "bd cp" # connectionN 1
  d4 $ grid "1 0 0 0"

```

Example 2:<br>
<img width="700px" src="https://ivanabreu.net/github/pattern1_3x4.jpg">

```haskell

do
   d1 $ s "bd cp*3" # connectionN 1
   d4 $ grid "1 0 0 0"

```

Example 3:<br>
<img width="700px" src="https://ivanabreu.net/github/patternd1d2.jpg">

```haskell

do
   d1 $ s "bd(3,8)" # connectionN 1
   d2 $ s "hh(6,8)" # connectionN 2
   d4 $ grid "1 0 0 0 0 0 0 0"

```

Example 4:<br>
[![SC2 Video](https://ivanabreu.net/github/patternd1d2d3.jpg)](https://ivanabreu.net/videos/CNDSD_Ivan_Abreu-CODING_IN_ATYPICAL_PLACES.mp4 "Click to Watch >")

```haskell

do
  d1 $ s "bd(3,8)" # connectionN 1
  d2 $ s "hh(6,8)" # connectionN 2
  d3 $ s "supermandolin" # n "<[d4,e2,g2] [d4,e4,g2]?>" # connectionN 3
  d4 $ grid "1 0 0 0 0 0 0 0"

  -- In d3, notes are used in a transversal way (such as chords [d4,e2,g2]) 
  -- which appear in the same vertical line in the grid.
  -- Randomness is also used with the "?" Sign, so sometimes empty times appear.
  
```



### Contact or reports

Please share reports of success / failure with Ivan Abreu via email: data@ivanabreu.net or ivanabreuochoa@gmail.com
