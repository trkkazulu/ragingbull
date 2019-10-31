<Cabbage> bounds(0, 0, 0, 0)
form caption("Raging Bull") size(400, 300), colour(58, 110, 182), pluginid("def1")
rslider bounds(10, 6, 100, 100), channel("bruise"), range(40, 1000, 1000, 1, 0.01), text("Bruise"), trackercolour(0, 255, 0, 255), outlinecolour(0, 0, 0, 50), textcolour(0, 0, 0, 255)
rslider bounds(100, 4, 100, 100), channel("flash"), range(0, 1, 0, 1, 0.01), text("Flash"), trackercolour(0, 255, 0, 255), outlinecolour(0, 0, 0, 50), textcolour(0, 0, 0, 255)
rslider bounds(200, 4, 100, 100), channel("fresh"), range(0, 1, 0, 1, 0.01), text("Fresh"), trackercolour(0, 255, 0, 255), outlinecolour(0, 0, 0, 50), textcolour(0, 0, 0, 255)
rslider bounds(300, 4, 100, 100), channel("gain"), range(0, 1, 0, 1, 0.01), text("Gain"), trackercolour(0, 255, 0, 255), outlinecolour(0, 0, 0, 50), textcolour(0, 0, 0, 255)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d 
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1


instr 1
kGain chnget "gain"
kLoFrq chnget "bruise"
kRes chnget "flash"

;a1 inch 1
;a2 inch 2


a1 diskin2 "bassClipCR.wav", 1,0,1

aLoFreq moogladder a1, kLoFrq, kRes 

outs aLoFreq*kGain, aLoFreq*kGain
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
