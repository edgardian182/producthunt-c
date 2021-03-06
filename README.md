DEVELOPED APP FEATURES

- Using SCSS and @import styles
- HELPERS
- NavBar with GRAVATAR and the gem 'gravatar-ultimate'
- SESSIONS
- helper_method :signed_in? in application_controller.rb to allow the method to be ejecuted in the views
- Apply different SCSS styles
- Show errors (_form.html.erb)
- VALIDACIONES

APP LANGUAGE
  * In config/application.rb
    config.i18n.default_locale = :es
    config.i18n.enforce_available_locales = true
  * Create es.yml in /locales   => Crea los mensajes respectivos en ESPAÑOL
   => Siempre traducir los nombres de los campos

ASSOCIATIONS
  $ rails g migration add_user_to_products user:references   => Adds foreing-key
  $ rake db:migrate
  $ annotate

  => Asociar al guardar un producto con el usuario en product_controller.rb

OPTIONS WITH GLYPHICONS
  - Revisar en show.html.erb de products
    => Se usa html_safe cuando queremos que se interprete como codigo HTML y no como String
    => SCSS styles
  - Restringir solo a productos propios

GEMS
- 'annotate' => Show the fields of a table in the Model (use annotate in console)
- 'gravatar-ultimate' => Use the gravatar service to show some user information
- 'rails-i18n' => Para la traducción de la APP
- 'paperclip'  => Subir archivos e imagenes
- 'figaro'  => Se usa por seguridad de datos de configuracion

GIT
- Crear rama para cada nueva caracteristica
- Enviar a GitHub y hacer pull request
- Cambiar a MASTER y hacer git pull
- El nombre de un commit se cambia con: git commit --amend


COMMENTS
- Generar Modelo y foreing-keys
- Muestra el Gravatar del usuario que hizo comment en show.html.erb de products y el FORMULARIO para crearle
- Crear controlador para comments
  * Se hace un MERGE para asociar un usuario al comentario
  * Se crean RUTAS_ANIDADAS con products y comments
- Muestra la cantidad de comentarios por producto y agrega estilos a products.scss

VOTES
- Se crea Model con product:references y user:references
- Se crea el Controller
- Se crean las RUTAS ANIDADAS
- Se crean los links en index.html.erb de products y su ESTILO en producs.scss
- Se crea metodo voted_by? en VOTE_MODEL
- En SHOW de products muestra el GRAVATAR de quienes votaron


IMAGES AND FILES
- Se usa gem 'paperclip'
- rails g paperclip product image   => Que Model guarda el archivo y nombre del campo
  => Crea la MIGRACION
  => rake db:migrate    => Crea 4 campos
  => En Model Product agragamos el Attachment
  => Se hace validacion al Attachment para que se suban solo imagenes
  => Modificamos FORMULARIO para agregar imagen (<%= f.file_field :image %>)
  => Permitir parametro en el controlador
  => Mostrar la imagen si existe en index.html.erb (<%= image_tag product.image.url(:thumb) %>)
  => Se agregan ESTILOS
  => Se crea HELPER_METHOD header_style que agrega codigo HTML para mostrar IMG
  => URL para imagenes   https://www.pexels.com
  => Se evita subir las imagenes a github usando gitignore /public/system

AWS PARA IMAGENES
- Se usa el servicio S3 de aws.amazon.com
- Se crea un BUCKET => Carpeta para almacenar los archivos
- Se conecta con nuestra APP para que suba los archivos automaticamente
  => https://devcenter.heroku.com/articles/paperclip-s3
    => Seguir la CONFIGURACION
    => No olvidar: heroku config:set AWS_REGION=us-east-1

EMAILS
- rails g mailer UserMailer   => Genera el mailer y la carpeta en las views
- En application_mailer.rb cambiar el from por correo personal u otro
- En user_mailer.rb agregar metodo para envio de email
- En las vistas user_mailer se debe crear un archivo con el mismo nombre del metodo creado
- Para enviar los correos se usa un servicio llamado: http://mandrill.com
- En config/initializers crear carpeta setup_mail.rb
  => Se define la configuracion de mandrill
- Agrega gem 'figaro'  => Agrega config/applcation.yml para agregar alli la info sensible (VER)
- Ahora se crea una tarea en lib/tasks email.rake
- Se envian las credenciales de MANDRILL a HEROKU
  => figaro heroku:set -e production
  => heroku config:set hostname=http://producthunt-c.herokuapp.com
  => En heroku.com seleccinar App y agregar un add-ons heroku scheduler y una nueva tarea rake email:daily_products



# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
