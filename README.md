# Didactic pattern visualizer for Tidal Cycles
Sound pattern visualizer in Processing


[![Watch the video](https://ivanabreu.net/images/live-cinema-coding-isea-2019-07-ivan-abreu-artist.jpg)](https://www.youtube.com/watch?v=oyO9hwsSlv0&t=5s)

# p5dirt

Sending OSC messages to processing.

You'll need execute tidal code in your editor (usually Atom) ...

```haskell
:{
tidal <- startMulti [superdirtTarget {oLatency = 0.2, oAddress = "127.0.0.1", oPort = 57120
                                     },
                     superdirtTarget {oLatency = 0.2, oAddress = "127.0.0.1", oPort = 2020,
                                      oTimestamp = NoStamp
                                     }
                    ] (defaultConfig {cFrameTimespan = 1/20})
:}
```

Then the included processing example will visualise events in each orbit as binary transitions.
