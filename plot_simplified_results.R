library(tidyverse)
found <- c()
for(extinction_rate in c(1, 5))
{

  begin <- paste0("/Users/janzen/MEGAsync2/substitutions/extinct/",extinction_rate,"/")
  library(tidyverse)


  for(model in c("indep","cond")) {
    f <- list.files(path = paste0(begin, model, "/"), recursive = T)
    for(x in f) {
      file_name <- paste0(begin, model, "/", x)
      if(file.exists(file_name)) {
        cat(file_name, "\n")
        if(extinction_rate == 5 & model == "cond") {
          vx <- read_tsv(file_name, col_names = T, col_types = cols())
        } else {
          vx <- read_tsv(file_name, col_names = F, col_types = cols())
          colnames(vx) <- c("beta", "gamma", "tree_height",
                            "mean_branch_length", "nLTT", "method", "node_time","replicate", "extinction")
        }


        vx$model <- model
        found <- rbind(found, vx)
      }
    }
  }
}

begin <- "/Users/janzen/MEGAsync2/substitutions/no_extinct/"

for(model in c("indep","cond")) {
  f <- list.files(path = paste0(begin, model, "/"), recursive = T)
  for(x in f) {
    file_name <- paste0(begin, model, "/", x)
    if(file.exists(file_name)) {
      cat(file_name, "\n")
      vx <- read_tsv(file_name, col_names = F, col_types = cols())
      colnames(vx) <- c("beta", "gamma", "tree_height",
                        "mean_branch_length", "nLTT", "method", "node_time","replicate")

      vx$model <- model
      vx$extinction <- 0.0
      found <- rbind(found, vx)
    }
  }
}


found <- as_tibble(found)
found$model[found$model == "indep"] <- "Unlinked"
found$model[found$model == "cond"] <- "Linked"

found$method[found$method == "nodesub"] <- "Node Substitutions"
found$method[found$method == "reference"] <- "Twin Alignment"

found$model <- factor(found$model, levels = c("Unlinked", "Linked"))




px <- found %>%
  filter(node_time == 0.1) %>%
 # filter(extinction != 0.5) %>%
  ggplot(aes(x = nLTT, fill = method, col = method)) +
    #geom_histogram(alpha = 0.5, binwidth = 0.001, position = "identity") +
    geom_density(alpha = 0.5) +
    facet_grid(cols = vars(model), rows = vars(extinction), scales = "free") +
    scale_fill_manual(values = c("#FF3333", "#F99F55")) +
    scale_color_manual(values = c("#FF0000", "#E77E22")) +
    xlab("Error") +
    theme_bw() +
    theme(legend.position = "top") +
    labs(col = "", fill = "")

px
pdf("Results_nodesub.pdf",onefile = F)
px
dev.off()



