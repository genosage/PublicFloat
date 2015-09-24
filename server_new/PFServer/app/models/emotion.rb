class Emotion < ActiveRecord::Base
  belongs_to :artwork # foreign key is automatically guessed by rails.
  def self.emotionsBelongsToArtWork(artwork_id)
     Emotion.find_by_artwork_id(artwork_id)
  end
end
