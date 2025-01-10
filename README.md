# On_off_intermittency
Angela Monti,
Institute for Applied Mathematics (IAC), CNR, Bari, Italy. 
Mail: a.monti@ba.iac.cnr.it

On-off intermittency is a MATLAB routine (version R2019b) that produces the plots of the distribution of the off phases and the power spectral density. 
Additionally, the available codes can also be used with Octave.


The repository contains:
- the script generate_plots_distribution_off_phases, that produces the above mentioned plots;
- the function compute_delta_varying, that computes the host and parasitoid population when the grazing parameter delta randomically varies;
- the function compute_r_varying, that computes the host and parasitoid population when the host growth rate r randomically varies;
- the function distribution_off_phases, that computes the probability density function of the distribution of the off phases.


The routine has been implemented and developed by Angela Monti. It can be used under the conditions of CC-BY-NC 2.0. When utilizing this codebase, please cite the following 
publication

A. Monti, F. Diele, C. Marangi, A. Provenzale, On-off intermittency in population outbreaks:reactive equilibria and propagation on networks, Communications in Nonlinear Science andNumerical Simulation, 130:107788,
2024, DOI: 10.1016/j.cnsns.2023.107788

The complete description of the model and numerical methods is available in the cited publication.

The development and the implementation of the model and the routine have been made possible thanks to National Recovery and Resilience Plan (NRRP), Mission 4 Component 2 Investment 
1.4—Call for tender No. 3138 of 16 December 2021, rectified by Decree n.3175 of 18 December 2021 of Italian Ministry of University and Research funded by the 
European Union—NextGenerationEU; Award Number: Project code CN 00000033, Concession Decree No. 1034 of 17 June 2022 adopted by the Italian Ministry of 
University and Research, CUP B83C22002930006, Project title “National Biodiversity Future Center" (NBFC). 
