#####################################
#### Creating a Confusion Matrix ####
#####################################
## https://cran.r-project.org/web/packages/cvms/vignettes/Creating_a_confusion_matrix.html

install.packages("MuMIn")
install.packages("cvms")

# Attach packages and set seed for reproducibility
library(cvms)
library(tibble)   # tibble()

set.seed(1)

# Binomial data
d_binomial <- tibble("target" = rbinom(100, 1, 0.7),
                     "prediction" = rbinom(100, 1, 0.6))

d_binomial

# Manually creating a two-class confusion matrix
basic_table <- table(d_binomial)
basic_table

cfm <- as_tibble(basic_table)
cfm

plot_confusion_matrix(cfm, 
                      target_col = "target", 
                      prediction_col = "prediction",
                      counts_col = "n")

# Creating a confusion matrix with evaluate()
eval <- evaluate(d_binomial,
                 target_col = "target",
                 prediction_cols = "prediction",
                 type = "binomial")

eval

conf_mat <- eval$`Confusion Matrix`[[1]]
conf_mat

plot_confusion_matrix(conf_mat)

# Multiclass confusion matrix with confusion_matrix()
d_multi <- tibble("target" = floor(runif(100) * 3),
                  "prediction" = floor(runif(100) * 3))

d_multi

conf_mat <- confusion_matrix(targets = d_multi$target,
                             predictions = d_multi$prediction)

conf_mat

plot_confusion_matrix(conf_mat$`Confusion Matrix`[[1]])

# Adding sum tiles
plot_confusion_matrix(conf_mat$`Confusion Matrix`[[1]],
                      add_sums = TRUE)

# Tweaking plot_confusion_matrix()
plot_confusion_matrix(conf_mat$`Confusion Matrix`[[1]], 
                      place_x_axis_above = FALSE)

plot_confusion_matrix(conf_mat$`Confusion Matrix`[[1]], 
                      add_normalized = FALSE)

plot_confusion_matrix(conf_mat$`Confusion Matrix`[[1]],
                      palette = "Oranges")

plot_confusion_matrix(conf_mat$`Confusion Matrix`[[1]],
                      palette = "Greens")

plot_confusion_matrix(
  conf_mat$`Confusion Matrix`[[1]],
  add_sums = TRUE,
  sums_settings = sum_tile_settings(
    palette = "Oranges",
    label = "Total",
    tc_tile_border_color = "black"
  )
)

plot_confusion_matrix(
  conf_mat$`Confusion Matrix`[[1]],
  font_counts = font(
    size = 10,
    angle = 45,
    color = "red"
  ),
  add_normalized = FALSE,
  add_col_percentages = FALSE,
  add_row_percentages = FALSE
)
