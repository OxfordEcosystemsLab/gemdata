# TODO

- Check table defs
- Finish csv imports
- Add error checking


http://www.cyberciti.biz/tips/postgres-allow-remote-access-tcp-connection.html


<!-- CWD
+ sub_transect_area_m2 default to 20m2 NA=notallowed  & ammend in R code
+ decay_class min 1 max 5 NA=allowed
+ sub_transect_start_point string "0,1" NA=allowed
+ sub_transect_end_point string "0,1" NA=allowed
 -->

DendEltr_v2
+ dbh_height_m should be H_POM & dbh should be D_POM -- ask forest plots
+ dbh_growth_cm should be dendrometer_reading - explain that you need to convert to dbh.
+ replaced_dendrometer_reading  - think of something to call this. NA = allow & adjust code. If this column !is.na, then take this, but calculate the previous change *** check what we do with this 

<!-- FLFEltr_v2
leaves_g - preciser: g per trap
+ trap size m2 NA=notallowed default 0.25 & change R code.
Make sure the code deals with NA when trap not collected. do we need to add a column for previous emptying date?
 -->

<!-- ICEltr
10 min / 5 min interval isn't always 10 min interval, so we need to determine the interval time.
+ time_step_duration_min min 0 max 20 default 10 min NA=notallowed & change R code.
+ either add a column that describes measurement_type "initial core stock" or "production" or create a new table for stocks. & new code for stocks.
 -->

ResconEltr
<!-- double check NA allowed for co2_ref_point -->
 UNITS delta_flux_ymolm2s -- just make sure it is clear that we expect these to be converted. CONVERTED OR NOT? if so delete depth.
+ installation_date NA=allow
<!-- + soil temperature? -->


<!-- ResParEltr
+ plot_corner_code number NA=allow
+ soil temperature?
 -->


Weather data
+ keep all weather data in one file?


SmallStemEltr_v2
dbh_ should be pom?
flag?
species list?
+ sampling_area & check code for sampling area.


