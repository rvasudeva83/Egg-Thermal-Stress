###################################################################################################
###################################################################################################
################### EGG SHORT THERM THERMAL EXPOSURE MANUSCRIPT ###################################
###################################################################################################
###################################################################################################

###### Egg assays EXPERIMENT 1 #######
##### 30C, 48C and 50C 2 hours #######

library(tidyverse) # for data wrangling
library (ggplot2) # for plots/grpahics
library(Rmisc)     #To use summarySE function
library(ggpubr) #placing multiple plot elements into a single figure/plot

#### basic housekeeping ####

str (ET)
attach(ET)

ETE<-filter(ET, Exposure=="Eggs") # egg stuff

# summary statistics using Rmisc package

ETE_summ<- summarySE (ETE, measurevar = "Counts", groupvars = c("Temp"))

attach (ETE_summ)


##############################
##### plot-egg responses #####
##############################

P1e<-ggplot(ETE_summ, aes(x=Temp, y=Counts, colour=Temp)) + 
  geom_point(size=4, stroke=2, fill="white",
             aes(shape=Temp),
             position=position_dodge(0.5))+
  theme_minimal()+
  ylim(0,235)+
  scale_shape_manual(values=c(21,21,21))+
  scale_colour_manual(values=c("#0000FF","#CD0000","#FF0000"))+
  geom_errorbar(aes(ymin=Counts-se, ymax=Counts+se), width=0.1,
                position=position_dodge(0.5))+
  scale_x_discrete(labels=c("30C" = "Control\n30°C", 
                            "48C" = "48°C\n 2hr",
                            "50C" = "50°C\n 2hr"), 
                   limits=c("30C","48C","50C"))+
  geom_jitter(aes(colour=Temp, shape=Temp),
              position = position_jitterdodge(dodge.width = 0.5), data=ETA)+
  theme(axis.line.x = element_line(size = 0.5, colour = "black"),
        axis.line.y = element_line(size = 0.5, colour = "black"),
        axis.text.x=element_text(colour="black", size = 14, family = "Times", face = "bold"),
        axis.text.y=element_text(colour="black", size = 14, face = "bold", family = "Times"))+
  theme(axis.title.x = element_text(colour= "black", face = "bold", size = 21, family = "Times"),
        axis.title.y = element_text(colour= "black", face = "bold", size = 21, family = "Times"))+
  theme(legend.position="none")+
  ylab("Egg assay\n Offspring count")+xlab("Thermal landscapes")

P1e

############################################
########## Analysis egg responses ##########
############################################

attach(ETE)
str(ETE)

hist(ETE$Counts)

E1<-glm(Counts~Temp, family=quasipoisson(link="log"), data=ETE)
summary(E1)

#############################################################################################
####################ADDIITONAL MODEL FIT FOR EGG ASSAYS #####################################
#### models fit below are checks to why a quasipoisson fit was used above ###################

library(MASS)
E1.nb<-glm.nb(Counts~Temp, data=ETE)
summary(E1.nb)

###################################################################################################
######## once the model was fit, these packages were employed for further diagnostics #############
###################################################################################################

library(jtools)
library(broom)
library(ggstance)


plot_summs(E1, scale = TRUE, exp = FALSE)

library(ggstats)
ggcoef_model(E1)


#### check your model performance ####
library(performance)
library(see)
check_model(E1)

###### emmeans #######
library(emmeans)
X<-emmeans(E1, "Temp", type="response")
pairs(X, reverse=TRUE)



##############################################################################
##############################################################################
##### Tribolium egg heatwave repeat experiments and new data (2022/2023) #####
#### EXPERIMENT 1A and 2 #######
##############################################################################

######## similar approach here to the work package described above #########

library(tidyverse)
library (ggplot2)
library(Rmisc)     #To use summarySE function
library(ggpubr)



###### general housekeeping #######
str (E2)
attach(E2)

E2$Rep<-as.character(E2$Rep)


E2_fil<-filter(E2, Species=="Tribolium") # look @ Tribolium dataset
str(E2_fil)

E3<-E2_fil %>%
  filter(Blinded_codes %in% c("30C","46C","48C"))

str(E3)
E3$Blinded_codes<-as.factor(E3$Blinded_codes)

E4<-E2_fil %>%
  filter(ForT %in% c("15g"))

E4_fil<-E4 %>%
  filter(Blinded_codes %in% c("30C","46C","48C"))

# summary

