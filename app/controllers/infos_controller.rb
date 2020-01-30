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
  end

  # 自分がアウトプットした情報もしくは保存した情報の詳細を見られるようにする
  def show
  end

  # 新着情報がある期間経つと削除できるようにする
  def destroy
  end



end
