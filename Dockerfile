FROM ubuntu
USER root
RUN apt update
COPY . .
RUN apt install -y python3-pip
RUN pip3 install -r  requirements.txt
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate

EXPOSE 8000

CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]