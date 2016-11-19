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

get_ear_length <- function(seq){
   #Calculate the GC-content for one or more sequences
   ear_lengths <- ifelse(seq > 10, "large", "small")
   return(ear_lengths)
}

get_gc_content(elf_data)
