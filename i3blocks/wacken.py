#!/usr/bin/python
# -*- coding: utf-8 -*-


from datetime import date

wacken_date = date(2020, 07, 30)
copenhell_date = date(2020, 06, 18)
ppeurope_date = date(2020, 10, 2)
remaining_wacken = wacken_date - date.today()
remaining_copenhell = copenhell_date - date.today()
remaining_ppeurope = ppeurope_date - date.today()
print 'ꟼP ', remaining_ppeurope.days, " | W:O:A ", remaining_wacken.days, ' | ₦ ', remaining_copenhell.days

