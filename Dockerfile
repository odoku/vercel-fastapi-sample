FROM python:3.9.12-buster

RUN apt-get update \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29 \
    && apt-get -y install lsb-release \
    && apt-get clean

COPY . /app
WORKDIR /app

RUN pip install pipenv && pipenv install --dev --system

EXPOSE 8000

CMD ["./main.py"]
