class RoomsController < ApplicationController
  def index
    @rooms = Room.all

    # エリアで絞り込み
    if params[:area].present? && ["東京", "京都", "大阪", "札幌"].include?(params[:area])
      @rooms = @rooms.where(area: params[:area])
    end

    # 郵便番号で曖昧検索
    if params[:postal_code].present?
      @rooms = @rooms.where("postal_code LIKE ?", "%#{params[:postal_code]}%")
    end

    # 住所で曖昧検索
    if params[:address].present?
      @rooms = @rooms.where("address LIKE ?", "%#{params[:address]}%")
    end

    # フリーワード検索
    if params[:keyword].present?
      keyword = "%#{params[:keyword]}%"
      @rooms = @rooms.where("name LIKE ? OR description LIKE ? OR address LIKE ? OR postal_code LIKE ?", keyword, keyword, keyword, keyword)
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
    @user = @room.user 
    unless user_signed_in?
      session[:return_to] = request.fullpath
    end
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to rooms_path, notice: '施設を登録しました'
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to @room, notice: "施設情報を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :description, :cash, :img)
  end
end