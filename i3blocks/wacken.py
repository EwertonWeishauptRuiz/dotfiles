#!/usr/bin/python
# -*- coding: utf-8 -*-


from datetime import date

wacken_date = date(2023, 8, 2)
copenhell_date = date(2023, 6, 18)
remaining_wacken = wacken_date - date.today()
remaining_copenhell = copenhell_date - date.today()
print(f"W:O:A {remaining_wacken.days}  |  ₦ {remaining_copenhell.days}")

