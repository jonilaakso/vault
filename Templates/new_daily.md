---
title: {{DATE:DD-MM-YYYY}}
description: <description here>
draft: true
tags: daily
---

# otsikko



## TODO


## Tänään luomani artikkelit

```dataviewjs
const today = new Date();
const isoToday = today.toISOString().slice(0, 10);

dv.list(
  dv.pages('"content/"')
    .filter(p => p.file.cday && p.file.cday.toISOString().slice(0, 10) === isoToday)
    .map(p => p.file.name)
);


```
---
**References:**