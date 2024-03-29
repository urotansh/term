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
  User ||--o{ Relationship: "followed"
  User ||--o{ Relationship: "follower"
  Note ||--o{ NoteComment: ""
  Note ||--o{ Favorite: ""
  Note ||--o{ NoteTag: ""
  Tag  ||--o{ NoteTag: ""

  User {
    integer   id                      PK
    string    name                      
    string    email                     
    boolean   is_deleted                
    string    encrypted_password        
    string    reset_password_token      
    datetime  reset_password_sent_at    
    datetime  remember_created_at       
    datetime  created_at                
    datetime  updated_at                
  }

  Admin {
    integer   id                      PK
    string    name                      
    string    email                     
    string    encrypted_password        
    string    reset_password_token      
    datetime  reset_password_sent_at    
    datetime  remember_created_at       
    datetime  created_at                
    datetime  updated_at                
  }

  Note {
    integer   id                      PK
    integer   user_id                 FK
    string    title                     
    text      content                   
    datetime  created_at                
    datetime  updated_at                
  }

  NoteComment {
    integer   id                      PK
    integer   user_id                 FK
    integer   note_id                 FK
    text      comment                   
    datetime  created_at                
    datetime  updated_at                
  }

  Favorite {
    integer   id                      PK
    integer   user_id                 FK
    integer   note_id                 FK
    datetime  created_at                
    datetime  updated_at                
  }

  Tag {
    integer   id                      PK
    string    name                      
    datetime  created_at                
    datetime  updated_at                
  }

  NoteTag {
    integer   id                      PK
    integer   note_id                 FK
    integer   tag_id                  FK
    datetime  created_at                
    datetime  updated_at                
  }

  Relationship {
    integer   id                      PK
    integer   followed_id             FK
    integer   follower_id             FK
    datetime  created_at                
    datetime  updated_at                
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
