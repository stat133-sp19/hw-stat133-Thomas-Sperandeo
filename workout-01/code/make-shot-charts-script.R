#Title: Make Shot Charts Script
#Description: The purpose of this script file was to import an image of a basketball half-court, create individual/culmulative player shot chart scatterplots using the image as a background and then exporting the scatterplots to our images folder as .pdf files. 
#Input: court_file, thompson, curry, iguodala, durant, green, shot_data
#Output: thompson_scatterplot, curry_scatterplot, iguodala_scatterplot, durant_scatterplot, green_scatterplot, thompson_shot_chart, curry_shot_chart, iguodala_shot_chart, durant_shot_chart, green_shot_chart, faceted_shot_chart

library(ggplot2)
library(jpeg)
library(grid)
library(knitr)


##Importing Background Image
court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
  )

##Creating Thompson Scatterplot
thompson_scatterplot <- ggplot(thompson) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag))
thompson_scatterplot

##Creating Curry Scatterplot
curry_scatterplot <- ggplot(curry) + 
  geom_point(aes(x = x, y = y, color = curry$shot_made_flag))
curry_scatterplot

##Creating Durant scatterplot
durant_scatterplot <- ggplot(durant) + 
  geom_point(aes(x = x, y = y, color = durant$shot_made_flag))
durant_scatterplot

##Creating Green scatterplot 
green_scatterplot <- ggplot(green) +
  geom_point(aes(x = x, y = y, color = green$shot_made_flag))
green_scatterplot

##Creating Iguodala scatterplot 
iguodala_scatterplot <- ggplot(iguodala) +
  geom_point(aes(x = x, y = y, color = iguodala$shot_made_flag))
iguodala_scatterplot

##Creating Thompson Shot Chart and sinking to images folder
thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + 
  theme_minimal() 
thompson_shot_chart


##Creating Curry Shot Chart and sinking to images folder
curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + 
  theme_minimal()
curry_shot_chart

##Creating Durant Shot Chart and sinking to images folder
durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + 
  theme_minimal()
durant_shot_chart

##Creating Iguodala Shot Chart and sinking to images folder
iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + 
  theme_minimal()
iguodala_shot_chart



##Creating Green Shot Chart and sinking to images folder
 draymond_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) + 
  ggtitle('Shot Chart: Draymond Green (2016 season)') + 
  theme_minimal()
 draymond_shot_chart

##Creating a faceted shot chart
 faceted_shot_chart <- ggplot(shots_data) +
   annotation_custom(court_image, -250, 250, -50, 420) +
   geom_point(aes(x = x, y = y, color = shot_made_flag)) +
   ylim(-50, 420) +
   facet_wrap(~ name, nrow = 2) +
   ggtitle('Shot Charts: GSW (2016 Season)') 
 faceted_shot_chart


