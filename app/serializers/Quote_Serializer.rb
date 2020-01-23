class QuoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :genre, :artist
end
