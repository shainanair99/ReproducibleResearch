##First, we calculate and report the total number of missing values in the dataset (i.e. the total number of rows with NAs)
sum(is.na(df$steps))

## [1] 2304

```{r, echo=TRUE}
nas <- is.na(activities$steps)
total_empty <- sum(nas)
percentage_empty <- mean(nas)
# Total empty results
print(total_empty)
# Percentage
print(paste(sprintf("%.2f", percentage_empty * 100), "%", sep=""))
```

- Using average of that 5-minute to populate NAs
```{r, echo=TRUE}
not_empty <- mutate(activities)
na_intervals <- not_empty$interval[nas]
average_na_intervals <- sapply(na_intervals, function(item) {average_of_steps_by_interval$average[average_of_steps_by_interval$interval==item]})
not_empty$steps[nas] = average_na_intervals
#average_of_steps_by_interval$average[average_of_steps_by_interval$interval==0]
```
