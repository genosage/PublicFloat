class Artwork < ActiveRecord::Base
    validates :title, presence: true
    validates :artwork_longtitude, presence: true, uniqueness: true
    validates :artwork_latitude, presence: true, uniqueness: true
    validates :description, presence: true, uniqueness: true
    # validates :image_url, allow_blank: true
    # , format: { with: %r{\.(gif|jpg|png)\A}i, message: 'must be a URL for GIF, JPG or PNG image.'}
    validates :image_url, uniqueness: true
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :ibeaconuuid, uniqueness: true, presence: true, allow_blank: false, allow_nil: false

    has_many :emotions
    has_many :comments
end
