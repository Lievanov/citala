class Aula < ActiveRecord::Base
    GRADOS = ["7", "8", "9", "10", "11"]
    validates :aulaID, uniqueness: { case_sensitive: false, error_iguales: "No pueden haber aulas repetidas" }
end
