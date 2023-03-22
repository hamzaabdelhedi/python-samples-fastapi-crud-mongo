FROM habdelhedi/python-poetry:3.8.6-1.3.2
WORKDIR /code

COPY requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY . /code/app

ENV PYTHONPATH=/code


WORKDIR /code/app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--reload"]
