####################################################################################################
############### Oviposited egg exposures to short and long-term heatwaves ##########################
####################################################################################################




######### ONLINE SUPPORTING INFORMATION ###########

e1 <- read.csv ("Supporting Information_Fig 1.3_2025.csv", fileEncoding = "Latin1", check.names = F)


library (ggplot2)
library(Rmisc)     #To use summarySE function
library(tidyverse)
library(ggpubr)

str (e1)
attach(e1)

e1$Rep<-as.character(e1$Rep)


# summary

te_summ2<- summarySE (e1, measurevar = "Counts", groupvars = c("Blinded_codes","Rep"))


# 2 h

Te_p2h<-ggplot(te_summ2, aes(x=Blinded_codes, y=Counts)) + 
  geom_point(size=2, stroke=1, fill="white",
             aes(colour=Blinded_codes,
                 shape=Blinded_codes),
             position=position_dodge(0.5))+
  geom_line(aes(group=Rep, linetype=Rep))+
  theme_classic()+
  ylim(0,250)+
  scale_shape_manual(values=c(21,21,21,21))+
  scale_colour_manual(values=c("blue","orange","red","darkred"))+
  geom_errorbar(aes(ymin=Counts-se, ymax=Counts+se, colour=Blinded_codes), width=0.1,
                position=position_dodge(0.5))+
  scale_x_discrete(labels=c("30C" = "30°C\nControl", 
                            "42C" = "42°C",
                            "46C" = "46°C",
                            "48C" = "48°C"), 
                   limits=c("30C","42C","46C","48C"))+
  geom_jitter(aes(colour=Blinded_codes, shape=Blinded_codes),
              position = position_jitterdodge(dodge.width = 0.5),
              alpha=0.90, data=e1_fil2)+
  theme(axis.line.x = element_line(size = 0.5, colour = "black"),
        axis.line.y = element_line(size = 0.5, colour = "black"),
        axis.text.x=element_text(colour="black", size = 14, family = "Times", face = "bold"),
        axis.text.y=element_text(colour="black", size = 14, face = "bold", family = "Times"))+
  theme(axis.title.x = element_text(colour= "black", face = "bold", size = 14, family = "Times"),
        axis.title.y = element_text(colour= "black", face = "bold", size = 14, family = "Times"))+
  theme(legend.position="none")+
  ylab("Egg to adulthood [success]")+xlab("Short-term exposures")

Te_p2h