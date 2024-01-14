FROM python:3.11.4

# Встановлюємо Xvfb
RUN apt-get update && apt-get install -y xvfb

RUN apt-get update && apt-get install -y python3-tk

# Робочий каталог в контейнері
WORKDIR /app

# Копіюємо файли з поточного каталогу в робочий каталог контейнера
COPY . .


RUN pip install -r requirements.txt

# Запускаємо програму у середовищі Xvfb
CMD ["xvfb-run", "python", "main.py"]

# RUN apt-get update && apt-get install -y xvfb libtiff5 libjpeg62-turbo zlib1g libfreetype6 liblcms2-2 libwebp6 libharfbuzz0b libfribidi0 libxcb1 libimagequant0
#
# WORKDIR /app
#
# COPY . .
#
# RUN pip install -r requirements.txt
#
# EXPOSE 5000
#
# CMD ["xvfb-run", "-a", "python", "main.py"]