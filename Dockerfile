FROM python:3.10.2-alpine3.15
COPY . .
# Install Postgres

RUN mkdir -p /root/unicourt/test

RUN apk update
RUN apk add postgresql
RUN chown postgres:postgres /run/postgresql/
# Install requirements
COPY ./requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt
# For psycopg2
RUN apk add --virtual postgresql-deps libpq-dev
# Create directories
RUN mkdir -p /root/workspace/src
# Mount your local file
COPY ./web_scraping_sample.py /root/workspace/src
# Switch to project directory
WORKDIR /root/workspace/src
     RUN apk add postgresql
     RUN apk add postgresql-dev gcc python3-dev musl-dev

RUN pip install --upgrade pip
RUN pip install requests 
RUN pip install bs4 
RUN pip install html5lib 
RUN pip install psycopg2



COPY ./hi.py /root/unicourt/test
WORKDIR /root/unicourt/test

CMD ["hi.py"]
ENTRYPOINT ["python"]
