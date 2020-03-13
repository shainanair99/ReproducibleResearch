```{r, echo=TRUE}
not_empty_items <- tapply(not_empty$steps, not_empty$date, FUN=sum)
par(mfrow=c(2,1))
barplot(items, las=2, cex.names = 0.5, main="Histogram with missing values (NAs)")
barplot(not_empty_items, las=2, cex.names = 0.5, main="Histogram without missing values (NAs)")
```

As we can see, missing values can change the final result of an analysis.

Panel plot comparing the average number of steps taken per 5-minute interval across weekdays and weekends

```{r, echo=TRUE}
activities_with_days <- mutate(activities, weekday=weekdays(date))
activities_by_day_interval <- group_by(activities_with_days, weekday, interval)
results_per_day <- summarise(activities_by_day_interval, steps=mean(steps, na.rm=TRUE))
qplot(interval, steps, data=results_per_day, facets= weekday ~ .) + geom_line()
```
