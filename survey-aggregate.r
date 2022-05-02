library(tidyverse)
library(readxl)
library(here)

# for privacy reasons, the original survey responses aren't
# included here. the code to reproduce the survey counts for
# forms of violence, however, is.

here("data", "survey-responses-translated.xlsx") %>%
  # load the tidy the data
  read_excel(range = cell_limits(ul = c(2, 1), lr = c(NA, 14))) %>%
  set_names(c("city", "province", "job_title", "medium", "duration",
    "types_violence",
    paste0("has_", c("bodyshaming", "nonsex_comments", "sexual_comments",
      "violent_threats", "doxxing", "misinfo_slander", "ethn_race_religion",
      "wiretapping_hacking")))) %>%
  # drop columns we aren't interested in
  select(-city, -duration, -types_violence) %>%
  # convert the "has_" columns to boolean
  mutate(across(starts_with("has_"), ~ .x == "Ya")) %>%
  # translate some responses
  mutate(
    medium = recode(medium, "Cetak" = "Print", "Daring" = "Online",
      "Televisi" = "TV")) ->
    # job_title_groups = recode(job_title,
    #   "Pemimpin Redaksi" = "Editor in Chief",
    #   "Redaktur Pelaksana" = "Managing Editor",
    #   "Asisten Redaktur" = "Assistant Editor",
    #   "Peniyar" = "Announcer/Presenter",
    #   "Penyiar Radio" = "Announcer/Presenter",
    #   "Penyiar radio" = "Announcer/Presenter",
    #   "penyiar" = "Announcer/Presenter",
    #   "Presenter" = "Announcer/Presenter",
    #   "News Anchor" = "Announcer/Presenter",
    #   "Produser" = "Producer",
    #   "Kontributor" = "Contributor",
    #   "Wartawan" = "Reporter",
    #   "Wartawati" = "Reporter",
    #   "Jurnalis" = "Reporter",
    #   "Pewarta warga" = "Reporter",
    #   "Video jurnalis" = "Reporter",
    #   "Fotografer" = "Photographer",
    #   "Freelance journalist" = "Reporter",
    #   "Koresponden" = "Correspondent",
    #   ??? Korlip  
    #   ) ->
tidy_responses

# get_group_counts: get the counts and proportions of the rows,
# grouped by selectec columns (...)
get_group_counts <- function(df, ...) {
  df %>%
    group_by(...) %>%
    summarise(
      total_n = n(),
      across(
        starts_with("has_"),
        list(
          n = ~ length(which(.x)),
          p = ~ length(which(.x)) / total_n)))
}

get_group_counts(tidy_responses, medium) %>%
  arrange(desc(total_n)) %>%
  write_csv(here("data", "survey-counts-by-medium.csv"))
