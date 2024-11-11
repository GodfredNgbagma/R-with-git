library("tidyverse")
library("readr")
data_sets <- read_csv("C://MY FILES//R projects//datasets//top10s.csv")
View(data_sets)
glimpse(data_sets)
data_sets <- top10s
  
#selecting the year column
data_sets %>% select(year)

#select popularity column 
data_sets %>% select(pop)

# select the top, popularity, title, year columns
data_sets %>% select(`top genre`,pop, title,year)
view(data_sets)

# select the artist, title, top genre ,year columns
data_sets %>% select(`top genre`,title,year, artist)

#returning different yrs,artist and genres in the data set
data_sets %>% distinct(year)
data_sets %>% distinct(`top genre`)
data_sets %>% distinct(artist)

data_sets %>% distinct(year,`top genre`,artist)

#calculate the average of energy, valance and duration
data_sets %>%
  summarise(mean_energy = mean(nrgy),average_valance = mean(val), average_duration = mean(dur))

#calculate the a maximum danceability, popularity and tempo(BPM)
data_sets %>%
  summarise(max_danceability = max(dnce),max_pop = max(pop), max_tempo = max(bpm))

#Rename nrgy to energy
rn <- data_sets %>% rename("Energy" = nrgy)
view(rn)

#rename 'dur' to duration and 'val' = valence
rn <- data_sets %>% rename("Duration" = dur, "Valence" = val)

#rename 'acous' to Acoustic and 'spch' to Speech, 'dnce' to danceability and 'dB' to loudness
rn <- data_sets %>% 
  rename("Acoustic" = acous, "Speech" = spch, "Danceability" = dnce, "Loudness" = dB)

#Arranging data
ar <- data_sets %>%  
  arrange(year)
view(ar)

ar <- data_sets %>%  
  arrange(desc(year))
view(ar)

#Chaining multiple verbs
sub_set <- data_sets %>% 
  rename("Tempo" = bpm, "loudness" = dB) %>% 
  select(title, artist, Tempo, loudness) %>% 
  arrange(desc(Tempo))
view(sub_set)


sub_set2 <- data_sets %>% 
  select(title,artist,year,bpm, nrgy,dnce, dB) %>% 
  summarise(
    `Average Energy` = mean(nrgy),
    `Median Tempo` = median(bpm),
    `maximum Dance` = max(dnce),
    `minimum Loudness` = min(dB)
  )
view(sub_set2)


sub3 <- data_sets %>% 
  rename("Popularity" = pop) %>% 
  select(Popularity,artist, title, `top genre`) %>% 
  arrange(desc(Popularity))
view(sub3)
