# Tobias Mueller -   October, 2017
## On Spillovers and Fiscal Multipliers in the Euro Area: Sticky Prices vs. Sticky Information

________________________________________________

````
The document provides a short explanation on how to run the Dynare Code to replicate the results of the Master Thesis.
The code was run with Dynare 4.5.1 and MATLAB_R2017a for Windows.
````
________________________________________________

````
It is important to save all attached Mod-Files into the same directory.
The baseline model is written in the file "nk_two_country_currency_union_model.mod".

Run the command "dynare nk_two_country_currency_union_model.mod noclearall" in Matlab.
Note: Return to baseline calibration after each simulation to avoid confusion.
````
________________________________________________

###   Sticky Prices

####  To obtain Figure 1A) of the paper:
1.  Run the simulation three times:
      - Baseline Calibration
      - Switch on line 42 for higher trade share
      - Switch on line 37 for faster price adjustment/ information diffusion


####  To obtain Figure 1B) of the paper:
1.  Comment in line 580 of the code:  @#include "Figure 1B.mod"
2.  Run the simulation three times:
      - Baseline Calibration
      - Switch on line 42 for higher trade share
      - Switch on line 37 for faster price adjustment/ information diffusion


####  To obtain the impulse respones of the paper:
1.  Comment in line 581 of the code:  @#include "Impulse Response Government Spending Shocks.mod" to get the isolated impulse responses of a government spending hike in the core
2.  Comment in line 582 of the code:  @#include "Impulse Response Consumption Taste Shock.mod" to get the impulse responses of an adverse taste shocke

####  To obtain the step function under sticky prices of the paper:
1.  Comment in line 583 of the code: @#include "Step function Sticky Prices.mod"
2.  Run the simulation three times:
      - Baseline Calibration
      - Switch on line 42 for higher trade share
      - Switch on line 37 for faster price adjustment/ information diffusion
3.  After simulating the model three times, copy and paste the whole content of the file “Step function - Plotting Sticky Prices.mod” into the Matlab console and press enter.


________________________________________________

### Sticky Infomation

#### Follow the same procedure for the sticky information price-setting

1.  Switch on sticky information price dynamics in line 32
2.  To get Figure 1B with faster information diffusion change the adverse taste shock in line 318 to -15


####  To obtain the figure "Stepwise Inclusion of Lagged Expectations" of the paper:
1.  Define the loop, respectively the truncation point (Vector of Length [1:X]) for the number of lagged expectations in line 61
2.  Adjust the legend depending on the trunctation point in line 33 of the file "Stepwise Inclusion of Lagged Expectations.mod"
3.  Comment in line 585 of the code: @#include "Stepwise Inclusion of Lagged Expectations.mod"
4.  Run the simulation varying the truncation point


####  To obtain the step function under sticky information of the paper:
1.  Execute first the simulations under sticky prices as described above
      - Necessary to get afterwards the comparison between the sticky-price fiscal multiplier and the sticky-information fiscal multiplier
2.  Comment in line 586 of the code: @#include "Step function Sticky Information.mod"
3.  Run the simulation three times:
      - Baseline Calibration
      - Switch on line 42 for higher trade share
      - Switch on line 37 for faster price adjustment/ information diffusion
4.  After simulating the model three times, copy and paste the whole content of the file “Step function - Plotting Sticky Information.mod” into the Matlab console and press enter.

####  To obtain the sensitivity analysis of the paper:
1.  Switch on sticky information price dynamics in line 32
2.  Comment in line 588 of the code: @#include "Sensitivity Analysis.mod"

    a)  
        - Switch on line 49 for the sensitivity analysis of the information rigidity parameter
        - Open the .mat file: dynare_loop_sensitivity_si
        - Run the simulation in Matlab

    b)
        - Switch on line 52 for the sensitivity analysis of the price mark-up
        - Open the .mat file: dynare_loop_sensitivity_markup
        - Run the simulation in Matlab

Written by: Tobias Mueller, October 2017, email: tobias.mueller.1991@gmail.com
