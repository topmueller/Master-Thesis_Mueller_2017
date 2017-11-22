////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                                                                                                                         //
// Tobias Mueller                                                                                                             //
// October 2017                                                                                                               //
//                                                                                                                            //
// Master Thesis:                                                                                                             //
// On Spillovers and Fiscal Multipliers in the Euro Area:                                                                     //
// Sticky Prices vs. Sticky Information                                                                                       //
//                                                                                                                            //
//                                                                                                                            //
// Replication of Oliver Blanchard, Christopher J. Erceg and Jesper Linde (2016):                                             //
// "Jump Starting the Euro Area Recovery: Would a Rise in Core Fiscal Spending Help the Periphery?"                           //
// and Modification of the Pricing Mechanism with Sticky Information                                                          //
//                                                                                                                            //
// Standard Log-Linearized Version of the New Keynesian Model of a Currency Union with Zero lower Bound                       //
// Monetary Policy follows a Taylor Rule after exit from the Zero Lower Bound                                                 //
// Makes Restrictive Assumptions that Government Spending Shock and Taste Shock are Moving-Average (MA) Processes             //                                                                                                                           //
//                                                                                                                            //
// Dynare 4.5.1 and MATLAB R2017a are used for Computations                                                                   //
//                                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////
//                  Model Settings                   //
///////////////////////////////////////////////////////

//Switch On (1) and Off (0) between Various Model Settings
//Sticky Prices vs. Sticky Information
// 0 = Sticky Prices
// 1 = Sticky Information
@#define phillips_curve = 0

//Slow vs. Faster Price Adjustment / Information Diffusion
// 0 = Slow Price Adjustment / Information Diffusion (xi=0.93)
// 1 = Faster Price Adjustment / Information Diffusion (xi=0.88)
@#define price_adjustment = 0

//Varying the Degree of Import Content of Government Spending
// 0 = No Import Content (omegagov=0 ;omegagovstar=0)
// 1 = 20 Percent Import Content (omegagov=0.4 ;omegagovstar=0.2)
@#define import_content = 0


//Sensitivity Analysis Calvo Parameter
@#define sensitivity_calvo = 0

//Sensitivity Analysis Information Rigidity Parameter
@#define sensitivity_si = 0

//Sensitivity Analysis Mark-up over Marginal Costs
@#define sensitivity_markup = 0

//Sensitivity Analysis Trade Share
@#define sensitivity_trade = 0

//Sensitivity Analysis Monetary Policy
@#define sensitivity_monetary_policy = 0

//Define the Loop and the Truncation Point - Vector of Length [1:X] for Lagged Expectations
@#define lags = [1:10]



///////////////////////////////////////////////////////
//            List Endogenous Variables              //
///////////////////////////////////////////////////////

var
//Currency Union
      x_gap_CU          $x^{CU}$                (long_name='CU Output Gap')
      pi_CU             $\pi^{CU}$              (long_name='CU Consumer Price Inflation')
      i_CU              $i^{CU}$                (long_name='CU Nominal Interest Rate')
      ypot_CU           $y^{CU,pot}$            (long_name='CU Potential Output')
      rpot_CU           $r^{CU,pot}$            (long_name='CU Potential Real Interest Rate')
      mc_CU             $mc^{CU}$ 	            (long_name='CU Marginal Costs')
      y_CU              $y^{CU}$                (long_name='CU Output')
      con_CU            $c^{CU}$                (long_name='CU Consumption')
      r_CU              $r^{CU}$                (long_name='CU Real Interest Rate')

      conshk_CU         $\nu^{CU}$              (long_name='CU Consumption Taste Shock')
      govshk_CU         $g^{CU}$                (long_name='CU Government Spending Shock')
      techshk_CU        $z^{CU}$                (long_name='CU Technology Shock')


