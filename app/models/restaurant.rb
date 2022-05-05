class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :customers, through: :reviews

  def self.fanciest
    Restaurant.all.order("price DESC").take(1)
  end


  # Restaurant.first.reviews.first.full_review returns full review
  # need to iterate over ^

  def all_reviews
    reviewsArray =self.reviews.map do |t|
       t.full_review
    end

    puts reviewsArray
  end

  # Restaurant.first.all_reviews
  # Restaurant.second.all_reviews
  # Restaurant.third.all_reviews


end