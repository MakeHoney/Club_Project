class ClubsController < ApplicationController
 #권한부여를 위해 코드 추가
  # load_and_authorize_resource
  before_action :authenticate_user!, except: [:index, :show, :about]
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.all
    @users = User.all
    @categories = Category.all
    
    # 모집중 && 메인사진 존재하는 클럽의 url or club_id를 배열에 담아 반환
    @imageUrls = imageAdvertise('urls');
    @imageIds = imageAdvertise('ids');
    
    #검색창에 모집중인 동아리 전달
    @applying = Club.where(:isApply => [1,2])
    
    @q = Club.ransack(params[:q])
    @clubs = @q.result(distinct: true)
    
   # < ----------------- hash tag start ----------------- >
    hashtags = Hashtag.all
    @hashIds = hashtags.ids;
    @hashIds.shuffle!;
    @hashIds = @hashIds.slice(0..4)

    @randHashtags = Array.new();
    @hashIds.length.times do |i|
      @randHashtags << hashtags.where(id: @hashIds[i])[0]['hashtag'];
    end
    
   # < ----------------- hash tag end ----------------- >
    
  end
# search method
 
  # GET /clubs/1
  # GET /clubs/1.json
  def show
    @category = Category.find(@club.category_id)
    photos = Photo.where(club_id: @club.id)
    @photo = photos.where(isMain: 0)
  end
  


  # GET /clubs/new
  def new
    @club = Club.new
    # 3.times { @club.hashtags.new }
  end

  # GET /clubs/1/edit
  def edit
   # < ----------------- hash tag start ----------------- >
    @existHashtags = Array.new()
    @hashtagString = '';
    Club.find(@club['id']).hashtags.each_with_index do |tuple, i|
      @existHashtags << tuple['hashtag'];
      if(i == 0)
        @hashtagString += tuple['hashtag'];
      else
        @hashtagString += "," + tuple['hashtag'];
      end
    end
    @numOfHashTag = @existHashtags.length;
   # < ----------------- hash tag end ----------------- >
  end
  
  # POST /clubs
  # POST /clubs.json
  def showlist
   @clubs = Club.all
  end
  
  def create
    @club = Club.new(club_params)

    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @club }
      else
        p @club.errors.full_messages
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
   # < ----------------- hash tag start ----------------- >

    # new.html.erb로부터 전달받은 해시태그 스트링을 파싱하여 해시태그 테이블에 넣는다.
    # Hashtag = ApplicationRecord::Hashtag
    # 파싱
    hashtags = params[:hashTags].split(",");
    hashtags.each do |hashtag|
      # 해시태그가 테이블에 이미 존재하면 해시태그를 추가하지 않고 존재하는 해시태그의
      # id를 전달받아 join table에 두 foreign key 저장
      if(Hashtag.exists?(hashtag: hashtag))
        tmpHashtagId = Hashtag.where(hashtag: hashtag)[0]['id'];
        Club.find(@club['id']).hashtags << Hashtag.find(tmpHashtagId);
      # 해시태그가 테이블에 존재하지 않으면 해시태그를 테이블에 추가한 뒤
      # 추가한 해시태그의 id를 전달받아 join table에 두 foreign key 저장
      else
        hashNew = Hashtag.new();
        hashNew['hashtag'] = hashtag;
        hashNew.save;

        Club.find(@club['id']).hashtags << Hashtag.find(hashNew['id']);
      end
    end

    # < ----------------- hash tag end ----------------- >
    
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
    
    # < ----------------- hash tag start ----------------- >

    # delete all past hashtag
    @club.hashtag_ids.each do |hashtag_id|
      @club.hashtag_ids -= [hashtag_id];
    end

    # delete hashtag no clubs have --> but i think this function has high overheads
    # because of traverse over other databases each
    clubIds = Club.ids;
    joinTableHashIdx = Array.new();
    clubIds.each do |clubId|
      ######## get HashIds from ClubId
      ######## use this logic samely when club lists from a hash link!
      joinTableHashIdx += Club.find(clubId).hashtag_ids
    end
    joinTableHashIdx.uniq!
    Hashtag.where.not(id: joinTableHashIdx).destroy_all;



    hashtags = params[:hashTags].split(",");
    hashtags.each do |hashtag|

      if(Hashtag.exists?(hashtag: hashtag))
        tmpHashtagId = Hashtag.where(hashtag: hashtag)[0]['id'];
        Club.find(@club['id']).hashtags << Hashtag.find(tmpHashtagId);
      else
        hashNew = Hashtag.new();
        hashNew['hashtag'] = hashtag;
        hashNew.save;

        Club.find(@club['id']).hashtags << Hashtag.find(hashNew['id']);
      end
    end
    # < ----------------- hash tag end ----------------- >
    
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    
    # < ----------------- hash tag start ----------------- >

    # destroy hashtags that the club has before the club removed from db
    @club.hashtag_ids.each do |hashtag_id|
      @club.hashtag_ids -= [hashtag_id];
    end

    clubIds = Club.ids;
    joinTableHashIdx = Array.new();
    clubIds.each do |clubId|
      joinTableHashIdx += Club.find(clubId).hashtag_ids
    end
    joinTableHashIdx.uniq!
    Hashtag.where.not(id: joinTableHashIdx).destroy_all;
    # < ----------------- hash tag end ----------------- >
    
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:name, :short_desc, :detail_desc, :meeting_date, :contact, :room_location, :detail_desc, :isApply, :category_id, :applyMethod, :image_url)
    end
    
    # 모집중 && 메인사진 존재하는　url or club_id를 배열에 담아 반환
    
  def imageAdvertise(retForm)
    ids = Array.new();
    retVal = Array.new();

    sqlQuery = 'SELECT id FROM Clubs WHERE isApply = 1 OR isApply = 2';
    db = Club.connection;
    tuples = db.exec_query(sqlQuery);
    tuples.each do |tuple|
      ids << tuple['id'];
    end

    ids.each do |applying_id|
      sqlQuery = "SELECT url, club_id FROM Photos WHERE club_id = #{applying_id} AND isMain = 0";
      db = Photo.connection;
      tuples = db.exec_query(sqlQuery);

      tuples.each do |tuple|
        if(retForm.eql?('ids'))
          retVal << tuple['club_id'];
        elsif(retForm.eql?('urls'))
          retVal << tuple['url'];
        end
      end
    end

    return retVal;
  end
  

end