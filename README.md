```diff
# English version (versión en español mas abajo)
```


# Didactic pattern visualizer for Tidal Cycles 

Sound pattern visualizer in Processing

#

### Sending OSC messages to Processing.

You'll need execute tidal code in your editor (usually Atom) ...

```haskell

let targetdpv = Target {oName = "didacticpatternvisualizer",
                     oAddress = "127.0.0.1",
                     oPort = 1818,
                     oLatency = 0.2,
                     oWindow = Nothing,
                     oSchedule = Live
                    }
    formatsdpv = [OSC "/didacticpatternvisualizer"  Named {required = []} ]
    oscmapdpv = [(targetdpv, formatsdpv)]
    
    streamdpv <- startStream defaultConfig oscmapdpv
    
let grid = pS "grid"
    connectionN = pI "connectionN"

let s1 = streamReplace streamdpv 1
    s2 = streamReplace streamdpv 2
    s3 = streamReplace streamdpv 3
    s4 = streamReplace streamdpv 4
    
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
  d1 $ s "bd cp"
  s1 $ s "bd cp" # connectionN 1
  s4 $ grid "1 0 0 0"

```

Example 2:<br>
<img width="700px" src="https://ivanabreu.net/github/pattern1_3x4.jpg">

```haskell

do
   d1 $ s "bd cp*3"
   s1 $ s "bd cp*3" # connectionN 1
   s4 $ grid "1 0 0 0"

```

Example 3:<br>
<img width="700px" src="https://ivanabreu.net/github/patternd1d2.jpg">

```haskell

do
   d1 $ s "bd(3,8)"
   s1 $ s "bd(3,8)" # connectionN 1
   d2 $ s "hh(6,8)"
   s2 $ s "hh(6,8)" # connectionN 2
   s4 $ grid "1 0 0 0 0 0 0 0"

```

Example 4:<br>
<!-- <img width="700px" src="https://ivanabreu.net/github/patternd1d2d3.jpg"> -->
[![SC2 Video](https://ivanabreu.net/github/patternd1d2d3.jpg)](https://ivanabreu.net/videos/CNDSD_Ivan_Abreu-CODING_IN_ATYPICAL_PLACES.mp4 "Click to Watch >")

```haskell

do
  d1 $ s "bd(3,8)"
  s1 $ s "bd(3,8)" # connectionN 1
  d2 $ s "hh(6,8)"
  s2 $ s "hh(6,8)" # connectionN 2
  d3 $ s "supermandolin" # n "<[d4,e2,g2] [d4,e4,g2]?>" # room 0.8 # legato 3
  s3 $ s "supermandolin" # n "<[d4,e2,g2] [d4,e4,g2]?>" # connectionN 3
  s4 $ grid "1 0 0 0 0 0 0 0"

  -- In d3, notes are used in a transversal way (such as chords [d4,e2,g2]) which appear in the same vertical line in the reticule. Randomness      is also used with the "?" Sign, so sometimes empty times appear.
  
```



### Contact or reports

Please share reports of success / failure with Ivan Abreu via email: data@ivanabreu.net or ivanabreuochoa@gmail.com
