# Assignment_1

1909176  Shengyi Wei

## Description

Implemented a countdown timer with a maximum of 60 minutes. In set mode, seconds display as 0 and minutes can be adjusted. In GO mode, countdown is in seconds.



## Detail Requirement

1. count down
2. 3 buttons: up, down, centre (L, R, U, D, C)
4. press C like pause, seconds also won’t reset 0  
5. when press U or D, which means edit minutes, seconds should reset 0  
6. In ‘Run’ mode, only C can be used to pause 
7. Initial input is (others=>'0'), once press C, will only get changed feedback input



## Implementation

Designed a multi-module system with a default clock of 100MHz that generates a 1Hz clock signal. The system includes separate modules for setting and running the timer, and the output is displayed on a seven-segment display. 

Setting module: Designed with up and down buttons for incrementing and decrementing, and includes carry control.

Running module: Countdown is in 1-second units, with carry control, and output displayed on the seven-segment display.