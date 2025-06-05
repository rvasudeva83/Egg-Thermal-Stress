Oviposited eggs are sensitive to experimental heatwaves 

Summary:
This study investigates the consequences of short- and long-term heatwave exposures on oviposited insect eggs (Tribolium castaneum) and subsequence embryonic survival as well as developmental stage failures were quantified. Overall, from an outbred stock population (non-overlapping generations) we set up these assays. This work constitutes data files (.csv) and an Rscript file.

Everyone involved (with the exception of MJGG) in the study contributed to data collection. Miss. Natasha Brown (research technician) helped with some of the pilot study counts, helped curate the material and run the assays.


 
R Session Info:

R version 4.5.0 (2025-04-11)
Platform: aarch64-apple-darwin20
Running under: macOS Sequoia 15.5

Matrix products: default
BLAS:   /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib 
LAPACK: /Library/Frameworks/R.framework/Versions/4.5-arm64/Resources/lib/libRlapack.dylib;  LAPACK version 3.12.1

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

time zone: Europe/London
tzcode source: internal

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] ggpubr_0.6.0    lubridate_1.9.4 forcats_1.0.0   stringr_1.5.1   dplyr_1.1.4     purrr_1.0.4     readr_2.1.5     tidyr_1.3.1    
 [9] tibble_3.2.1    tidyverse_2.0.0 Rmisc_1.5.1     plyr_1.8.9      lattice_0.22-6  ggplot2_3.5.2  

loaded via a namespace (and not attached):
 [1] gtable_0.3.6       crayon_1.5.3       compiler_4.5.0     ggsignif_0.6.4     tidyselect_1.2.1   Rcpp_1.0.14       
 [7] scales_1.4.0       R6_2.6.1           labeling_0.4.3     generics_0.1.4     Formula_1.2-5      backports_1.5.0   
[13] car_3.1-3          pillar_1.10.2      RColorBrewer_1.1-3 tzdb_0.5.0         rlang_1.1.6        broom_1.0.8       
[19] stringi_1.8.7      timechange_0.3.0   cli_3.6.5          withr_3.0.2        magrittr_2.0.3     grid_4.5.0        
[25] rstudioapi_0.17.1  hms_1.1.3          lifecycle_1.0.4    vctrs_0.6.5        rstatix_0.7.2      glue_1.8.0        
[31] farver_2.1.2       abind_1.4-8        carData_3.0-5      tools_4.5.0        pkgconfig_2.0.3   
>
 
1) Filename:  UEA_Egg HW Results_2025.csv

Dataset describing adult counts (from lab A) when eggs were exposed to short-term experimental heatwaves across temperatures (°C) and durations (hours – h).
Fodder quantity (7.5 grams – g)


Column A: Location
Lab A where the assays were conducted

Column B: Day
Day when the experiments were run, levels : 5 (as short-term exposures were run across five independent days)

Column C: temp
Experimental heatwave exposure (°C)

Column D: duration (hours- h)
Duration the eggs were exposed, levels : 2 (2 h and 5 h)

Column E: count
Adult counts after eggs were exposed

Column F: Date Collected
Date when the heatwaves were run and the offspring counted
 
2) Leeds_Egg HW Results_2025_sHW.csv

Dataset describing adult counts (from lab B) when eggs were exposed to short-term experimental heatwaves across temperatures (°C) and durations (hours – h).

Column A: temp
Experimental heatwave exposure (°C)

Column B: fodder
Fodder quantity (7.5 grams – g)

Column C: duration (hours- h)
Duration the eggs were exposed, levels : 2 (2 h and 5 h)

Column D: Rep 
Individual replicates within each treatment and a random ID given to the samples

Column E: Rand.Code
A random code to blind all the information, this allowed to control/avoid any biases when running the assays

Column F: Off.Counts
Offspring counts

Column G: Pupae 
Dead pupae counts within the batches

Column H: Larvae
Dead larval counts

Column I: Treat
Short-term heatwave treatment (description only)

Column J: Day
The day that the assays were run (random blocks) in Lab B
 
3) Leeds_Egg HW Results_2025.csv

Dataset describing adult counts (from lab B) when eggs were exposed to long-term experimental heatwaves across temperatures (°C) and durations (hours – h).
Fodder: 7.5 g

Column A: ID
Replicate sample ID

