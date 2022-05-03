# Data files in this analysis

## Files derived from `survey-aggregate.r`

[This analysis](../survey-aggregate.r) aggregates deidentified survey data into counts and proportions of journalists who reported experiencing various types of violence.

* [`survey-counts-by-medium.csv`](survey-counts-by-medium.csv): a data frame of reported counts and proportions by medium. Columns include:
  - `medium`: Online, TV, Radio or Cross-platform
  - `total_n`:  The total number of respondents in this group
  - Then, pairs of columns reporting the number (ending in `_n`) and proportion (ending in `_p`) of respondents reporting a specified form of violence:
    * `has_bodyshaming`: "Have you ever received body shaming comments online?"
    * `has_nonsex_comments`: "Have you ever received annoying/harassing non-sexualcomments?"
    * `has_sexual_comments`: "Have you ever received annoying/harassing sexual comments?"
    * `has_violent_threats`: "Have you ever received threats of physical violence?"
    * `has_doxxing`: "Have you had your personal information exposed?"
    * `has_misinfo_slander`: "Have you ever been a victim of misinformation or slander?"
    * `has_ethn_race_religion`: "Have you ever received an insult based on your ethnicity/religion/race?"
    * `has_wiretapping_hacking`: "Have you ever experienced wiretapping, hacking, interception or monitoring of your communications?"

### Unit level data

Although `survey-aggregate.r` is provided for reference, its source data (the deientified survey responses) have not been published in order to protect the privacy of respondents.
