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

![Rect/Position/Box](http://www.plantuml.com/plantuml/png/VLFRJi9047tlLqmWiKKHugiXF1ZVDVe1PBiTw6AxItO7AHh-tPajRKaKIO2PEMVEN3ebGnN2aslcRwW9TAL2m005ikKL6MUJ90RXvVqP5WjuDtPJ8JaBooLy9m1ttu6Og4yRf9Mnx5YDsGGU9KFmmgj3DkciLMKiPcllwbKpXVX_d08vyVZtE10zDvHnbE735Ce1qCRh2i-GLuNPXm4aRBgijRCqXM2-aAKvF4bEIR9J-aDj47BNnFRRuUBmuWACZILe1lCuc8V1BDbajIx_rGKZo_f7uuBzTAxDQ6K2BQJw4cJUq4PZE-97zqus6xSXMzMETnmRlcbH4rQgs2gDbh8BCEPFUWgtWJw8o1NErfbUW1kyaGsT8LKKrx8yrkuJ_qHF_BME4BpPbEqautR-bFLJ6OGK7mme24ZWrb3lQQygY5JvT6ErZwUxhJ1hjQX4gB7EqKCQTvU2yWWItdMFOv2oHRm4AIECNZgldFu8FUzG6broQpLBj5ey7vyyk7pBDQwKJi64ICxTtXP2xmNbpiurVoaXDoKRaikGcnWzZE3s_Xv6TXH7vd1ywsOpWVbwv-d5-QRp7m00)

---

<a name="class_shape" />

### Shape

![Shape](http://www.plantuml.com/plantuml/png/ZLHDRzim3BtxLn0Oq3g8c-vSUBdiuzfYwJrGPJOLfaY6nAxDilptKb-nlGL10CSH-KZfyP4oAT88_aNq258Bxz53XxnoWfGrLHMTSB_w1cqBAsKs6iaQM2vXNm7CzvuuK1usI6jbs30IwndSXOo0TqwyrREoMcjbi7vsThj-Ro3-xneW6on-xuP0Xv9gzZByri3B04ZbfCOCET6fLp-0XEybwzaQQi2hFyXRitjM7Qgg5_ANs9HwGm6flDNH1lZqau-6S7uojVBKFbYlWXvBwFFA9xHJOek4Bbhpe49a7XIG74GGThjAw5uyUN92qY6fmZ6_hUeOP6g5IeWNGULCPtuczhlMglUNH7wDgbqG-EZKfQS_MBtRy2YSYqp2jdzlRaQ5JVsvYAapyPtw2hMfDxEefhtymIfRjylSof3EfKD1M8yw4nlTW384fPLVFeSguZPdigTZSJNCnJZvm3zZ2U794jbj6Xd8-uIJPtVP0X6Pn08N_ySrHtRZZ7GNm3h09E8_cGEdKHAL3dDQdyGBQMYwI3K8ERIgPON7WZ9OXWvEWNdEJeF7sJe5bcaw2V8Jlq2BHPQMB_FjzUGsNzz-0000)

---

<a name="class_moving_object" />

### MovingObject

![MovingObject](http://www.plantuml.com/plantuml/png/XLJVRzf037xFNs4LgQK3fThhX7ZOf4bxg2QjqbwZu-8Gqt2NtLqfh69_--pB3mAa6n8Gsz_tdUsp4oXK28zsHsRzVRL17K1Nodl8aV-T2cHDajHAFwlr1UujWHPxvGQOa0cmpxJTrYVxCB0_spsixBundafL8tZvZOxPK77QoCnR-ds3s94BBwg2F_-7aizKNJkxfwqAM1qo_CNCIonyudnirL1ofrwdujfPojbrJ4QB_QfqiExGrZoho8V5CBw4RRGo6qtVmE3D1swiFe9so1cDP38KkIGLPF8BoXmS0qU8H_uQ6v1B2y5kcsvtnzxF8TZM06M031zXD88jpdJIbXOFRaZo-2zAPCZdjIHTGgay3Au0TYXzOu4SY2FvHcaq9n8V44gUXner5OHvh2xjChK6WGf1EEmfBCDrik81-0HTIix8ybAytDtZpo_M5BI6HPfUPYgZUFFn1jBqmtdec3pSZOt-tKEIjCFGooxWYUCL1cjWkOmJCUkkR8qXwpeLfwgZCMZohLNGlMVrKXJeClEoNQ4JHytravTDb6XbzNFcwRSKFzbHZZP3estEb7282pGZGs4gqp-Jey_qJkvUTO3ijK--wnEQc1zNzjVAVaJPlwTyx5ehjo9TdCIj-X6toRLBD14pMbsMyXnRostq0IH-cxIxtuxNT11gzgK5yAi9dHU1KSJ6Ka_cf6xbjHK3Ai_76GvvxN4aTlmB)

---

<a name="class_mvconfig" />

### MVConfig

![MVConfig](http://www.plantuml.com/plantuml/png/bLH1JiCm4Bpd5IkGeAKKn1LLlVI41ASYhf5ZhuDLruxYJQ6K_Xt79b7Jf1LS8cTsPcUocuGKQGHkZLHvLJ9IrW3Np3bq8D2V8fOa1UChbXzJTma0onoLZ5FKmTCYC489OB9hodjb58t6noWJOkHxEW8FA9DVmGgtjz25DanNs9FcI4FIyo8tBFgBdq3Tb_POshBZ9v9AOremUk-dOHiyHzud_XBd-lBsEzZP39QUgP7y0kRpTj2E_4vuFPLK-ORCS1oDuR4L1jfbinv-W6MLb5YcfbfdM4QeA94hLsy-ChJbgzIfBupt6oNGfcYu5Lv8soBYayCTrq4wdGyBRVyEktKvHFjUJTMTSd133cxGmPrs2CDlvZNxdawRcwLQ5nfVyPCymLX2o2oHNOUEFGw4qneDEQ1tXC1IXh2KZFlFpChM9Di2unvpVh-Hnu3g5lLBqVtqxdmPZGZsft8-gsmXyzCPO_r_-JZJkat7RLcYAwmHDIGhm-jeGQ9LncNUIGcrg7sDRwR2VfWfN3nSDFsJVN9_FVYZkRx_0G00)

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