//Core Economy
      y_D               $y_D$                   (long_name='Core Output')
      con_D             $c$                     (long_name='Core Consumption')
      lambdac_D         $\lambda_c$             (long_name='Core Marginal Utility of Consumption')
      pi_D              $\pi$                   (long_name='Core Inflation')
      mc_D              $mc$                    (long_name='Core Marginal Costs')
      nx_D              $nx$                    (long_name='Core Exports')
      n_D               $n$                     (long_name='Core Hours Worked')

      conshk_D          $\nu$                   (long_name='Core Consumption Taste Shock')
      govshk_D          $g$                     (long_name='Core Government Spending Shock')
      techshk_D         $z$                     (long_name='Core Technology Shock')


//Periphery Economy
      y_F               $y_D^{\ast}$            (long_name='Periphery Output')
      con_F             $c^{\ast}$              (long_name='Periphery Consumption')
      lambdac_F         $\lambda_c^{\ast}$      (long_name='Periphery Marginal Utility of Consumption')
      pi_F              $\pi^{\ast}$            (long_name='Periphery Inflation')
      mc_F              $mc^{\ast}$             (long_name='Periphery Marginal Costs')
      nx_F              $nx^{\ast}$             (long_name='Periphery Exports')
      n_F               $n^{\ast}$              (long_name='Periphery Hours Worked')

      conshk_F          $\nu^{\ast}$            (long_name='Periphery Consumption Taste Shock')
      govshk_F          $g^{\ast}$              (long_name='Periphery Government Spending Shock')
      techshk_F         $z^{\ast}$              (long_name='Periphery Technology Shock')


//Difference Equations
      tau               $\tau$                  (long_name='Terms of Trade')

      y_dif             $\Delta y^{D-F}$        (long_name='Core and Periphery GDP Differential')
      pi_dif            $\Delta \pi^{D-F}$      (long_name='Inflation Differential')
      con_dif           $\Delta c^{D-F}$        (long_name='Consumption Differential')
      mc_dif            $\Delta mc^{D-F}$       (long_name='Core and Periphery Marginal Costs Differential')


//Auxiliary Equations for Sticky Information
@#if phillips_curve
      w                 $w$                     (long_name='Auxiliary Equation for Sticky Information Inflation and Marginal Costs')
      x                 $x$                     (long_name='Auxiliary Equation for Sticky Information Inflation and Output Gap')
      y                 $y$                     (long_name='Auxiliary Equation for Sticky Information Inflation Differential')
@#else
@#endif
      ;



///////////////////////////////////////////////////////
//                 Exogenous Shocks                  //
///////////////////////////////////////////////////////

varexo
//Shocks to the Currency Union
      eps_con_CU        $\varepsilon_c^{CU}$    (long_name='Currency Union Consumption Taste Shock')
//    eps_gov_CU        $\varepsilon_g^{CU}$    (long_name='Currency Union Government Spending Shock')     [not part of the model, as euro area no fiscal union]
      eps_tech_CU       $\varepsilon_z^{CU}$    (long_name='Currency Union Technology Shock')

//Shocks to the Core
      eps_con_D         $\varepsilon_c^{D}$     (long_name='Core Consumption Taste Shock')
      eps_gov_D         $\varepsilon_g^{D}$     (long_name='Core Government Spending Shock')
      eps_tech_D        $\varepsilon_z^{D}$     (long_name='Core Technology Shock')

//Shocks to the Periphery
      eps_con_F         $\varepsilon_c^{F}$     (long_name='Periphery Consumption Taste Shock')
      eps_gov_F         $\varepsilon_g^{F}$     (long_name='Periphery Government Spending Shock')
      eps_tech_F        $\varepsilon_z^{F}$     (long_name='Periphery Technology Shock')
      ;



///////////////////////////////////////////////////////
//            List Structural Parameters             //
///////////////////////////////////////////////////////

