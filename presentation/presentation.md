<style>
h3 {
    color: darkblue!important;
    text-align:center;
    width:100%;
    background-color:#FFCC99;
    padding:20px!important;
}

h2{
  text-align:center;
  font-weight: normal!important;
}
</style>

"The car selector"
========================================================
author: Oliver Schmid
date: 20th of June 2015
font-import: http://fonts.googleapis.com/css?family=Roboto
font-family: 'Roboto'

Motivation
========================================================

The car selector is a tool which allows to filter a list of cars depending on your preferences.

You can filter the cars by the following criterias:

- Miles per gallon (MPG)
- Horse power (HP)
- Cylinders (Cyl)

Frontend
========================================================
The frontend provides appropriate input mechanisms such as sliders and selection boxes which allow you to refine your definition while the result table updates reactively. 

You also find some columns in the result table to be highlighted. These values indicate the closest values to your current filter values.


Backend
========================================================

The application bases on the cars data out of the "mtcars"-package provided with R - this includes (but is not limited to) the following models:

```r
data(mtcars)
paste0(head(rownames(mtcars), n=10), collapse=", ")
```

```
[1] "Mazda RX4, Mazda RX4 Wag, Datsun 710, Hornet 4 Drive, Hornet Sportabout, Valiant, Duster 360, Merc 240D, Merc 230, Merc 280"
```

The logic
========================================================
The logic on the server not only subselects the given list of cars but also calculates the differences between the cars' properties and the current filter selection.

As a result, the server logic highlights those columns in the result table which are the closest to the given value. This should help to indicate the best fitting car models depending on the filter criteria.

Try it!
-------------
Go to https://olinux.shinyapps.io/shiny and try it yourself!
