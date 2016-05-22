class Profile < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :last_name, :birth_year, presence: false
  validate :first_or_last_not_nil
  validate :male_female
  validate :sue_male

  # validation helpers
  def first_or_last_not_nil
    if first_name.nil? && last_name.nil?
      errors.add(:first_name, 'You need at least one name')
    end
  end   

  def male_female
  	unless ["male", "female"].include?(gender)
  		errors.add(:gender, "unknown gender - must be 'male' or 'female'")
  	end
  end

  def sue_male
  	if gender === "male" && first_name === "Sue"
  		errors.add(:base, "man not allowed to have the name 'Sue'")
  	end
  end

  # class functions
  def self.get_all_profiles(min_yofb, max_yofb)
  	Profile.where(:birth_year => min_yofb .. max_yofb).order(:birth_year)
  end  
end
