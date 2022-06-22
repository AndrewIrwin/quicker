# profiling-code.R
# 2022-06-20

library(profvis)

# example from 
# https://support.rstudio.com/hc/en-us/articles/218221837-Profiling-R-code-with-the-RStudio-IDE

times <- 4e5
cols <- 150
data <-
  as.data.frame(x = matrix(rnorm(times * cols, mean = 5),
                           ncol = cols))
data <- cbind(id = paste0("g", seq_len(times)), data)

profvis({
  # Store in another variable for this run
  data1 <- data
  
  # Get column means
  means <- apply(data1[, names(data1) != "id"], 2, mean)
  
  # Subtract mean from each column
  for (i in seq_along(means)) {
    data1[, names(data1) != "id"][, i] <-
      data1[, names(data1) != "id"][, i] - means[i]
  }
})

