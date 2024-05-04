class Doctor < User
  include Groupdate
  has_many :appointments
  has_many :patients, through: :appointments

  def self.all_doc
    where(role: 'doctor')
  end
end