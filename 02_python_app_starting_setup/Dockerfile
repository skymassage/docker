FROM python

WORKDIR /app

COPY . /app

CMD ["python", "rng.py"]

# Here is not a network based application so we don't expose any port here and don't publish por, i.e.,
# we don't the -p flag in the docker command.