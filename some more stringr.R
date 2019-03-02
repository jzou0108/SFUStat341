#Function to find the files from a chromosome
fl <- c("chr1geneC1orf49.txt","chr1geneAMPD2.txt",
        "chr2geneCOL4A4.txt","chr2geneHADHB.txt",
        "chrXgeneCXorf49.txt")

library(stringr)
findChrFiles <- function(filenames,chromosome){
  cnum <- c(as.character(1:22),"X","Y")
  if(chromosome %in% cnum){
    pattern=paste0("chr",chromosome)
    filenames[grepl(pattern,filenames)]
  }
  else{
    print("Invalid chromosome")
  }  
}
findChrFiles2 = function(filenames, chromosome){
  require(stringr)
  available.chromosome.list = c(as.character(1:22),"X","Y")
  #if (chromosome is in the list) then print ... same as above
}

#Extract gene names
findGeneNames<-function(filenames){
  ss=str_extract(filenames,"gene.*.txt")
  ss=str_replace(ss,"gene","")
  ss=str_replace(ss,fixed(".txt"),"")
  ss
}