parameters
      beta              $\beta$                 (long_name='Discount Factor')
      alpha             $\alpha$                (long_name='Capital Share')
      sigma             $\sigma$                (long_name='Inverse of EIS of Labor')
      chi               $\chi$                  (long_name='Inverse of Frisch Elasticity')
      varkappa          $\varkappa$             (long_name='Habit Paramenter')
      theta_p           $\theta_p$              (long_name='Elasticity of Supply between Different Goods')

      shrgy             $g_y$                   (long_name='Government Share of Steady-State Output')
      shrcy             $c_y$                   (long_name='Consumption Share of Steady-State Output')

      nuc               $\nu_c$                 (long_name='Scale Parameter on Consumption Taste Shock')

      xi1               $\xi_1$                 (long_name='Calvo Price Paramenter')
      xi2               $\xi_2$                 (long_name='Sticky Information Parameter')


      psi_pi            $\psi_{\pi}$            (long_name='Taylor Rule Feedback on Expected Inflation')
      psi_xgap          $\psi_{x}$              (long_name='Taylor Rule Feedback on Output Gap')

      zeta              $\zeta$                 (long_name='Country Size Paramenter Core Economy')
      zetastar          $\zeta^{\ast}$          (long_name='Country Size Paramenter Periphery Economy')

      omegacon          $\omega_C$              (long_name='Import Share on Private Consumption Core Economy')
      omegaconstar      $\omega_C^{\ast}$       (long_name='Import Share on Private Consumption Periphery Economy')
      omegacony         $\omega_{cy}$           (long_name='Weighted Import Share on Private Consumption')

      omegagov          $\omega_G$              (long_name='Import Share on Government Services Core Economy')
      omegagovstar      $\omega_G^{\ast}$       (long_name='Import Share on Government Services Periphery Economy')
      omegagovy         $\omega_{gy}$           (long_name='Weighted import share on government services')

      epsiloncon        $\epsilon_c$            (long_name='Trade Price Elasticity on Private Consumption')
      epsilongov        $\epsilon_g$            (long_name='Trade Price Elasticity on Government Services')
      epsilon           $\epsilon$              (long_name='Weighted Average of the Import Price Sensitivity of Private Consumption and Government Services')

      pibar             $\bar{\pi}$             (long_name='Steady State Nominal Interest Rate')
      ibar              $\bar{i}$               (long_name='Zero Lower Bound Nominal Interest Rate')

      sigma_hat         $\hat{\sigma}$          (long_name='Intertemporal Elasticity of Substitution')
      kappa_mc          $\kappa_{mc}$           (long_name='Slope of the Phillips Curve')
      phi_x             $\phi_x$                (long_name='Composite Parameter Output Gap')
      theta             $\theta$                (long_name='Composite Parameter on Potential Output and Real Interest Rate')
      mu                $\mu$                   (long_name='Composite Parameter for Sticky Information')

      sig_con_CU        $\sigma_c^{CU}$         (long_name='Std of Consumption Taste Shock Currency Union')
      sig_gov_CU        $\sigma_g^{CU}$         (long_name='Std of Government Spending Shock Currency Union')
      sig_tech_CU       $\sigma_z^{CU}$         (long_name='Std of Technology Shock Currency Union')

      sig_con_D         $\sigma_c$              (long_name='Std of Consumption Taste Shock Core')
      sig_gov_D         $\sigma_g$              (long_name='Std of Government Spending Shock Core')
      sig_tech_D        $\sigma_z$              (long_name='Std of Technology Shock Core')

      sig_con_F         $\sigma_c^{\ast}$       (long_name='Std of Consumption Taste Shock Periphery')
      sig_gov_F         $\sigma_g^{\ast}$       (long_name='Std of Government Spending Shock Periphery')
      sig_tech_F        $\sigma_z^{\ast}$       (long_name='Std of Technology Shock Periphery')
      ;



///////////////////////////////////////////////////////
//               Initialize Parameters               //
///////////////////////////////////////////////////////

beta         =  0.99875          ;        // Discount Factor
alpha        =  0.3              ;        // Capital Share; consequently (1 - alpha) = Labor Share
sigma        =  1                ;        // Intertemporal Elasticity of Substitution in Consumption
chi          =  2.5              ;        // Inverse of Frisch Elasticity of Labor Supply
varkappa     =  0.8              ;        // Habit Parameter

