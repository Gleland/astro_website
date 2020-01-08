# README


## Astro Website


### Angle Converter

Started by a conversation with Kathryn, where she wanted to paste a lot ( a few hundred) RA and DEC values for potential targets during an observation run. Sometimes publications (and telescope control UIs) will reference star locations in the [Sexagesimal](https://en.wikipedia.org/wiki/Sexagesimal) format (Hours, Minutes, Seconds for Right Ascension, and Degress, Minutes, Seconds for Declination), while others will use [Decimal Degrees](https://en.wikipedia.org/wiki/Decimal_degrees). In this case, she had a lot of HMS values to convert to DMS, and wanted to dump them into a websiet and paste the results somewhere else.



### Usage
By running `rails server`, one can then visit `http://localhost:3000/converter` to get to the landing page. Then just enter in some coordinates:

```
 00 39 40.66 +40 51 25.3
 00 39 42.07 +40 52 21.3
 00 39 50.50 +40 53 07.3
 00 40 21.41 +40 40 35.6
 00 40 30.11 +40 45 02.2
 00 40 33.97 +40 44 29.8
 00 40 59.47 +41 02 29.3
 00 41 06.50 +40 48 48.7
 00 41 17.42 +41 08 37.4
 00 41 34.78 +41 14 18.0
```

to get the results! 

```
RA 	Dec
9.9194166667 	40.8570277778
9.9252916667 	40.8725833333
9.9604166667 	40.8853611111
10.0892083333 	40.6765555556
10.1254583333 	40.7506111111
10.1415416667 	40.7416111111
10.2477916667 	41.0414722222
10.2770833333 	40.8135277778
10.3225833333 	41.1437222222
10.3949166667 	41.2383333333
