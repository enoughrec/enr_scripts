
i want to automate the filtering of artists from the .csv dump provided by routenote at some point

until i do here are the basic step instructions to obtain it:

* import csv

* select 2nd row

* go to data -> standard filter

* select column C and insert the name of the artist

* scroll to bottom

* insert formula =subtotal(9;O1:Olastrow)

* =SUMIF(J1:J2594, "USD", O1:O2594)
