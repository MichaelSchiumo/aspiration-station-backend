class SongsController < ApplicationController
  before_action :set_song, only: [:update, :destroy]

    def index
      @songs = Song.all
      render json: SongSerializer.new(@songs), include: [:dreamer]
    end

    def create
      byebug
      @dreamer = Dreamer.create(name: song_params[:name], age: song_params[:age], sex: song_params[:sex])

      @song = @dreamer.songs.build(title: song_params[:title], genre: song_params[:genre], artist: song_params[:artist])

      if @song.save
        render json: {song: @song}
        # json_response(@song, :created)
      else
        render json: { message: 'Song was not created.'}
      end
    end

    def show
      @song = Song.find_by(id: params[:id])
      render json: SongSerializer.new(@song), include: [:dreamer]
    end

    def update
      @song.update(song_params)
    end

    def destroy

      @song.destroy
      render json: { message: 'Song was deleted.' }
    end

    private

    def song_params
      params.require(:song).permit(:title, :genre, :artist, :dreamer_id, :age, :sex, :name)
    end

    def set_song
      @song = Song.find_by(id: params[:id])
    end
  end
