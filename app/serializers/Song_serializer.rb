class SongSerializer
  include FastJsonapi::ObjectSerializer
  attributes :author, :content
end
