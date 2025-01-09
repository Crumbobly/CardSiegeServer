############### Образ для сборки виртуального окружения ################
# Основа — «тяжелый» (~1 ГБ, в сжатом виде ~500 ГБ) образ со всеми необходимыми
# библиотеками для сборки модулей
FROM snakepacker/python:3.10 as builder

# Создаем виртуальное окружение и обновляем pip
RUN apt-get update && apt install -y python3.10-venv
RUN python3.10 -m venv /app

RUN /app/bin/pip install -U pip

# Устанавливаем зависимости отдельно, чтобы закешировать. При последующей сборке
# Docker пропустит этот шаг, если requirements.txt не изменится
COPY requirements.txt /mnt/
RUN /app/bin/pip install -Ur /mnt/requirements.txt

# Копируем source distribution в контейнер и устанавливаем его
COPY / /mnt/dist/
RUN /app/bin/pip install /mnt/dist/ && /app/bin/pip check
# Копируем скрипт запуска сервиса
COPY /run_application.sh /app
########################### Финальный образ ############################
# За основу берем «легкий» (~100 МБ, в сжатом виде ~50 МБ) образ с Python
FROM snakepacker/python:3.10 as api

# Копируем в него готовое виртуальное окружение из контейнера builder
COPY --from=builder /app /app

# Устанавливаем ссылки, чтобы можно было воспользоваться командами приложения
RUN ln -snf /app/bin/server-* /usr/local/bin/

# Устанавливаем права для скрипта запуска сервиса
RUN chmod +x /app/run_application.sh
# Устанавливаем выполняемую при запуске контейнера команду по умолчанию
CMD ["/app/run_application.sh"]