class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	validates :sid, uniqueness: true
	validates :first, :last, :email, :sid, presence: true
  validate :correct_access_code

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  def self.registration_code
    Code.regular_code
  end

  def self.admin_code
    Code.admin_code
  end

  def self.change_registration_code(newCode)
    old_code = User.registration_code

    if newCode == old_code
      return Code.changing_to_same_value("Regular", newCode)
    end

    @regular_users = User.where(code: User.registration_code)
    Code.set_regular_code(newCode)

    @regular_users.each do |user|
      user.code = newCode
      user.save!
    end

    return Code.changed_successful_message("Regular", old_code, newCode)
  end

  def self.change_admin_code(newCode)
    old_code = User.admin_code

    if newCode == old_code
      return Code.changing_to_same_value("Admin", newCode)
    end

    @admin_users = User.where(code: User.admin_code)
    Code.set_admin_code(newCode)

    @admin_users.each do |admin|
      admin.code = newCode
      admin.save!
    end

    return Code.changed_successful_message("Admin", old_code, newCode)
  end

  def correct_access_code
    if self.code != User.registration_code && self.code != User.admin_code
      errors.add(:code, "-- Wrong access code")
    end
  end

  def admin?
    self.code == User.admin_code
  end

  @member = ["first", "last", "team"]
  @admin_only = ["email", "sid"]

  def self.search(search, admin)
    if !search.blank?
      @results = []
      if !search.strip.include? " "
        @results = self.search_singular(search, admin)
      else
        @results = self.search_phrase(search, admin)
      end
    else
      all.order(:first)
    end
  end


  def self.search_singular(search, admin)
    @access, @results = [], []
    if admin
      for col in @admin_only
        @access = @access | User.where("#{col} = lower(?)", "#{search}").order(:first)
      end
    end

    for col in @member
      @results = @results | User.where("lower(#{col}) = lower(?)", "#{search}").order(:first)
    end

    @results = @results | @access
  end


  def self.search_phrase(search, admin)
    search = search.split(" ")

    for col in @member
      for term in search
        @results = @results | User.where("lower(#{col}) = lower(?)", "#{term}").order(:first)
      end
    end
    @results
  end
end
