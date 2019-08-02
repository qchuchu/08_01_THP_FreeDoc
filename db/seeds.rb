# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'time'

DatabaseCleaner.clean_with(:truncation)

# Doctor.destroy_all
# Patient.destroy_all
# Appointment.destroy_all

100.times do
  first_name, last_name = Faker::FunnyName.two_word_name.split(' ')
  city = Faker::Address
  Doctor.create(first_name: first_name, last_name: last_name, zip_code: city.zip_code, city: city.city)
end

100.times do
  first_name, last_name = Faker::FunnyName.two_word_name.split(' ')
  Patient.create(first_name: first_name, last_name: last_name)
end

100.times do
  date = Time.at((rand+1)*Time.now.to_i)
  doctor = Doctor.all.sample
  patient = Patient.all.sample
  Appointment.create(patient: patient, doctor: doctor, date: date)
end

specialties =  ['Allergy & Immunology','Anesthesiology', 'Dermatology', 'Diagnostic Radiology', 'Emergency Medicine', 'Family Medicine', 'Internal Medicine', 'Medical Genetics', 'Neurology', 'Nuclear Medicine', 'Obstetrics & Gynecology', 'Ophtalmology', 'Pathology', 'Pediatrics', 'Physical Medicine & Rehabilitation', 'Preventive Medicine', 'Psychiatry', 'Radiation Oncology', 'Surgery', 'Urology']

specialties.each do |spe|
  Specialty.create(name: spe)
end

100.times do
  doctor = Doctor.all.sample
  doctor.specialties << Specialty.all.sample
end
