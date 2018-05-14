class ClubsController < ApplicationController
 #권한부여를 위해 코드 추가
  load_and_authorize_resource
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.all
    @users = User.all
    
    # 모집중이면서 메인 사진이 등록된 동아리의 메인 사진을 디비로부터 배열에 담아 반환해주는 메소드
    @imageUrls = imageAdvertise;
  end
# search method
  def search
   @clubs = Club.search do
    keywords params[:query]
  end.results
  
    respond_to do |format|
     format.html { render :action => "index" }
     format.xml  { render :xml => @clubs }
    end
  end
  # GET /clubs/1
  # GET /clubs/1.json
  def show
  end

  # GET /clubs/new
  def new
    @club = Club.new
    3.times { @club.hashtags.new }
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(club_params)

    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
   
  #  params[:hashtags_attributes][]["title"] #hash1
  #  "hashtags_attributes" =>
  #  {"0"=>{"title"=>"hash1"},
  #   "1"=>{"title"=>"hash2"},
  #   "2"=>{"title"=>"hash3"}}
  #   }
    
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def hashtag_params
    params.require(:club).permit(hashtags_attributes: [:title])
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:name, :short_desc, :detail_desc, :meeting_date, :contact, :room_location, :detail_desc, :isApply, :category_id, :applyMethod)
    end
    
    # 모집중이면서 메인 사진이 등록된 동아리의 메인 사진을 디비로부터 배열에 담아 반환해주는 메소드

  def imageAdvertise
    ids = Array.new();
    urls = Array.new();
    
    sqlQuery = 'SELECT id FROM Clubs WHERE isApply = 1 OR isApply = 2';
    db = Club.connection;
    tuples = db.exec_query(sqlQuery);
    tuples.each do |tuple|
      ids << tuple['id'];
    end
    
    ids.each do |applying_id|
      sqlQuery = "SELECT url FROM Photos WHERE club_id = #{applying_id} AND isMain = 0";
      db = Photo.connection;
      tuples = db.exec_query(sqlQuery);
      tuples.each do |tuple|
        urls << tuple['url'];
      end
    end
    return urls;
  end
end