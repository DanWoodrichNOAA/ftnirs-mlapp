FROM python:3.11.0

RUN pip install --upgrade pip

WORKDIR /tmp

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY . . 

WORKDIR /tmp/app

RUN mkdir -p ./tmp

RUN WEBAPP_RELEASE=$(git describe --tags $(git rev-list --tags --max-count=1)) && echo "WEBAPP_RELEASE=${WEBAPP_RELEASE}" > ./tmp/.dynenv

CMD ["python","app.py"]
