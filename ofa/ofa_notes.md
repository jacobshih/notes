OFA notes
===
1. [classes](#classes)
   1. [Graph/OSD](#class_osd)
   1. [Rect](#class_box)
   1. [Position](#class_box)
   1. [Box](#class_box)
   1. [Shape](#class_shape)
   1. [MovingObject](#class_moving_object)
   1. [MVConfig](#class_mvconfig)
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

![Rect/Position/Box](http://www.plantuml.com/plantuml/png/VLHjZzem3FxUNs4nwGexNhIl4yU7qxvlslq0bAQ6XcjZb8HHTkA_pqueHVHO9Ohps7dY9xORJAWHNgbT_4OTGDVAU_HG8bjE1KCsoo88Fzz-m789RyPkQmnaORM2ZmpW-SC73jJdBOQriRom6iSJ-2uxn5ywTHnFEcjT6ulZZQDctKuX_f-c44XM_3xrWOuJ6ZFAxkCKgjwXZTCrNbnEbURWUsV0jjkr8HkcuCrVP6g69zavo_PAlwijGa5jJ3-9Y-9boJJ61cXxyzIRnzwiabdZ9aHjR3kphQwBGFlEB2W4QhgLyMlPjFQLSbZUe77x46QY8PWeXxWgTqgZ3JSG9ulEOu9OVwVu5ucC_qgcFN8Ba5jsT1smkWTUNWR8FV1y3ypkCtgzL0JWIsryM4fDLY1Tu1CQYoJhH2Jz5dj4UaqJTruiuzFmDcwSSV_WTlJ3c9rSqyN92Jv9trnSgYmVxNBOq1_yr7lcdwM04EkTX2NzEVFd8YGe7YDGm5K3sa1p20TLnqXvEbMfPxk1y_D45Ig41fi27UJnwdBW7W61z-HD7EWhaotZTCWX4d1bBchIx_uQTwoChZYnXXaI5QlZpm1GiUCZ7foSW_4nkA23BJdyoYUZTpboG8ISaroFj8KqnEZR2BxEPZ2oeoYOuVWXci_5pGEzo6ycEb_y0m00)

---

<a name="class_shape" />

### Shape

![Shape](http://www.plantuml.com/plantuml/png/ZLHDRzim3BtxLn0Oq3g8c-vSUBdiuzfYwJrGPJOLfaY6nAxDilptKb-nlGL13abCFb9wV7mEAT88_aNq258Bxz53X_pa12bhgYecuNxr3TeMLifiD98ri5p2lWAOxprneJniaDRAS60arZEu2nq1xvnugsVbQQsLmVhPsUtwlO7uksk0R8ZuUpSKEfHKSvRXjmPU1a0g9pLco8bElVe197mlNS_MK0DU_K4-cjEpwb1LlP2_nARC6mP8uwsECS2ddtmrXFjJg9Mdzi4gGqlemuzF-Kw9BHAw6Ct3_95pc5rQLWB2ELS9tOidJqv8EYGzkEQtLHs3JAgG2FKYw9k9pC_KVjTQzVwIogzHhmiA7vswzFO7gtSRDi6voYHf-_VcPXXiciupJ9E9xZHNc4spcKGrNU8F5jcwNQPMt3cN3WLXFLfCt703l4yec_poEGmHZpdJFVB3LJR4kEt07sC9uSaIsMto2kGJmfspkno1Y1pYQ8l_wveZht57iZzO1vZa-wSp4nfrKDahz_H9iz23feiyWtw3yreMTgmZWyLgS0hCxZeD7Xrr2YmUEW4o6lzl5ekiAh-wjzUJT_VwzWC0)

---

<a name="class_moving_object" />

### MovingObject

![MovingObject](http://www.plantuml.com/plantuml/png/XLJ1Rjim3BtxAuW6QDCvIR5haUQm0GDsA3QiGA-68jE9KaVo92LDrcNVFbAo4pjnjm9jJVAz9v8YvPKl4HxDLkd5j_aAfGTP2kSWH_flXLT69qabv8jOdE7U4gYn5sw0WT8UTfaqw-faxrls9xE3kTb5usafAWJ7VuCZRIiEeyoefjz6n5PPln4b_Fa_LBbCL9KrExKM7ijzXZ-9UOw5Uyh7b96IM_4wPDVMg9nSXwIts2z2UcFtTSrfgPoVjkCpM0ShCy5q4GPlpbDZvG6aHSge9vEso3cfK3e_eup04h27UA1VRJnIQTwRTUnsS-pj2Bof3H0QbAOZj4GmHKTdKjF2mP74d_-Y10R_l2wLNC9IE6XT0MoH-qO2EIYAv2iXKPz8T81VqZnKA5MXC0_LJPfCZKPG1ICi7YaaGtMIuXxe1Bdad97akNY-kyw8JYUJlcjasFDdemkrk81GZ2VswkCLJ2OVpaEFXlVaELRr3kQxuHMO_XwFE_3aaDpTzEtNpLsIr1DtJ6eAJnGlqHiDiraOkxIPYmNwhBcECBeDZK23hxM2F7hccw90c-dDUewM7HKrMJbUTuwMHhvaJltY3W-sAaUJePOc9uhVXorDbLP-o2kMyj4TlPFxgDf27hLFliiJOiprAxjBPTUZxDvJFZIjvJlbBWx2wlu8AslhJHsm6QmcI_uEhQKsEWySlqxg1wQUuM4h59Uo1j3betKiq8jOyNJK8Khgcj_6411vti-mI6yBziIEnSM9UujtHQznyy63dfeAwNKtTXfRrPYphldmS6PtpRHhZhcrVm40)

---

<a name="class_mvconfig" />

### MVConfig

![MVConfig](http://www.plantuml.com/plantuml/png/bLJ1Rjim3BtxAuWEQDErNh7h4FJIqu3rr65NGvOeLuWi6HATDkloxvEbsN1Y9uilXlp8nqUH3o956e5R8rNLEaRA6k2QUOyU18PJmhAiONp3gkFKZmo0bPuSuvHuyFqfPiGGmDr77zuhesXrUumo8LQXfYS8W3BLDMnmTm-7q9Rf5YVK2ccEUfxavqcNw0dKK-eaIrjsV2EfD1ODezTfDsoB_qaMRTt4iUspy4apVlxrRyZhDRm4baOAotXy78RkAUo7TnCgL2ZE3CVLBNmRY37jKxygFiBALafqXMdh4bs26eTS-Su5AKDRlYcy-etfVwi4sW8Djo8GQTSa_6wyxwwHWyhZm53_87jG6QDJhJxgJoduEGK_g-1FAuo6duRsekf6uqzyftxeu_ikTlK2Bozsy3dVNk3M9Hu5o1qoKIH75LtUUMh-vXJXfVbn2xrhrt_oVBAC43UM44fBPEieCTbNFDLeo0Ez9hCgG-Wau-7Lit9GA7V0UC1yw2IcCQ2kGDVJuKFu9OJHYAXzeiSVgdoIrSd-KdXHRvnftNV6hNFe6sj4G42sXdTjHOPM9PVLSOV34_8v5_RDv73rzQeldkspXvlP1__cuIy0)

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

