# This will be run during `rake db:seed` in the :development environment.

include Sprig::Helpers

sprig [Patient, Appointment, TimeSlot, Chair, Dentist, Hygienist, Office]