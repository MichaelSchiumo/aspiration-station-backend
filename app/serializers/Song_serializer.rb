class SongSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :genre, :artist
end