te_summ<- summarySE (E3, measurevar = "Counts", groupvars = c("Blinded_codes","Rep","Duration"))
te2_summ<- summarySE (E4_fil, measurevar = "Counts", groupvars = c("Blinded_codes","Duration"))

(184.6-119.6)/184.6*100 #46C-2hr
(222-1.5)/222*100 #50C-2hr


attach (te_summ)

te_summ$Blinded_codes <- factor(te_summ$Blinded_codes,levels = c("30C", "46C", "48C")) #reorder the bars
te2_summ$Blinded_codes <- factor(te2_summ$Blinded_codes,levels = c("30C", "46C", "48C")) #reorder the bars



############################
##### plot (Tribolium) #####
############################

# New facet label names for dose variable
dur.lab <- c("2hours", "5hours")
names(dur.lab) <- c("2H", "5H")

(184.6-119.6)/184.6*100 # 46C 2hr
(184.6-79.4)/184.6*100 # 48C 2hr
(176-123.2)/176*100 # 46C 5hr
(176-66.2)/176*100 # 48C 5hr

#############################################
###### Using replicate 15g of fodder ########
#############################################

Te_p2<-ggplot(te2_summ, aes(x=Blinded_codes, y=Counts)) + 
  geom_point(size=4, stroke=2, fill="white",
             aes(colour=Blinded_codes,
                 shape=Blinded_codes),
             position=position_dodge(0.5))+
  #geom_line(aes(group=Duration))+
  theme_bw()+
  ylim(0,235)+
  scale_shape_manual(values=c(21,21,21))+
  scale_colour_manual(values=c("#0000FF","#FF7F00","#CD0000"))+
  facet_grid(.~Duration, labeller = labeller(Duration = dur.lab))+
  geom_errorbar(aes(ymin=Counts-se, ymax=Counts+se, colour=Blinded_codes), width=0.2,
                position=position_dodge(0.5))+
  scale_x_discrete(labels=c("30C" = "30°C\nControl", 
                            "46C" = "46°C",
                            "48C" = "48°C"), 
                   limits=c("30C","46C","48C"))+
  geom_jitter(aes(colour=Blinded_codes, shape=Blinded_codes),
              position = position_jitterdodge(dodge.width = 0.5),
              alpha=0.90, data=E4_fil)+
  theme(strip.background =element_blank(),
        panel.border = element_rect(colour = "black", fill = NA))+
  theme(strip.text = element_text(colour = "black", face="bold", size=14))+
  theme(axis.line.x = element_line(size = 0.5, colour = "black"),
        axis.line.y = element_line(size = 0.5, colour = "black"),
        axis.text.x=element_text(colour="black", size = 21, family = "Times", face = "bold"),
        axis.text.y=element_text(colour="black", size = 21, face = "bold", family = "Times"))+
  theme(axis.title.x = element_text(colour= "black", face = "bold", size = 21, family = "Times"),
        axis.title.y = element_text(colour= "black", face = "bold", size = 21, family = "Times"))+
  theme(legend.position="none")+
  ylab("Egg assay (Offspring count)")+xlab("Thermal exposures")+
  annotate(geom="text", x=2, y=224, label="15 g",
           color="black", size=7, fontface="bold")

Te_p2

(184.6-119.6)/184.6*100

##############################################################
################ filter 7.5g replicate  ######################
##############################################################

E5<-E2_fil %>%
  filter(ForT %in% c("7.5g"))

E5_fil<-E5 %>%
  filter(Blinded_codes %in% c("30C","46C","48C"))

(67-35)/67*100 # 46C 2hr
(67-18.4)/67*100 # 48C 2hr
(73.6-34.8)/73.6*100 # 46C 5hr
(73.6-20)/73.6*100 # 48C 5hr


# New facet label names for dose variable
dur.lab <- c("2hr", "5hr")
names(dur.lab) <- c("2H", "5H")

te3_summ<- summarySE (E5_fil, measurevar = "Counts", groupvars = c("Blinded_codes","Duration"))
te3_summ$Blinded_codes <- factor(te3_summ$Blinded_codes,levels = c("30C", "46C", "48C")) #reorder the bars



###### Using replicate 7.5g of fodder ########

