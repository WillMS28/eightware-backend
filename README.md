# Backend Rails 7.2 with Devise JWT

## Setup

1. Instale Ruby e Rails (versão 7.2)
2. Instale PostgreSQL e crie usuário e senha
3. Configure `config/database.yml` com seu usuário e senha do PostgreSQL
4. Rode:

```bash
bundle install
bundle exec rails db:create db:migrate
bundle exec rails s
