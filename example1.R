#Install all necessary packages
require(devtools)
require(popgraph)
require(igraph)
require(gstudio)

#Read a genepop formatted file
#Here I'm using a simple dataset called shrikes.txt, from Diego Sustaita, Sethuraman et al.,
#Dataset has 67 shrikes genotyped at 7 loci in the GENEPOP format, which is relatively easy
#More details on this format can be found here: https://genepop.curtin.edu.au/help_input.html
#Rodney has also got some details on this here (just search for the Importing Data section): http://dyerlab.github.io/gstudio/

shrikes<-read_population("shrikes.txt",type="genepop")
#Convert to multivariate dataset from genepop
data<-to_mv(shrikes)
#Set population names
pops<-shrikes$Population
#Create a graph
graph <- popgraph(x = data, groups = pops)
#Simple graph plot
plot(graph)

#Playing around with other functions

#(1) Calculate allele frequencies within populations
freqs.pops<-frequencies(shrikes,stratum="Population")

#(2) Calculate observed heterozygosity within populations
Ho(shrikes)

#(3) Calculate expected heterozygosity under HWE (2pq)
He(shrikes)

#(4) Calculate inbreeding coefficients Fis
Fis(shrikes)

#(5) Genetic distances - eg. AMOVA - analysis of molecular variance distance, Nei distance
amova.dist<-genetic_distance(shrikes,stratum="Population",mode="AMOVA")
nei.dist<-genetic_distance(shrikes,stratup="Population",mode="Nei")
dist_euclidian(shrikes)




