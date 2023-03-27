# Install and configuration for Didactic pattern visualizer

## Summary
The Didactic pattern visualizer (DPV) consists of a set of code files developed as a sketchbook in the open source visualization program **Processing.** [Processing](https://processing.org/) is a "flexible software sketchbook" with a language for creating dynamic visual applications. It is easy to install and use. It requires an external library file for OSC and network functionality.

**Didactic pattern visualizer** is designed to receive OSC messages from TidalCycles, leveraging the ability in Tidal to configure an additional OSC target. Custom parameters are added to Tidal patterns that allow sound pattern output to be simultaneously sent to SuperDirt/SuperCollider (audio) and the Didactic pattern visualizer running in the Processing application. This uses the OSC configuration for "Multiple Targets" referenced in the Tidal User Documentation - [Configuration > I/O (MIDI, OSC) > OSC](https://tidalcycles.org/docs/configuration/MIDIOSC/osc).

### Installation steps

1. Download and install Processing - [Download Page](https://processing.org/download)  
2. Install the **oscP5** library
    - https://sojamo.de/libraries/oscP5/
    - Follow the install instructions - unzip and put the oscP5 folder in the **libraries** folder.
    - The libraries folder will be in the Processing Sketchbook. This is shown in the Preferences.
    - Default location Mac: `~/Documents/Processing/libraries`
    - Default location Windows: `My Documents'\Processing\libraries`

3. From Processing, open `didacticpatternvisualizer.pde`
    - This .pde file is in this repository `didacticpatternvisualizer/didacticpatternvisualizer.pde`
    - This should open a new Process window with 4 tabs, one for each file in the directory (dpv, Cycle, Sound, oscTidal).

4. Load the Tidal OSC connection configuration
    - Copy the Tidal configuration code from `GETTING-STARTED.md` and save it as a .tidal file.
    - After you have started Tidal, execute the code in your editor.
    - You may need to execute each code block separately.
    - When you start the tidal stream, you may get an error `Can't handshake with SuperCollider without control port.` You can ignore this.

5. In the Processing window, select the "Play" button (>). A new window should come up titled: **didacticpatternvisualizer**

6. Add DPV parameters to a Tidal pattern and execute. You should now see colorful patterns in the visualizer!
    - See the Readme.md for more examples.
    - Add `connectionN <num>` for each channel (d1, d2, d3, etc).
    - Add `connectionMax <num> # speedSequenser <num>`
    - Other parameters include `clear, sizeMin, sizeMax, figure, color`.

```Haskell
do
  asap $ connectionMax 2 # speedSequenser 4
  d5 $ grid "1 0 0 0"
  d1 $ s "bd!2 cp hh27:4*2" # connectionN 1
```

```Haskell
do
  asap $ connectionMax 3 # speedSequenser 4
  d5 $ grid "1 0!15"
  d1 $ s "bd(3,8)" # connectionN 1
  d2 $ s "hh(6,8)" # connectionN 2
  d3 $ every 3 ( density 8 ) $ density 2 $ n "<[d4,e2,g2] [d4,e4,g2]?>"
     # s "superfork"  # connectionN 3
```
