class Haiku < ActiveRecord::Base
  attr_accessible :content
  validates :content, :length => {
    :minimum   => 50,
    :maximum   => 300,
  }

  belongs_to :user

  default_scope order: 'haikus.created_at DESC'
  has_reputation :votes, source: :user, aggregated_by: :sum
end
