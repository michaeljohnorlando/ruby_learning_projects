class Article < ActiveRecord::Base
    has_many :comments
    has_many :tagging
    has_many :tags, through: :tagging
    
    has_attached_file :image
    validates_attachment_content_type :image, :content_type => [ "image/jpg","image/jpeg","image/png"]
    
    def tag_list
            tags.join(", ")
    end
    def tag_list=(tags_string)
  # first split the tags based on "," which is coming from the form
  tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
  # search if any particular tag is present or not, based on that assign them
  new_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  self.tags = new_tags
    end
end
