class HashtagsController < ApplicationController
  def show
    hashId = params[:id];
    @Hashtag = Hashtag.find(hashId);
    @clubIdsForEachHash = Hashtag.find(hashId).club_ids.uniq
    
    # <---------------- index start ---------------->
    @clubs = Club.all
    @users = User.all
    @categories = Category.all
    
    # 모집중 && 메인사진 존재하는 클럽의 url or club_id를 배열에 담아 반환
    @imageUrls = imageAdvertise('urls');
    @imageIds = imageAdvertise('ids');
    
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
   
   # <---------------- index end ---------------->
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
