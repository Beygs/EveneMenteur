class Event < ApplicationRecord
  validates :start_date, presence: true
  validates :duration, presence: true
  validates :title, 
    presence: true, 
    length: { in: 5..140 }
  validates :description, 
    presence: true,
    length: { in: 20..1000 }
  validates :price, presence: true
  validates :location, presence: true

  validate :start_date_cannot_be_in_the_past,
    :duration_must_be_a_positive_multiple_of_5,
    :price_must_be_between_1_and_1000

  belongs_to :admin, foreign_key: 'admin_id', class_name: 'User'
  
  has_many :attendances
  has_many :users, through: :attendances
  
  def end_date
    start_date + duration.minutes
  end

  private

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "Il n'est pas possible de créer ou modifier un événement dans le passé !") if
      start_date < DateTime.now
  end

  def duration_must_be_a_positive_multiple_of_5
    errors.add(:duration, "La durée doit être un nombre positif multiple de 5 !") if 
      duration.negative? || !(duration % 5).zero? || duration.zero?
  end

  def price_must_be_between_1_and_1000
    errors.add(:price, 'Le prix doit être compris entre 1 et 1000 !') if
      price < 1 || price > 1000
  end
end
