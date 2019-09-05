#!/usr/bin/python

from datetime import date

wacken_date = date(2020, 07, 30)
remaining = wacken_date - date.today()
print remaining.days
