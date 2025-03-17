-- Project Name : noname
-- Date/Time    : 2025/03/17 13:37:56
-- Author       : sisnt
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

/*
  << 注意！！ >>
  BackupToTempTable, RestoreFromTempTable疑似命令が付加されています。
  これにより、drop table, create table 後もデータが残ります。
  この機能は一時的に $$TableName のような一時テーブルを作成します。
  この機能は A5:SQL Mk-2でのみ有効であることに注意してください。
*/

-- アクセス
-- * RestoreFromTempTable
create table access (
  id SERIAL not null
  , title NVARCHAR2(255) not null
  , subtitle NVARCHAR2(255)
  , latitude DECIMAL(9,6) not null
  , longitude DECIMAL(9,6) not null
  , pin VARCHAR(255) not null
  , del_flag SMALLINT default 0 not null
  , regist NVARCHAR2(50) not null
  , regist_date TIMESTAMP default CURRENT_TIMESTAMP not null
  , renew NVARCHAR2(50) not null
  , renew_date TIMESTAMP default CURRENT_TIMESTAMP not null
  , constraint access_PKC primary key (id)
) 
GO

-- 管理者
-- * RestoreFromTempTable
create table admin (
  no SERIAL not null
  , id VARCHAR2(255) not null
  , name VARCHAR2(100) not null
  , password VARCHAR2(255) not null
  , mail VARCHAR2(255) not null
  , role NVARCHAR2(100) not null
  , constraint admin_PKC primary key (no,id)
) 
GO

-- お問い合わせ
-- * RestoreFromTempTable
create table board (
  id SERIAL  not null
  , name NVARCHAR2(100) not null
  , mail NVARCHAR2(100) not null
  , title NVARCHAR2(255) not null
  , content TEXT not null
  , regist_date TIMESTAMP default CURRENT_TIMESTAMP not null
  , answer SMALLINT default ０ not null
  , constraint board_PKC primary key (id)
) 
GO

-- メニュー
-- * RestoreFromTempTable
create table menu (
  id SERIAL  not null
  , parent_id NUMBER(10) not null
  , name NVARCHAR2(100) not null
  , image NVARCHAR2(255)
  , link NVARCHAR2(255)
  , arrange NUMBER(5) default 0 not null
  , active SMALLINT default 1 not null
  , del_flag SMALLINT default 0 not null
  , regist NVARCHAR2(50) not null
  , regist_date TIMESTAMP default CURRENT_TIMESTAMP not null
  , renew NVARCHAR2(50) not null
  , renew_date TIMESTAMP default CURRENT_TIMESTAMP not null
  , constraint menu_PKC primary key (id)
) 
GO

-- ページ
-- * RestoreFromTempTable
create table page (
  id SERIAL not null
  , title NVARCHAR2(255) not null
  , subtitle NVARCHAR2(255)
  , file_path TEXT
  , file_name TEXT
  , content TEXT not null
  , image_name NVARCHAR2(100)
  , image_url NVARCHAR2(255)
  , del_flag SMALLINT default 0 not null
  , regist NVARCHAR2(50) not null
  , regist_date TIMESTAMP default CURRENT_TIMESTAMP not null
  , renew NVARCHAR2(50) not null
  , renew_date TIMESTAMP default CURRENT_TIMESTAMP not null
  , constraint page_PKC primary key (id)
) 
GO

-- パートナ
-- * RestoreFromTempTable
create table partner (
  id SERIAL  not null
  , title NVARCHAR2(255) not null
  , subtitle NVARCHAR2(255)
  , file_path TEXT
  , file_name TEXT
  , image_name NVARCHAR2(100) not null
  , image_url NVARCHAR2(255)
  , del_flag SMALLINT default 0 not null
  , regist NVARCHAR2(50) not null
  , regist_date TIMESTAMP default CURRENT_TIMESTAMP not null
  , renew NVARCHAR2(50) not null
  , renew_date TIMESTAMP default CURRENT_TIMESTAMP not null
  , constraint partner_PKC primary key (id)
) 
GO

comment on table access is 'アクセス'
GO
comment on column access.id is 'アクセスのid:アクセスのId'
GO
comment on column access.title is 'タイトル:アクセスのタイトル'
GO
comment on column access.subtitle is 'サブタイトル:アクセスのサブタイトル'
GO
comment on column access.latitude is '緯度:アクセスの緯度'
GO
comment on column access.longitude is '経度:アクセスの軽度'
GO
comment on column access.pin is 'pin:アクセスのpin'
GO
comment on column access.del_flag is '削除有無:削除有無を確認'
GO
comment on column access.regist is '登録者:登録者のId'
GO
comment on column access.regist_date is '登録日:登録した日'
GO
comment on column access.renew is '修正者:修正者のId'
GO
comment on column access.renew_date is '修正日:修正する日'
GO

