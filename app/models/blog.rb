class Blog < ActiveRecord::Base
  acts_as_taggable # Alias for acts_as_taggable_on :tags
end
