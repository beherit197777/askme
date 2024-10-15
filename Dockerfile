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

# Устанавливаем Webpacker и компилируем ассеты
RUN bundle exec rake webpacker:install
RUN bundle exec rake assets:precompile

# Открываем порт 3000 для подключения
EXPOSE 3000

# Запуск сервера
CMD ["rails", "server", "-b", "0.0.0.0"]