comment on table admin is '管理者'
GO
comment on column admin.no is 'プライマリーキー:管理者のプライマリーキー'
GO
comment on column admin.id is 'アカウントID:管理者のアカウントID'
GO
comment on column admin.name is '名前:管理者の名前'
GO
comment on column admin.password is 'パスワード:管理者のパスワード'
GO
comment on column admin.mail is 'メール:管理者のメール'
GO
comment on column admin.role is '役割:内容追加、修正、削除ができる役割'
GO

comment on table board is 'お問い合わせ'
GO
comment on column board.id is 'お問い合わせのId:お問い合わせのId'
GO
comment on column board.name is '作成者の名前:作成者の名前'
GO
comment on column board.mail is '作成者のメール:作成者のメール'
GO
comment on column board.title is 'お問い合わせのタイトル:お問い合わせのタイトル'
GO
comment on column board.content is 'お問い合わせの内容:お問い合わせの内容'
GO
comment on column board.regist_date is 'お問い合わせの登録日:お問い合わせの登録日'
GO
comment on column board.answer is 'お問い合わせの返事有無:お問い合わせの返事有無確認'
GO

comment on table menu is 'メニュー'
GO
comment on column menu.id is 'メニューのid:メニューのId'
GO
comment on column menu.parent_id is '親id:親Idの有無を確認'
GO
comment on column menu.name is '名前:メニューの名前'
GO
comment on column menu.image is 'イメージ:メニューのイメージ'
GO
comment on column menu.link is 'リンク:メニューのリンクURL'
GO
comment on column menu.arrange is '順序:メニューの順序（整列）'
GO
comment on column menu.active is '活性化:メニューの活性化'
GO
comment on column menu.del_flag is '削除有無:削除有無を確認'
GO
comment on column menu.regist is '登録者:メニューを登録した登録者のId'
GO
comment on column menu.regist_date is '登録日:メニューを登録した日'
GO
comment on column menu.renew is '修正者:メニューを修正した修正者のId'
GO
comment on column menu.renew_date is '修正日:メニューを修正した日'
GO

comment on table page is 'ページ'
GO
comment on column page.id is 'ページid:ページのId'
GO
comment on column page.title is 'タイトル:タイトル'
GO
comment on column page.subtitle is 'サブタイトル:サブタイトル'
GO
comment on column page.file_path is 'イメージファイル:イメージファイル経路'
GO
comment on column page.file_name is 'イメージファイル名:イメージファイルの名前'
GO
comment on column page.content is '内容:内容'
GO
comment on column page.image_name is 'イメージ名:イメージの名前'
GO
comment on column page.image_url is 'イメージリンク:イメージをクリっクしたら遷移するURL'
GO
comment on column page.del_flag is '削除有無:削除有無確認'
GO
comment on column page.regist is '登録者:登録者のId'
GO
comment on column page.regist_date is '登録日:登録した日'
GO
comment on column page.renew is '修正者:修正者のId'
GO
comment on column page.renew_date is '修正日:修正した日'
GO

comment on table partner is 'パートナ'
GO
comment on column partner.id is 'パートナのId:パートナのId'
GO
comment on column partner.title is 'パートナページのタイトル:パートナページのタイトル'
GO
comment on column partner.subtitle is 'パートナページのサブタイトル:パートナページのサブタイトル'
GO
comment on column partner.file_path is 'パートナのイメージファイル:パスワードのイメージファイル経路'
GO
comment on column partner.file_name is 'パートナのイメージファイル名:パスワードのイメージファイルの名前'
GO
comment on column partner.image_name is 'パートナイメージの名前:パスワードのイメージ名前'
GO
comment on column partner.image_url is 'パートナのURL:パスワードのリンクURL'
GO
comment on column partner.del_flag is '削除有無:削除有無を確認'
GO
comment on column partner.regist is '登録者:パスワードを登録した登録者のId'
GO
comment on column partner.regist_date is '登録日:パスワードを登録した日'
GO
comment on column partner.renew is '修正者:パスワードを修正した修正者'
GO
comment on column partner.renew_date is '修正日:パスワードを修正した日'
GO

