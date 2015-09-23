class Emotion < ActiveRecord::Base
  belongs_to :artwork # foreign key is automatically guessed by rails.
end
