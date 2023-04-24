FROM habdelhedi/python-poetry:3.8.6-1.3.2
WORKDIR /code

COPY requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY . /code/app

ENV PYTHONPATH=/code

RUN opentelemetry-bootstrap --action=install

ENV OTEL_RESOURCE_ATTRIBUTES="service.name=My Python APP"
ENV OTEL_EXPORTER_OTLP_ENDPOINT="http://192.168.56.19:4318"  


WORKDIR /code/app
CMD ["opentelemetry-instrument", "--traces",_"exporter otlp_proto_http", "--metrics_exporter", "otlp_proto_http", "uvicorn", "main:app", "--host", "0.0.0.0", "--reload"]
