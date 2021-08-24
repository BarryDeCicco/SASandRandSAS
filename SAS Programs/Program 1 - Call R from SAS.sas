
proc options option=rlang; 
run;

libname a "C:\Users\decicco1\OneDrive - Michigan State University\CSTATRedirects\Documents\CSTAT\Workshops\SAS and R and SAS\Data Sets";
run;


Proc IML;

title "Statistics in R (integration with SAS)";

run ExportDataSetToR("a.RCBD_TEST", "RCBD_IN_R");

submit / R;

############### BEGINNING OF R CODE ##################


# Change the working directory, saving the old one in ‘old_wd’


old_wd <- setwd("C:/Users/decicco1/OneDrive - Michigan State University/CSTATRedirects/Documents/CSTAT/Workshops/SAS and R and SAS/Data Sets")

# Confirm by printing the workding directory:
getwd()

# Load the ggplot2 module (package), so that it can be used.
 library(ggplot2) 

# Create a data frame (data set)

d2 <- data.frame(y = rnorm(144, 12, 3),
                 expand.grid(x = seq.Date(as.Date('2021-1-1'),
                                          by = 'week',
                                          length.out = 24),
                             g1 = LETTERS[1:3],
                             g2 = letters[1:2]))
# Introduce a shift in process performance
d2$y[132:144] <- d2$y[132:144] * 3


# Run a chart

ggplot(d2, aes(x=x, y=y)) +
  geom_line() +
  geom_point() +
  facet_wrap(g1 ~ g2)


# Direct the graphics output to a file, then close it.
dev.copy(pdf,'myplot.pdf',width=6,height=4 )
dev.off()  




# Reset the working directory
setwd(old_wd)

# confirm by printing the working directory:
getwd()        


############### END OF R CODE ##################

endsubmit;         # Any error messages from R will now show up 


CALL IMPORTDATASETFROMR ("a.d2", "d2") ;


proc print data=a.d2;
run;


quit;


proc print data= a.RCBD_TEST;
run;


