class Category < ApplicationRecord
    has_many :article
    validates :name, presence:true, 
    length: { minimum:3, maximum: 25}

    validates_uniqueness_of :name
end
