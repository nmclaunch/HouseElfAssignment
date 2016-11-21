#HouseElf Ear length Analysis for Dr. Granger
library(dplyr)
library(stringr)

elf_data<- read.csv("data/houseelf_earlength_dna_data_1_two.csv", stringsAsFactors = FALSE)


get_gc_content<-function(sequence){ 
  #calculate percentage of g and c in a DNA sequence
  lower_seq<-tolower(sequence)
  Gs <- str_count(lower_seq, "g")
  Cs <- str_count(lower_seq, "c")
  gc_content <-(Gs + Cs) / str_length(lower_seq)*100
  return(gc_content)
}

gc_content<-get_gc_content(elf_data$dnaseq)
gc_content

get_ear_length <- function(ear_length){
   #Calculate the size class for one or more ear lengths
   ear_lengths <- ifelse(ear_length > 10, "large", "small")
   return(ear_lengths)
}

ear_length<-get_ear_length(elf_data$earlength)
ear_length

#create a data frame with individual ID, ear length class, 
#and the gc-content for each individual.

elf_frame<-data.frame(id=elf_data$id,
                      ear_length=ear_length,
                      gc_content=gc_content, stringsAsFactors = FALSE)

write.csv(elf_frame, "elf_ear_gc_data.csv")


