class QuoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :author, :content
end
