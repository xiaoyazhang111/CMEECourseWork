#Question1
species_richness<- function(community){
  #Calculate length of community
  len = length(unique(community))
  return(len)
}

#Question2
init_community_max<-function(size){
  #Initialize community size by giving number
  return(seq(size))
}

#Question3
init_community_min<-function(size){
  # Initialize community with minimum value 1
  community = rep(1, size)
  return(community)
}

#Question4
choose_two<-function(max_value){
  #Choose 2 values between 1 and given max value randomly
  result = sample(max_value,2) 
  return(result)
}

#Question5
neutral_step<-function(community){
  #Choose 2 individuals from all
  death=choose_two(len)
  newproduce = death[1]
  die = death[2]s
  #Replace die one with new produce one
  community[die]=community[newproduce]
  return(community)
}

#Question6
neutral_generation <- function(community){
  #In a community simulate neutral_steps 
  len=length(community)/2
  times=round(len)
  for (i in 1:times){
    community=neutral_step(community)
  }
  return(community)
}

#Question7
neutral_time_series <- function(community,duration)  {
  sep=spe_richness(community)
  series = rep(sep,duration+1)
  for (i in 1:duration){
    community = neutral_generation(community)
    series[i+1] = spe
  }
  print(series)
}

#Question8
question_8 <- function() {
  
}
#Question9
neutral_step_speciation<-function(community,speciation_rate){
  len=length(community)
  die=choose_two(len)
  dieOne=die[1]
  if (runif(1) > speciation_rate){
    community[die[1]] <- community[die[2]]
  }
  else{
    community[die[1]] <- max(community)+1
  }
  print(community)
  
}

#Question10
neutral_generation_speciation<-function(community,speciation_rate){
  len=length(community)/2
  times=round(len)
  for (i in 1:times){
    community=neutral_step_speciation(community,speciation_rate)
  }
  print(community)
}

#Qusetion11

neutral_time_series_speciation <- function(community,speciation_rate,duration)  {
  sep=sep_richness(community)
  richness = rep(sep,duration+1)
  for (i in 1:duration){
    community = neutral_generation_speciation(community,speciation_rate)
    richness[i+1] = sep
  }
  print(richness)
}

#Qusetion13
species_abundance<- function(community){
  #Count species abundances from input of community vector
  table1=table(community)
  numOfTable=as.numeric(table1)
  return(sort(numOfTable),decreasing=T)
}

#Question14
octaves<-function(abundance){

}

# Question 15
sum_vect(x,y) <- function(x, y) {
  # Add together vectors with different length 
  if (length(y)>length(x)){
    z=x
    x=y
    y=z
  }
  lenOfx=length(x)
  lenOfy=length(y)
  x[1:lenOfy]=x[1:lenOfy]+y
  print(x)
}



#Question 21
question_21<- function(){
  #return a list giving fractal dimension and working explain
  first<-log(8,10)/log(3,10)
  second<-"To make the object size three times, it needs 8 times of the orginal one, fractal dimension= log8/log3"
  result<- c(first,second)
  return(result)
}

#Question 22
question_22<-function(){
  #return a list giving three-dimensional object fractal dimension and working explain
  first<-log(20,10)/log(3,10)
  second<-"To make the object size three times, it needs 20 times of the original one, fractal dimension= log20/log3"
  return(c(first,second))
}

#Question 23
chaos_game<-function(){
  return("Give your answer")
  graphics.off()
  A = c(0,0)
  B = c(3,4)
  C = c(4,1)
  X = c(0,0)
  list=list(A,B,C)
  storeOfX <- matrix(NA, rowMatrix = 10000, colMatrix = 2)
  for(i in 1:10000){
    chosen = unlist(sample(c(list),1)) #jump towards A, B or C randomly
    X = (X + chosen)/2   
    storeOfX[i,] <- X 
  }
}


#Question 24
turtle <- function(start_point = c(4,2), direction = pi/2, len = 5){
  xDist <- len*sin(direction)
  yDist <- len*cos(direction)
  segments(start_point[1],start_point[2],xDist+start_point[1],yDist+start_point[2])
  return(c(xDist+start_point[1],yDist+start_point[2]))
}

#Question 25

elbow <- function(start_point = c(4,2), direction = pi/10, len = 5){
  P <- turtle(start_point, direction, len)
}
  
#Question 26
spiral <- function(start_point = c(4,2), direction = pi/4, len = 1)  {
  if (len > 0.02){
    P <- turtle(start_point, direction, len)
    spiral(start_point, direction-(pi/4), 0.95*len)
    return("It loops again and again!")
  }
}

