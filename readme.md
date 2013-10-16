# HiSYS v1.0

Sistema de gerencimaneto online da [High Effects](http://www.higheffects.com.br), criado por James Peret, usando Ruby on Rails.

### Instalção

*Pré-requisito: Instalar banco de dados Postgres*

1. `$ git clone "https://github.com/HighEffects/HiSYS.git"`
2. `$ cd hisys`
3. `$ bundle install`
4. Criar os bancos de dados `hisys_development` e `hisys_test`
5. `$ rake db:migrate`
6. `$ rails server`

Para ver o sistema funcionando acesse a página `http://localhost:3000`