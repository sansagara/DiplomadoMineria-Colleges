library(readr)
College <- read_delim("C:/Users/Leonel/Desktop/Diplomado Mineria Datos/College.csv", ";", escape_double = FALSE, trim_ws = TRUE)
cols(
  X1 = col_character(),
  Private = col_character(),
  Apps = col_integer(),
  Accept = col_integer(),
  Enroll = col_integer(),
  Top10perc = col_integer(),
  Top25perc = col_integer(),
  F.Undergrad = col_integer(),
  P.Undergrad = col_integer(),
  Outstate = col_integer(),
  Room.Board = col_integer(),
  Books = col_integer(),
  Personal = col_integer(),
  PhD = col_integer(),
  Terminal = col_integer(),
  S.F.Ratio = col_number(),
  perc.alumni = col_integer(),
  Expend = col_integer(),
  Grad.Rate = col_integer()
)
summary (College)

pairs(College[, 3:12])

boxplot(College$Outstate ~ College$Private)


Elite = rep ("No",nrow(College ))
Elite [College$Top10perc >50]="Yes"
Elite = as.factor (Elite)
College = data.frame(College, Elite)

summary(Elite)

boxplot(College$Outstate ~ College$Elite)

#Some Histograms
hist(College$Outstate)
hist(College$Accept)
hist(College$Enroll)
hist(College$Outstate)


# Filter by Elite.
College_Elite <- College[College$Elite == 'Yes',]
College_Non_Elite <- College[College$Elite == 'No',]

#Outstate
hist(College_Elite$Outstate, xlim=c(2000, 22000), breaks=seq(2000, 22000, 1000))
hist(College_Non_Elite$Outstate, xlim=c(2000, 22000), breaks=seq(2000, 22000, 1000))

#Accept
hist(College_Elite$Accept, xlim=c(0, 30000), ylim = c(0, 500))
hist(College_Non_Elite$Accept, xlim=c(0, 30000), ylim = c(0, 500))
