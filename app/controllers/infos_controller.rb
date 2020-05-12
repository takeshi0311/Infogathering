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
    #ログイン中のユーザーがストックした情報idを取得し、配列として格納
    @all_infos = InfoUser.where(user: current_user).pluck(:info_id)

    #取得した情報idを元に、情報テーブルにて情報を取得し、配列として格納
    @info = @all_infos.map{|t| Info.find(t)} 
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
