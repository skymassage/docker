FROM python

WORKDIR /app

COPY . /app

CMD ["python", "rng.py"]

# Run:
#   docker build -t python_test
#   docker run --name test -it --rm python_test
# Here is not a network based application so we don't expose any port here and don't publish port, i.e.,
# we don't the -p flag in the docker command.
# But we need the "-it" flag to enter the interactive mode to test this app.