OFA notes
===
1. [classes](#classes)
   1. [Graph/OSD](#class_osd)
   1. [Rect](#class_box)
   1. [Position](#class_box)
   1. [Box](#class_box)
   1. [Shape](#class_shape)
   1. [MovingObject](#class_moving_object)
1. [flow charts](#flow_charts)
   1. [object detection](#flow_object_detection)
   1. [find objects from mv data](#flow_find_objects_from_mv_data)
   1. [MovingObjectFactory::find()](#flow_moving_object_factory_find)
1. [note](#note)
   1. [compose the intersect or adjacent objects to one](#note_1)

---
<a name="classes" />

## classes

---

<a name="class_osd" />

### Graph/OSD

![Graph/OSD](http://www.plantuml.com/plantuml/png/bP4x3i8m38RtdC8RHHIneue9YP610rGcDIKY95LYnBDtnsq1CLGy5bksFplvRJPi2PQhEMYBCK91uWEoyKwf2lKEIm8V2xWg05n73gZvmIu2Ljks032wFejr4V2O3FkokJMEaatm-_oKGklFAR1l8h7d_gP0cXCX13sciEs7j0dQqWCBM9X3x0UPJizf6-yuXMWk9CzBkccebPXENhEKB8ELSQKbzWvcivVOoB8YNPV4kN4IE4t94APDJqUyB-4FwHy4Vv7vixZkQjbjF6v_Mwl9uEtEWyaT)

---

<a name="class_box" />

### Rect/Position/Box

![Rect/Position/Box](http://www.plantuml.com/plantuml/png/VL9HRi8m3FtlAQmY4TZ4q7wdQH-SODe5K9fwRQ1DK6m6syJT5oVG8csiKYexVdv-TioMEuILFoxVq32OJXCXGOtH2fgjTqMnqsQh6uJA7-6xW0o2X1SNO68Tmt4qFqVpC9fjD4_5aF_goGh_FnnNwDMvTensblXPghz0Y7_AjqcE-CczRv3Nuitcy0J6E-8aU9gZbjQwtcY3ZcTNmPG_7o1H1WOIaXkOZRS3GHGubGcTGxgkRsK5xFq7_XaznUCy8mJRjBcJIUvVHNubZR2sZa038OD_XtxFUzr1WiftQIi_JuIoTWRf8NDnYz1ZNs40bMQdG0S4kTvTdcEaSZMG_K8f8uY1kkgysTA0ExJMj55Q7oaoL-pFkWPyjOarRfHMO2c1AxztjS07GjcpSyrVJ1X5oOHaCsGdoiSIxXOBA5sPMYvEnL9TBQnQ_W00)

---

<a name="class_shape" />

### Shape

![Shape](http://www.plantuml.com/plantuml/png/ZLDDJyCm3BtdLrX2seUsCSxJu8BWF05tbALMYSYQAh50q-X_9vzT0zMqGwlQxptdnNP9aaAm7xn548fRYnOgT5-6azGDOoqNdxpEb1E3I8FNFWQuUK51ODmhXafQskwqbRx40xJfoqQqalo0X2P4YnhftIjdSzY0S2G2NsqIqHFVMp9SK5SP_XquNrfM3knORyNpULEhR6TnWVkab6pjDSn7QSHL9T-ClFRqdLR7MZSNcR6nsv_LQd2nCfykKIQZtpANhPNPv8ALitnsNTRccBoTBBa54Dr26EI4iy5amg2N81k2FChxEt-BKEQ2kboBoNalXkBEFOqcXBqcqeUuCf3g-9FdcnG13qx21M__yvQzkw52nAbg0nYR-4TvzZGGKPwmaxMnULw6JHMi-aQUHxLr7Husr85vwM0CJ7is3lQxDGRcRHe1MSVMq-BNdQv_0G00)

---

<a name="class_moving_object" />

### MovingObject

![MovingObject](http://www.plantuml.com/plantuml/png/XLBBReCm4Bpp5Ilra4I9adjLzT13Rr4F_G3ac2Li2ZQrjmGKqM_l6aX3AMgHUCnwPdR7c8bpXBsjo1nV3YVK33fNtaE2ydQAoPeeAfL-KyS9xnB1mFrL1hWZmr37sXRb3JSZ_6HhEDYw1w-PAX5yU7Q5zTXnsTji1lcgPrJa-4FbyFa_bNoiojBPcWh5c3SnlejooeLxcSVclIHnwhmCfSfI8gKscWtxh3HRrmoPrpbvVXYlFqBHeTXsqFSqk7YMZTKjQ8SoqSmaOvEfA2MJJ2GRS4AS4RPo6yieqPXjqU_sjUrg0sm70Ce06MbXD89DV_Xi1rdNk1U5pxyaq4d2TSv8Pv0f3wD_01M6ZHE714XMafFIQFXR91quamDHegQKCEdYRQ-ZMeD0QM0ul3KI7qagbWr82vs5gL7yG_oeZNQBkKEys7q1)

---

<a name="flow_charts" />

## flow charts

<a name="flow_object_detection" />

### object detection

![object detection](http://www.plantuml.com/plantuml/png/PP0nJyD038Nt-nLMfsQ916pDmCB2WDI1lNBktCJeSexktAI0-Eyu8KL8hC_lFNzsKSpgt84JAsFa3rIMrBWaIf2vwzK1tDKJ1nBmFQP44JW5kff-Nm-os64YhvB_pH_gkIVjAOCATAJ00tO40HKTfG3B4kVcdYF1NljC64vb0NgiW0litwbKLdDuEJwVBFuwJ4yMRKmQpSJhwjsOnLCfC4nhyGu-RMwXir7081Ed3gHzCy82vop3pTZys4B66LgvfB0OMxbkkiVeBn7j2vwIPemm2YVzczhA0sShNxy6y7NZpHG92_qosxtReKagvuhA-0q0)

---

<a name="flow_find_objects_from_mv_data" />

### find objects from mv data

![find objects from mv data](http://www.plantuml.com/plantuml/png/RP91ReD034NtdE8lYHHn0AAgk-wgIhr0P0QJJ0jZD1xIfAUlPqAZLEa6XFrjls-ZYMAggg-Z7ncrLwGZHyPqGa-9u0EwPHWuFczWoVh2kga0Fw2-IHH14huvoYPNXviAQD_P9SJyUCA1qxuRnNtkSw3Ux8h4QXdH7uwfVE91jeMZqIqZcSxQOvNDeZvv2Q3GG_qtGuQIBxLDKR6bSlyhowkSV3YyTHyPPn8ZMbi1zwaNSadYfHbywElptiaqRt5Ptnbf1MydQJevDzJtzLtumSzL1YSXaGyAWdBAiDEI5Xf_8QZ_8CSXeQpCX8c2Ozt26op5JrrrnQ8ieJTWK6JwzIs5_i4uZsg73P8FOc4_LFPSpvsZLTiqpQxwWos1CPCgHf7PrX_oWVC-RDdWioredPRXhPSx6k857KFdqNYJcCSJHtDdrbcRwWPKjV_ikcqdZWVUNvjg_ZN-0fLqSUb3ugXvjCGy_RQsjJRFDlpxYPfa_W40)

---

<a name="flow_moving_object_factory_find" />

### MovingObjectFactory::find()

![MovingObjectFactory::find()](http://www.plantuml.com/plantuml/png/ZP9DReCm44RtFiKi4oad8FligXuX6imG9W6FQm_af-hTEmuaIgGkoWOZVtplUI1YKbQM01yoSJXyraVokaElagvLrN9euDjbjPXpRI-e5e8WIf3uqAa3kEoz3743dII-IL3iORXtmKIbnYBN9JAHqVmVWMIB3KJ9imiQDVEDG5hGZc2OeEx5dnpPHe4xboWI5ZotiE9S8Wqg0iQOvC83cY5zZSPIUMvQtKpUo_sSwz8UO7MblBQgSYrrHGYmEQAde71cxQ2MCJJ5kfRBVve0waHuMfxCd5ltkC_sSEwufplFtau476pImPS5z9prdP7NOCaPuHx7VWr0MnGVAa6AIULDmcQ1Rn_uITewwZCjfRERgnBfcC8y-TV-hVq84jtFBm00)

---

<a name="note" />

## note

<a name="note_1" />

### compose the intersect or adjacent objects to one

- one pass loop cannot find an exact object which may be split to several boxes.
- it should have the second loop to compose the intersect or adjacent boxes to one object.

![example](https://imgur.com/82tvyF6.png)

