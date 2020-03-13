cls =c("integer", "character", "integer")
df <- read.csv("activity.csv", head=TRUE, colClasses=cls, na.strings="NA")
head(df)

##the next step is to process/transform the data
df$date <- as.Date(df$date)
df_ign <- subset(df, !is.na(df$steps))
