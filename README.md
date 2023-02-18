# Term

## サイト概要
### サイトテーマ
プログラミング関連の用語を記録・検索できるメモ帳アプリ  
他人のメモ帳を参考にしたりコメントやいいねができるコミュニティサイトとして利用することもできます。  

### テーマを選んだ理由
プログラミング関連の用語であったりコマンドやメソッドの使い方がわからない時に  
インターネットを検索して問題を解決すると思いますが、  
何度も調べたことがある用語・コマンド・メソッドであるにも関わらず、  
インターネット検索と複数サイトの探索を繰り返してしまうということがよくありました。  
そこで、問題解決の時間を少しでも短縮したり、記憶定着の助けになるようなメモ帳アプリがあると便利だと思いこのテーマにしました。  

### ターゲットユーザ
- プログラミング関連の用語をインプット＆アウトプットすることで記憶に定着させたい人
- メモ帳から用語の意味やコマンドの使い方を検索したい人
- 自分専用のメモ帳を育てたい人
- 他人のメモ帳を参考にしたい人

### 主な利用シーン
- インターネットなどで調べた内容を記録したい時
- 記録した内容を検索したい時
- 記録した内容を復習したい時
- 他人の記録内容を参考にしたい時

## 設計書
- ER図
```mermaid
erDiagram
  User ||--o{ Note: ""
  User ||--o{ Favorite: ""
  User ||--o{ NoteComment: ""
  Note ||--o{ NoteComment: ""
  Note ||--o{ Favorite: ""
  Note ||--o{ NoteTag: ""
  Tag ||--o{ NoteTag: ""

  User {
    id                      integer
    name                    string
    email                   string
    is_deleted              boolean
    encrypted_password      string
    reset_password_token    string
    reset_password_sent_at  datetime
    remember_created_at     datetime
    created_at              datetime
    updated_at              datetime
  }

  Admin {
    id                      integer
    name                    string
    email                   string
    encrypted_password      string
    reset_password_token    string
    reset_password_sent_at  datetime
    remember_created_at     datetime
    created_at              datetime
    updated_at              datetime
  }

  Note {
    id                      integer
    user_id                 integer
    title                   string
    content                 text
    created_at              datetime
    updated_at              datetime
  }

  NoteComment {
    id                      integer
    user_id                 integer
    note_id                 integer
    comment                 text
    created_at              datetime
    updated_at              datetime
  }

  Favorite {
    id                      integer
    user_id                 integer
    note_id                 integer
    created_at              datetime
    updated_at              datetime
  }

  Tag {
    id                      integer
    name                    string
    created_at              datetime
    updated_at              datetime
  }

  NoteTag {
    id                      integer
    note_id                 integer
    tag_id                  integer
    created_at              datetime
    updated_at              datetime
  }
```

## 開発環境
- OS：Amazon Linux 2
- 言語：HTML, CSS, JavaScript, Ruby, SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
使用検討中です
