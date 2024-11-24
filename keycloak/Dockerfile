FROM python:latest

WORKDIR /usr/app/src

COPY import-user.py ./
COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "./import-user.py" ]