# Используем официальный образ Ruby, версии 3.3.5
FROM ruby:3.3.5

# Устанавливаем необходимые зависимости
RUN apt-get update -qq && apt-get install -y build-essential nodejs npm yarn sqlite3

# Обновляем Yarn до последней версии
RUN npm install --global yarn

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем Gemfile и Gemfile.lock для установки зависимостей
COPY Gemfile Gemfile.lock ./

# Устанавливаем зависимости приложения
RUN bundle install

# Копируем все файлы приложения
COPY . .

# Устанавливаем JavaScript-зависимости и компилируем ассеты с помощью esbuild
RUN yarn install
RUN yarn build

# Предкомпиляция ассетов (CSS, JS и другие)
RUN bundle exec rake assets:precompile

# Открываем порт 3000 для подключения
EXPOSE 3000

# Запуск миграций и сервера
CMD ["bash", "-c", "bin/rails db:migrate && bin/rails server -b 0.0.0.0"]
