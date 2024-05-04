class Receptionist < User
  has_many :appointments
  has_many :patients, through: :appointments

  def self.all_receptionist
    where(role: 'receptionist')
  end
end