//Sensitivity Analysis
//Loop over Mark-up Parameter
@#if sensitivity_markup
load parameterfile_markup;
set_param_value('theta_p',theta_p);
@#else
theta_p      =  0.05             ;        // Elasticity of Supply between Different Goods; (1 + theta_p) = 5% mark-up over marginal costs
@#endif

shrcy        =  0.77             ;        // Consumption Share of Steady-State Output
shrgy        =  0.23             ;        // Government Share of Steady-State Output; (1 - shrcy)

nuc          =  0.01             ;        // Scale Parameter on the Consumption Taste Shock

//Sensitivity Analysis
//Loop over Price-Setting Parameter
//Calvo Pricing
@#if sensitivity_calvo
load parameterfile_calvo;
set_param_value('xi1',xi1);
@#else
@#if price_adjustment
//xi1        =  0.667            ;        // 3  Quarter Mean Duration of Price Contracts
//xi1        =  0.75             ;        // 4  Quarter Mean Duration of Price Contracts
xi1          =  0.88             ;        // 8 1/3 Quarter Mean Duration of Price Contracts
@#else
xi1          =  0.93             ;        // 14,29 Quarter Mean Duration of Price Contracts
@#endif
@#endif

//Sensitivity Analysis
//Loop over Price-Setting Parameter
//Sticky Information
@#if sensitivity_si
load parameterfile_si;
set_param_value('xi2',xi2);
@#else
@#if price_adjustment
//xi2        =  0.75             ;        // Probability of New Information Arrival
xi2          =  0.88             ;        // Probability of New Information Arrival (Fast Information Diffusion)
@#else
xi2          =  0.93             ;        // Probability of New Information Arrival (Slow Information Diffusion)
@#endif
@#endif

//Sensitivity Analysis
//Loop over Monetary Policy Parameters
@#if sensitivity_monetary_policy
load parameterfile_monetary_policy;
set_param_value('psi_pi',psi_pi);
set_param_value('psi_xgap',psi_xgap);
@#else
psi_pi       =  2.5              ;        // Coefficient on Inflation: Taylor Rule Feedback on Expected Inflation
psi_xgap     =  0.125            ;        // Coefficient on Output Gap: Taylor Rule Feedback on Output Gap
@#endif

zeta         =  2/3              ;        // Country Size Paramenter Core Economy
zetastar     =  1/3              ;        // Country Size Paramenter Periphery Economy; (1 - zeta)

//Sensitivity Analysis
//Loop over Trade Share Parameters
@#if sensitivity_trade
load parameterfile_trade;
//Import Share on Private Consumption
set_param_value('omegacon',omegacon);
set_param_value('omegaconstar',omegaconstar);
//Import Share on Government Services
set_param_value('omegagov',omegagov);
set_param_value('omegagovstar',omegagovstar);

@#else
omegacon     =  0.2              ;        // Import Share on Private Consumption Core Economy
omegaconstar =  0.1              ;        // Import Share on Private Consumption Periphery Economy

@#if import_content
omegagov     =  0.4              ;        // Import Share on Government Services Core Economy
omegagovstar =  0.2              ;        // Import Share on Government Services Periphery Economy
@#else
omegagov     =  0                ;        // Import Share on Government Services Core Economy
omegagovstar =  0                ;        // Import Share on Government Services Periphery Economy
@#endif
@#endif

epsiloncon   =  1.1              ;        // Trade Price Elasticity on Private Consumption
epsilongov   =  1.1              ;        // Trade Price Elasticity on Government Services

//Shock Values
@#if price_adjustment
sig_con_CU   =  -8.2             ;        // Std of Consumption Taste Shock Currency Union Faster Price Adjustment (Sticky Information: change to -15)
@#else
@#if phillips_curve
sig_con_CU   =  -40              ;        // Std of Consumption Taste Shock Currency Union Sticky Information
@#else
sig_con_CU   =  -13              ;        // Std of Consumption Taste Shock Currency Union
@#endif
@#endif