Column B: Temp
Experimental heatwave exposure (°C)

Column C: Days.Exposed
Heatwave exposure (in days)

Column D: Counts 
Offspring counts (adults that eclosed after eggs were exposed)

Column E: Life.Stage
Life stages that failed during development after the fertilised, unhatched oviposited eggs were exposed to long-term heatwaves

Column F: Notes
Nominal data describing the stage (dead or alive)

Column G: Heatwave 
Long-term heatwave (descriptive)
 
4) Leeds_Egg.Counts.Fodder.csv

Dataset describing egg counts (from labs A and B) from a subset of samples (in 7.5 g of fodder) from the short-term heatwaves, frozen at the time of setting up the assays. These counts were done on anonymised batches that were then, de-anonymised the sample IDs, compared, once the egg counts were completed for plotting.

Column A: ID
Replicate sample ID

Column B: Loc
Location the samples were collected from

Column C: Fodder.mass (grams – g), without oats, just flour + yeast.
Mass of the container with the fodder was measured using an electronic AND balance to the second decimal point (XX.XX g)

Column D: Egg.Counts
Eggs counted

Column E: Larvae
Whether at the point of eggs being frozen, whether any of the eggs hatched or not. So the presence of larvae was checked at the time of the egg counts

Column F: Assayed
When the egg count assays were carried out (day)

Column G: Sample.Block
Block the samples came from (e.g., A-E or Sat and Sun)

Column A: Scoop
Not applicable
 
5) Life Stage Deaths Long HW_2025.csv

Dataset describing life stage deaths (from lab B, in 7.5 g of fodder) from the short-term heatwaves.

Column A: Rep
Replicate sample ID

Column B: Temp (°C)
Heatwave temperature (°C)

Column C: Fodder (grams – g), 
Fodder mass used

Column D: Duration (hours - h)
Duration in hours

Column E: Offspring
Total number of offspring counted across replicate pots

Column F: Deaths
Life stages that had died during their development

Column G: Prop.Dead (number)
Proportion dead, life stage – Deaths/Offspring

Column H: Stage (nominal)
Life stage that died

Column I: Day (nominal)
Day the assays were carried out
 
6) Lifestage failures_LHW_210525.csv

Dataset describing life stage deaths (from lab B, in 7.5 g of fodder) from the long-term heatwaves.

Column A: Temp (°C)
Heatwave temperature (°C)

Column B: Duration (days - d)
Duration in hours

Column C: Off.Counts
Total number of offspring counted across replicate pots

Column D: Deaths
Life stages that had died during their development

Column E: Percent (number)
Percentage of the life stage that died, calculated as – Deaths/Off.Counts

Column F: Life.Stage (nominal)
Life stage that died

Column G: Replicates
Replicate sample number

Column H: Fodder (grams – g), 
Fodder mass used

Column I: Type (nominal)
Heatwave type
 
7) Lifestage failures_sHW_210525.csv

Summarised dataset describing life stage deaths (from lab B, in 7.5 g of fodder) from the short-term heatwaves.

Column A: Temp (°C)
Heatwave temperature (°C)

Column B: Off.Counts
Total number of offspring counted across replicate pots

Column C: Deaths
Life stages that had died during their development

Column D: Percent (number)
Percentage of the life stage that died, calculated as – Deaths/Off.Counts

Column E: Life.Stage (nominal)
Life stage that died

Column F: Day (nominal)
Day the assays were run

Column G: Duration (hours - h)
Duration the heatwaves were run for

Column H: Replicates
Replicate sample number

Column I: Fodder (grams – g), 
Fodder mass used

Column I: Type (nominal)
Heatwave type
 
8) Supporting Information_Fig 1.3_2025.csv

Summarised dataset describing impacts of short-term heatwaves on oviposited eggs when this was initially run as a pilot study.

Column A: Blinded_code
Temperature treatments (°C) that were blinded using a code

Column B: ID
Replicate ID for each sample

Column C: Counts
Offspring counts

Column D: Duration (hours - h)
Duration the heatwaves were run for

Column E: ForT (grams – g), 
Fodder mass used

Column F: Rep
Replicate sample number

Column G: Counted by
User who counted the offspring

Column H: Species
Species ID

Column I: Set up
User for setting up

Column J: Expt
Experiment ID

Column K: Date
Not applicable










