class Contact < ActiveRecord::Base

  def full_name
    "#{first_name} #{full_name}"
  end

end