sig_gov_CU   =  0                ;        // Std of Government Spending Shock Currency Union
sig_tech_CU  =  0                ;        // Std of Technology Shock Currency Union

sig_con_D    =  0                ;        // Std of Consumption Taste Shock Core Economy
sig_gov_D    =  6.5              ;        // Std of Government Spending Shock Core Economy (1.5% Increase of GDP in Core Government Spending)
sig_tech_D   =  0                ;        // Std of Technology Shock Core Economy

sig_con_F    =  0                ;        // Std of Consumption Taste Shock Periphery Economy
sig_gov_F    =  0                ;        // Std of Government Spending Periphery Economy
sig_tech_F   =  0                ;        // Std of Technology Shock Periphery Economy

//Zero Lower Bound with maxoperator
pibar        = 1.005             ;        // Steady-State Inflation Rate
ibar         = (pibar / beta) - 1;        // Steady-State Nominal Interest Rate



///////////////////////////////////////////////////////
//               Composite Parameters                //
///////////////////////////////////////////////////////

//sigma_hat
sigma_hat    = sigma * (1 - varkappa - nuc);                             // Sensitivity of Output Gap to the Real Interest Rate

//kappa_mc
kappa_mc     = (1 - xi1) * (1 - beta * xi1) / xi1;                       // Calvo-Yun Contract Structure

//phi_x
phi_x        = (alpha + chi) / (1 - alpha);                              // Diminishing Returns and Disutility of Work

//theta
theta        = 1 / (sigma_hat * (1- shrgy) * phi_x + 1);                 // Weight Parameter on Potential Output & Potential Real Interest Rate

//omega
omegacony    = omegacon * shrcy;                                         // Import-Export Share of the Economy on Private Consumption
omegagovy    = omegagov * shrgy;                                         // Import-Export Share of the Economy on Government Services

//epsilon
epsilon      = shrcy * (omegacon + omegaconstar) * epsiloncon + shrgy * ( omegagov + omegagovstar) * epsilongov;    // Responsiveness Coefficient

//mu
mu           = ((1 - alpha) * theta_p) / (alpha + theta_p);              // Parameter in the Sticky Information Phillips Curve



///////////////////////////////////////////////////////
//          System of Equilibrium Equations          //
///////////////////////////////////////////////////////

model;
//Currency Union Equations
//1. New Keynesian IS-Curve
x_gap_CU = (1/ (1 + varkappa)) * x_gap_CU(+1) + (varkappa/ (1 + varkappa)) * x_gap_CU(-1) - ((shrcy * sigma_hat)/ (1 + varkappa)) * (i_CU - pi_CU(+1) - rpot_CU);

//2. New Keynesian Phillips Curve as a Function of Marginal Costs
@#if phillips_curve
// Equation that drives Sticky Information
w = pi_CU + mu * (mc_CU - mc_CU(-1));
// New Keynesian Phillips Curve in Terms of Marginal Costs with Sticky Information
pi_CU = ((1 - xi2) * mu / xi2) * mc_CU + (1 - xi2) * ( w +
@#for lag in lags
  + (xi2)^(@{lag}) * EXPECTATION(@{-lag-1})(w)
@#endfor
);

 @#else
// New Keynesian Phillips Curve in Terms of Marginal Costs Gap with Sticky Prices
 pi_CU = beta * pi_CU(+1) + kappa_mc * mc_CU;
@#endif

//3. New Keynesian Phillips Curve as a Function of Output Gap
@#if phillips_curve
// Equation that drives Sticky Information
x = pi_CU + mu * (phi_x * (x_gap_CU - x_gap_CU(-1)) + (1 / (shrcy * sigma_hat)) * ((x_gap_CU - x_gap_CU(-1)) - varkappa * (x_gap_CU(-1) - x_gap_CU(-2))));
// New Keynesian Phillips Curve in Terms of Output Gap with Sticky Information
pi_CU = ((1 - xi2) * mu / xi2) * (phi_x * x_gap_CU + (1 / (shrcy * sigma_hat)) * (x_gap_CU - varkappa * x_gap_CU(-1))) + (1 - xi2) * ( x +
@#for lag in lags
  + (xi2)^(@{lag}) * EXPECTATION(@{-lag-1})(x)
@#endfor
);

