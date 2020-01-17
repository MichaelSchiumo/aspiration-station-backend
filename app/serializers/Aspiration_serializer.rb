class AspirationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :category, :timeframe, :status
end
