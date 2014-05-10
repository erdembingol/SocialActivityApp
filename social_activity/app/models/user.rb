class User < ActiveRecord::Base
  
  #attr_accessor :password

  #before_save :encrypt_password
  #after_save :clear_password

  validates :name, :presence => true, :length => { :in => 3..20 }
  validates :lastname, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  #validates :password, :confirmation => true
  #Only on Create so other actions like update password attribute can be nil
  validates_length_of :password, :in => 6..20, :on => :create


	attr_accessible :name, :lastname, :birth_date, :gender, :adress, :profil_image, :password

	def self.authenticate(username="", userlastname="", login_password="")
		user = User.find_by_name(username)	

	    if user && (user.lastname == userlastname) && (user.password == login_password)
	      return user
	    else
	      return false
	    end
	end   

	def match_password(login_password="")
	    password == login_password
	  end



	  def encrypt_password
	    unless password.blank?
	      self.password = password
	    end
	  end

	  def clear_password
	    self.password = nil
	  end
			
end
