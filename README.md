<font size="-3">english version [version en español mas abajo]</font>

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

Examples to set pattern in Tidal to view grid and time division


Grid with <b>four times</b>

<img width="700px" src="https://ivanabreu.net/github/4t.jpg">

```haskell

s4 $ grid "1 0 0 0"

or

s4 $ grid "1 0!4"

```

Grid with <b>eight times</b>

<img width="700px" src="https://ivanabreu.net/github/8t.jpg">

```haskell

s4 $ grid "1 0 0 0 0 0 0 0"

or

s4 $ grid "1 0!7"

```



### Contact or reports

Please share reports of success / failure with Ivan Abreu via email: data@ivanabreu.net or ivanabreuochoa@gmail.com
