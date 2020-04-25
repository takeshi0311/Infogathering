class InfosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :see]

  # スクレイピングによって得られた新着情報を一覧表示させる
  def index
    # @infos = Info.order('id DESC').page(params[:page]).per(30)
    @infos = Info.order('id DESC')
    @info_rank = Info.all.order(see: "DESC").limit(30)

    @infoid =[]
    info_stock = InfoUser.where(user_id: current_user)
    info_stock.each do |info|
      @infoid << info.info_id
    end
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

  def destroy
  
  end

  #閲覧数のカウント：記事のURLがクリックされたら閲覧数が一つ増える
  def see
    @info = Info.find(params[:id])
    see_number = @info.see
    see_number += 1
    @info.update(see: see_number)
  end

end
