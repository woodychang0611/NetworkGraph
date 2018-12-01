#Dependency package
#Run install.packages("package_name") to install missing missing packages
library(GGally)
library(sna)
library(network)
library(tidyverse)

dataset_file = "Dataset\\facebook_combined.txt"

#Read file to data
input_data <- scan(dataset_file, integer(), quote = "")
#make data from vector to matrix
input_data <- matrix(input_data, ncol = 2, byrow = TRUE)
row_size = dim(input_data)[1]

matrix_size <- max(input_data)
output_data  = matrix(data = 0, nrow = matrix_size, ncol = matrix_size, byrow = FALSE,dimnames = NULL)

for (x in 1:row_size){
  v1 = input_data[x,1]
  v2 = input_data[x,2]
  output_data[v1,v2]=1
}
net = network(output_data, directed = FALSE)

ggnet2(net,size=1,edge.color="skyblue",color  ="royalblue")+ theme(panel.background = element_rect(fill = "lightyellow"))
ggsave("facebook_combined.png", width = 8.7, height =8.7,dpi=1200,limitsize = FALSE)
