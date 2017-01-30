class Asignatura < ActiveRecord::Base
    validates :asignaturaID, uniqueness: { case_sensitive: false, error_iguales: "No pueden haber materias repetidas" }
    validates :asignaturaID, :nombre, :presence => true
end