@#else
// New Keynesian Phillips Curve in Terms of Output Gap with Sticky Prices
pi_CU = beta * pi_CU(+1) + kappa_mc * (phi_x * x_gap_CU + (1 / (shrcy * sigma_hat)) * (x_gap_CU - varkappa * x_gap_CU(-1)));
@#endif

//4. Taylor-Type Policy Rule Subject to the ZLB
i_CU = max (log(ibar) , psi_pi * pi_CU + psi_xgap * x_gap_CU);

//5. Potential Output
ypot_CU = theta * (shrgy * (govshk_CU - varkappa * govshk_CU(-1)) + shrcy * conshk_CU + shrcy * sigma_hat * (1 + chi) * techshk_CU) + varkappa * theta * ypot_CU(-1);

//6. Potential Real Interest Rate
rpot_CU = (theta * (theta * varkappa - 1 - varkappa) * (govshk_CU - varkappa * govshk_CU(-1)) + theta * (govshk_CU(+1) - varkappa * govshk_CU) - (govshk_CU(+1) - govshk_CU - varkappa * (govshk_CU - govshk_CU(-1)))) * (shrgy / (shrcy * sigma_hat)) + (1 / sigma_hat) * ((theta * (theta * varkappa - 1 - varkappa) + 1) * conshk_CU + (theta - 1) * conshk_CU(+1)) + (1 + chi) * theta * ((theta * varkappa - 1 - varkappa) * techshk_CU + techshk_CU(+1)) + (1 + theta * (theta * varkappa - 1 - varkappa) ) * (varkappa / (sigma_hat * shrcy)) * ypot_CU(-1);

//7. Real Interest Rate
r_CU = i_CU - pi_CU(+1);

//8. Output
y_CU = ypot_CU + x_gap_CU;

//9. Aggregate Resource Constraint
y_CU = shrgy * govshk_CU + shrcy * con_CU;

//10. & 11. & 12. Shock Processes Currency Union
conshk_CU = eps_con_CU;
govshk_CU = zeta * govshk_D;
techshk_CU= eps_tech_CU;


// Core & Periphery Equations
//13. & 14. Output
y_D = y_CU + zetastar * y_dif;
y_F = y_CU - zeta * y_dif;

//15. & 16. Consumption Demand
lambdac_D = zeta * ((-1/ sigma_hat) * (con_D - varkappa * con_D(-1) - nuc * conshk_D));
lambdac_F = zetastar * ((-1/ sigma_hat) * (con_F - varkappa * con_F(-1) - nuc * conshk_F));

//17. & 18. Marginal Utility of Consumption
lambdac_D = zeta * (lambdac_D(+1) + i_CU - pi_D(+1));
lambdac_F = zetastar * (lambdac_F(+1) + i_CU - pi_F(+1));

//19. & 20. Inflation
pi_D = pi_CU + zetastar * pi_dif;
pi_F = pi_CU - zeta * pi_dif;

//21. & 22. Marginal Costs
mc_D = mc_CU + zetastar * mc_dif;
mc_F = mc_CU - zeta * mc_dif;

//23. & 24. Hours Worked
mc_D = (chi * n_D - lambdac_D + omegacon * tau) + alpha * n_D - (1 - alpha) * techshk_D;
mc_F = (chi * n_F - lambdac_F + omegacon * tau) + alpha * n_F - (1 - alpha) * techshk_F;

//25. & 26. Net Exports
nx_D = zeta * (omegacony * (con_F - con_D + epsiloncon * tau) + omegagovy * (govshk_F - govshk_D + epsilongov * tau));
nx_F = zetastar* (omegacony * (con_D - con_F + epsiloncon * tau) + omegagovy * (govshk_D - govshk_F + epsilongov * tau));

