
# Create the progress bar object
max_iter <- 811480
pb <- progress_bar$new(total = max_iter)

# Define the community detection function with progress bar
my_walktrap <- function(graph, progress) {
  result <- walktrap.community(graph, steps = 10)
  for (i in 1:result$steps) {
    progress$setinfo(i * max_iter / result$steps)
  }
  return(result)
}

# Run the community detection function with progress bar
wc <- my_walktrap(g, progress = pb)
plot(wc, g, vertex.size=15, layout=layout.fruchterman.reingold)