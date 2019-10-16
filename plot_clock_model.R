begin <- "/Users/janzen/MEGAsync2/substitutions/extinct_3/independent/"

f <- list.files(begin, pattern = "results.txt", recursive = T)

library(tidyverse)

found <- c()
for(x in f) {
  file_name <- paste0(begin, x)
  vx <- read_tsv(file_name, col_types = cols(), col_names = F)
  colnames(vx) <- c("sub_model","clock_model","tree_model","ll","ll_sd","weight", "method","node_time","mu")
  vx$node_model <- "Unlinked"
  found <- rbind(found, vx)
}


begin <- "/Users/janzen/MEGAsync2/substitutions/extinct_3/cond/"

f <- list.files(begin, pattern = "results.txt", recursive = T)

library(tidyverse)

for(x in f) {
  file_name <- paste0(begin, x)
  vx <- read_tsv(file_name, col_types = cols(), col_names = F)
  colnames(vx) <- c("sub_model","clock_model","tree_model","ll","ll_sd","weight", "method","node_time","mu")
  vx$node_model <- "Linked"
  found <- rbind(found, vx)
}


found %>%
  filter(mu != 0.3) %>%
 # filter(clock_model == "relaxed_log_normal") %>%
  filter(node_time == 0.5) %>%
  ggplot(aes(y = weight, x = clock_model, col = clock_model)) +
  geom_jitter() +
  #stat_smooth() +
  facet_grid(cols = vars(node_model), rows = vars(mu), scales = "free") +
  scale_color_manual(values = c("#FF0000", "#E77E22"))

found %>%
  filter(mu != 0.3) %>%
 # filter(clock_model == "relaxed_log_normal") %>%
  ggplot(aes(y = weight, x = node_time, col = clock_model)) +
  geom_point() +
  stat_smooth() +
  facet_grid(cols = vars(node_model), rows = vars(mu), scales = "free") +
  scale_color_manual(values = c("#FF0000", "#E77E22")) +
  ylim(0,1)





