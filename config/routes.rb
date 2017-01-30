Rails.application.routes.draw do
  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  root to: "home#show"
  get 'noticias' => 'home#new', as: :new_post
  post 'noticias' => 'home#create'
  get 'noticias/:id' => 'home#edit', as: :edit_post
  post 'noticias/:id' => 'home#update'
  delete 'noticias/:id' => 'home#destroy', as: :destroy_post
  get 'horarios' => 'home#horarios', as: :horarios
  get 'horarios/:id' => 'home#edit_hora', as: :edit_hora
  post 'horarios/:id' => 'home#update_hora'
  
  #rutas de asignaturas
  get 'asignaturas' => 'asignaturas#new', as: :asignatura
  post 'asignaturas' => 'asignaturas#create'
  get 'asignaturas/:id' => 'asignaturas#edit', as: :edit_asignatura
  post 'asignaturas/:id' => 'asignaturas#update'
  delete 'asignaturas/:id' => 'asignaturas#destroy', as: :destroy_asignatura
  
  #rutas usuario
  get 'AceptarUsuarios' => 'users#show', as: :aceptar_usuarios
  delete 'user/:id' => 'users#destroy', as: :destroy_user
  get 'ModificarUsuarios' => 'users#edit', as: :edit_multiple_users
  put 'ModificarUsuarios' => 'users#update', as: :update_multiple_users
  
  #rutas alumno
  get 'alumnos' => 'alumnos#show', as: :alumno
  get 'alumnos/:id' => 'alumnos#edit', as: :edit_alumno
  get 'mi_info' => 'alumnos#show_grades', as: :show_grades_alumnos
  post 'alumnos/:id' => 'alumnos#update'
  get 'alumnos/editar' => 'alumnos#edit', as: :edit_multiple_alumnos
  put 'alumnos/editar' => 'alumnos#update', as: :update_multiple_alumnos
  
  #rutas profesor
  get 'profesores' => 'profesores#show', as: :profesor
  get 'profesores/:id' => 'profesores#edit', as: :edit_profesor
  post 'profesores/:id' => 'profesores#update'
  get 'subir_notas' => 'profesores#update_grades', as: :update_grades
  get 'subir_notas/:id/:periodo' => 'profesores#update_selected_grade', as: :update_selected_grade
  get 'mostrar_notas/:id' => 'profesores#update_selected_grade_notas', as: :update_selected_grade_notas
  put 'subir_notas/:id/:periodo' => 'profesores#update', as: :update_selected_grade_method
  get 'mis_alumnos' => 'profesores#alumnos', as: :mis_alumnos
  get 'mis_alumnos/:id' => 'profesores#info_alumno', as: :info_alumno
  
  #rutas administrador
  get 'configuracion' => 'users#configuracion', as: :configuracion
  post 'inscripcion/periodo_recuperacion'
  post 'inscripcion/cerrar_anio'
  post 'inscripcion/promover_alumnos'
  #rutas aula
  get 'aulas/crear' => 'aulas#new', as: :create_aula
  post 'aulas/crear' => 'aulas#create'
  get 'aulas' => 'aulas#show', as: :aulas
  delete 'aulas/:id' => 'aulas#destroy', as: :destroy_aula
  get 'aulas/:id' => 'aulas#edit', as: :edit_aula
  post 'aulas/:id' => 'aulas#update'
  
  #rutas curso
  get 'cursos' => 'cursos#show', as: :cursos
  get 'cursos/crear' => 'cursos#new', as: :create_curso
  post 'cursos/crear' => 'cursos#create'
  get 'cursos/:id' => 'cursos#edit', as: :edit_curso
  post 'cursos/:id' => 'cursos#update'
  get 'inscripcion/:id' => 'cursos#new_inscripcion', as: :inscripcion_new
  get 'inscripcion/:id/crear' => 'cursos#crear_inscripcion', as: :new_multiple_inscripcion
  get 'cursos/notas/:id' => 'cursos#update_curso_notas', as: :update_curso_notas
  
  #rutas inscripcion
  get 'inscripciones' => 'inscripcion#show', as: :inscripcion
  put 'subir_notas' => 'inscripcion#update', as: :update_multiple_notas
  
  
end
