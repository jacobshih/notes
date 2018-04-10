
# line bot

1. [references](#references)

---

<a name="references" />

## references
* [create-your-line-bot-golang](http://www.evanlin.com/create-your-line-bot-golang/)

---

## build a line bot from LineBotTemplate

1. clone from https://github.com/kkdai/LineBotTemplate.git

```
git clone https://github.com/kkdai/LineBotTemplate.git
```

1. customizations

```
mv LineBotTemplate jxlbot
cd jxlbot
rm -rf .git
git init
git config user.email "jacob_shih@hotmail.com"
git config user.name "jacob_shih"
heroku git:remote -a jxlbot
git add .

```

---
