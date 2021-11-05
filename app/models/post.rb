class Post < ApplicationRecord
    belongs_to :category #post has a category

    has_many  :taggings #has many taggings #join table
    has_many :tags, through: :taggings #tags through taggings

    def all_tags=(names)
        if names.blank?
            return
        end
        self.tags = names.split(",").map do |name|
            unless name.blank?
                Tag.where(name: name.strip).first_or_create! #to create if not presnt
            end
        end
    end

    def all_tags
        tags.map(&:name).join(', ')
    end
end