//27. & 28. & 29. Shock Processes Core Economy
conshk_D = eps_con_D;
govshk_D = eps_gov_D;
techshk_D= eps_tech_D;

//30. & 31. & 32. Shock Processes Periphery Economy
conshk_F = eps_con_F;
govshk_F = eps_gov_F;
techshk_F= eps_tech_F;


//Difference Equations
//33. Difference Equation between Core and Periphery GDP
y_dif = shrgy * (1 - omegagov - omegagovstar) * (govshk_D - govshk_F) - epsilon * tau + shrcy * (1 - omegacon - omegaconstar) * (con_dif);

//34. Inflation Differential
@#if phillips_curve
// Equation that drives Sticky Information
y = pi_dif + mu * ((mc_D - mc_D(-1)) - (mc_F - mc_F(-1)));
// Inflation Differential Sticky Information
pi_dif = ((1 - xi2) * mu / xi2) * mc_dif + (1 - xi2) * ( y +
@#for lag in lags
  + (xi2)^(@{lag}) * EXPECTATION(@{-lag-1})(y)
@#endfor
);

@#else
// Inflation Differential Sticky Prices
pi_dif = beta * pi_dif(+1) + kappa_mc * mc_dif;
@#endif

//35. Consumption Differential
con_dif = varkappa * con_dif(-1) - sigma_hat * (1 - omegacon - omegaconstar) * tau + (1/sigma) * (conshk_D - conshk_F);

//36. Difference between Core and Periphery Marginal Costs
mc_dif = phi_x * (y_dif) - tau - (1 + chi) * (techshk_D - techshk_F);

//37. Terms of Trade
tau - tau(-1) = beta * (tau(+1) - tau) + kappa_mc * (mc_dif);


end;

///////////////////////////////////////////////////////
//                     End Model                     //
///////////////////////////////////////////////////////



///////////////////////////////////////////////////////
//                   Steady-State                    //
///////////////////////////////////////////////////////


//Assign Analytical Steady-State Values as Initial Values
initval;
x_gap_CU=0;
pi_CU=0;
i_CU=0;
rpot_CU=0;
ypot_CU=0;
mc_CU=0;
y_CU=0;
con_CU=0;
r_CU=0;
conshk_CU=0;
govshk_CU=0;
techshk_CU=0;

y_D=0;
lambdac_D=0;
pi_D=0;
con_D=0;
mc_D=0;
nx_D=0;
n_D=0;
conshk_D=0;
govshk_D=0;
techshk_D=0;

y_F=0;
lambdac_F=0;
pi_F=0;
con_F=0;
mc_F=0;
nx_F=0;
n_F=0;
conshk_F=0;
govshk_F=0;
techshk_F=0;

tau=0;

y_dif=0;
pi_dif=0;
con_dif=0;
mc_dif=0;
end;

//Calculate Analytical Steady-State Values of Endogenous Variables
steady;


//Check Stability Conditions
check;



///////////////////////////////////////////////////////
//       Including Codes to Generate Figures         //
///////////////////////////////////////////////////////


@#include "Figure 1A.mod"
//@#include "Figure 1B.mod"
//@#include "Impulse Response Government Spending Shocks.mod"
//@#include "Impulse Response Consumption Taste Shock.mod"
//@#include "Step function Sticky Prices.mod"
//@#include "Step function - Plotting Sticky Prices.mod"
//@#include "Stepwise Inclusion of Lagged Expectations.mod"
//@#include "Step function Sticky Information.mod"
//@#include "Step function - Plotting Sticky Information.mod"
//@#include "Sensitivity Analysis.mod"



///////////////////////////////////////////////////////
//   Integrating MATLAB Codes in LaTeX Environment   //
///////////////////////////////////////////////////////

// write_latex_original_model;
// write_latex_static_model;
// write_latex_dynamic_model(write_equation_tags);
// write_latex_dynamic_model;
// write_latex_parameter_table;
// write_latex_prior_table;
// write_latex_definitions;

// collect_latex_files;
