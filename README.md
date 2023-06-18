<<<<<<< HEAD
## アーキテクチャー

```
├── assets　＃フロントはvueを使うため、未使用
│   ├── config
│   ├── images
│   └── stylesheets
├── channels　＃未使用
│   └── application_cable
├── controllers
│   ├── api
│   │   └── v1
│   └── concerns #コントーローラ共通処理
├── helpers　＃未使用
├── jobs　＃未使用
├── mailers　＃未使用
├── models #DB関連処理
│   └── concerns　#モデルの共通処理
└── views
    └── layouts


```
=======
# setup

```bash
# create image
docker-compose build
# fronted npm install
docker-compose run frontend npm install
# create container & start
docker-compose up
```

# 担当ダイアグラム
- https://app.diagrams.net/#HAppKim%2Fclon_ridibooks%2Fmain%2FUntitled%20Diagram.drawio
>>>>>>> origin/main
