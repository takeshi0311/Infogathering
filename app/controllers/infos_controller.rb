class InfosController < ApplicationController
  before_action :authenticate_user!, except: :index

  # スクレイピングによって得られた新着情報を一覧表示させる
  def index
    @infos = Info.order('id DESC').limit(50)
  end

  # アウトプットを各画面を表示させるアクション
  def new

  end

  # アウトプットを保存する
  def create
    # ①current_userを取得
    id = current_user.id

    # ②情報のデータを取得
    infodata = params[:id].to_i

    # ③中間テーブルの各外部キーにデータを保存
    InfoUser.create(user_id: id, info_id: infodata)
    redirect_to root_path, notice: '保存しました'
  end

  # 自分がアウトプットした情報もしくは保存した情報の詳細を見られるようにする
  def show
    # 中間テーブルより、データを取得し、表示
    @all_infos = []

    id = current_user.id
    @infos = InfoUser.where(user_id: id)

    @infos.each do |i|
      @all_infos << i.info_id
    end

    @info = []
    @all_infos.each do |t|
    @info << Info.find(t)
    end
  end

  # 新着情報がある期間経つと削除できるようにする
  def destroy
  end

end
