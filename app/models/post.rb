class Post < ActiveRecord::Base
    mount_uploader :foto, FotoUploader # Tells rails to use this uploader for this model.
    validates :titulo, presence: true # Make sure the owner's name is present.
end
