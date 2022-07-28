

### Cesar Riano week 4 assingment
#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice
HairEyeColor
Dataw4 <- HairEyeColor # data set with a new name

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(Dataw4)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr") # install package "name of package"
library(dplyr)  # call package

#Extra packages that Ieeded to reshape dataset
install.packages("DescTools") # install package "name of package" reshape
library(DescTools)  # call package 

#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)
week4Data <- Untable(HairEyeColor) # I had to reshape the data frame to be able to select such columns
head(week4Data)
week4Data %>% dplyr::select(Hair, Sex)  # select Hair & Sex columns 

#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as a new dataset
#and give it a name
Hair_Sex <- week4Data %>% dplyr::select(Hair, Sex)  # Hair & Sex data set 

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
Sex_data <- Hair_Sex %>% dplyr::select(-Hair)  # Sex only data set 
head(Sex_data)

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'
Sex_data %>% rename(gender = Sex)

#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
Gender_data <- Sex_data %>% rename(gender = Sex)
head(Gender_data)

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
Gender_data %>% filter(gender == "Male")
only_males <- Gender_data %>% filter(gender == "Male")
head(only_males)

#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)
group1 <- group_by(Gender_data, gender)
head(group1)

#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#After you run it, write the total here: 592 
total=mutate(week4Data, total=cumsum(Freq))

#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
only_females <- Gender_data %>% filter(gender == "Female")

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
bind_rows(only_males, only_females)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
## arrange rows: 
Hair_Sex %>% arrange(desc(Sex)) # To arrange the rows in descendent order based on sex, so all the females will appear first


