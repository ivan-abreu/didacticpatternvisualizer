# Didactic pattern visualizer for Tidal Cycles
Sound pattern visualizer in Processing
<hr>
### Sending OSC messages to Processing.

You'll need execute tidal code in your editor (usually Atom) ...

```haskell

let targetdpv = Target {oName = "didacticpatternvisualizer",
                     oAddress = "127.0.0.1", -- 192.168.0.102  127.0.0.1
                     oPort = 1818,
                     oLatency = 0.2,
                     oWindow = Nothing,
                     oSchedule = Live
                    }
    formatsdpv = [OSC "/didacticpatternvisualizer"  Named {required = []} ]
    oscmapdpv = [(targetdpv, formatsdpv)]
    
    streamdpv <- startStream defaultConfig oscmapdpv
    
let tempo = pS "tempo"
    timestamp = pS "timestamp"
    connectionN = pI "connectionN"

let s1 = streamReplace streamdpv 1
    s2 = streamReplace streamdpv 2
    s3 = streamReplace streamdpv 3
    s4 = streamReplace streamdpv 4
    
```

### Contact or reports

Please share reports of success / failure with Ivan Abreu via email: data@ivanabreu.net or ivanabreuochoa@gmail.com