Te_p3<-ggplot(te3_summ, aes(x=Blinded_codes, y=Counts)) + 
  geom_point(size=4, stroke=2, fill="white",
             aes(colour=Blinded_codes,
                 shape=Blinded_codes),
             position=position_dodge(0.5))+
  #geom_line(aes(group=Duration))+
  theme_bw()+
  ylim(0,100)+
  scale_shape_manual(values=c(21,21,21))+
  scale_colour_manual(values=c("#0000FF","#FF7F00","#CD0000"))+
  facet_grid(.~Duration, labeller = labeller(Duration = dur.lab))+
  geom_errorbar(aes(ymin=Counts-se, ymax=Counts+se, colour=Blinded_codes), width=0.2,
                position=position_dodge(0.5))+
  scale_x_discrete(labels=c("30C" = "30°C\nControl", 
                            "46C" = "46°C",
                            "48C" = "48°C"), 
                   limits=c("30C","46C","48C"))+
  geom_jitter(aes(colour=Blinded_codes, shape=Blinded_codes),
              position = position_jitterdodge(dodge.width = 0.5),
              alpha=0.90, data=E5_fil)+
  theme(strip.background =element_blank(),
        panel.border = element_rect(colour = "black", fill = NA))+
  theme(strip.text = element_text(colour = "black", face="bold", size=14))+
  theme(axis.line.x = element_line(size = 0.5, colour = "black"),
        axis.line.y = element_line(size = 0.5, colour = "black"),
        axis.text.x=element_text(colour="black", size = 21, family = "Times", face = "bold"),
        axis.text.y=element_text(colour="black", size = 21, face = "bold", family = "Times"))+
  theme(axis.title.x = element_text(colour= "black", face = "bold", size = 21, family = "Times"),
        axis.title.y = element_text(colour= "black", face = "bold", size = 21, family = "Times"))+
  theme(legend.position="none")+
  ylab("Egg assay (Offspring count)")+xlab("Thermal exposures")+
  annotate(geom="text", x=2, y=96, label="7.5 g",
           color="black", size=7, fontface="bold")

Te_p3


library(ggpubr)
ggarrange(P1e, Te_p2, Te_p3, ncol = 3, nrow = 1, labels = c('A', 'B', 'C'),
          font.label = list(size = 24, color = "black", face = "bold", family = "Arial"))


############################################
########## Analyses Expt. 1A and 2 ##########
############################################

###########################################################
########## Analysis egg assays ##########
#### filter 15 g fodder replicate
###########################################################

attach(E4_fil)
str(E4_fil)

hist(E4$Counts)

E.15<-glm(Counts~Blinded_codes*Duration, family=quasipoisson(link="log"), data=E4_fil) # 15 g of fodder
summary(E.15)

library(car)
Anova(E.15)

library(MASS)
E1.nb<-glm.nb(Counts~Temp, data=ETE)
summary(E1.nb)

library(pscl)
E1.hur<- hurdle(Counts~Temp, data=ETA, dist = "poisson", 
                zero.dist = "binomial")
summary(E1.hur)

library(jtools)
library(broom)
library(ggstance)


plot_summs(E.15, scale = TRUE, exp = FALSE)

library(ggstats)
ggcoef_model(E.15)


#### check your model performance ####
library(performance)
library(see)
check_model(E.15)

###### emmeans #######
library(emmeans)
X<-emmeans(E.15, specs = pairwise~Blinded_codes*Duration, type="response")
summary(X)



##############################################################
##############################################################
##### filter 7.5g fodder replicate  ######
##############################################################

attach(E5_fil)
str(E5_fil)

hist(E5$Counts)

E.75<-glm(Counts~Blinded_codes*Duration, family=quasipoisson(link="log"), data=E5_fil) # 7.5 g of fodder
summary(E.75)

library(car)
Anova(E.75)

library(MASS)
E75.nb<-glm.nb(Counts~Blinded_codes, data=E5_fil)
summary(E75.nb)


library(jtools)
library(broom)
library(ggstance)


plot_summs(E.75, scale = TRUE, exp = FALSE)

library(ggstats)
ggcoef_model(E.75)


#### check your model performance ####
library(performance)
library(see)
check_model(E.75)

###### emmeans #######
library(emmeans)
X<-emmeans(E.75, specs = pairwise~Blinded_codes*Duration, type="response")
summary(X)



#################################
####### Package Citation ########

sessionInfo()
R.Version()
RStudio.Version()
citation()
citation("ggplot2")

citation("lmtest")
citation("lmerTest")
citation("car")
citation("MASS")
citation("Rmisc")
citation("tidyverse")
citation("DHARMa")
citation("emmeans")
citation("survminer")
citation("survival")
citation("dplyr")
citation("ggstats")
citation("performance")
citation("see")
citation("pscl")


