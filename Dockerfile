# Build on Docker's official Python 3(.6) image.
FROM python:3

# Expose the port that `manage.py runserver` uses by default.
EXPOSE 8000

# Put the Python source code here.
WORKDIR /usr/src/app

# Copy in the Python module requirements and install them.
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy in the vendor resources and fetch them.
RUN apt-get update && apt-get install unzip && apt-get clean
COPY fetch-vendor-resources.sh ./
RUN ./fetch-vendor-resources.sh

# Copy in remaining source code. (We put this last because these
# change most frequently, so there is less to rebuild if we put
# infrequently changed steps above.)
#
# NOTE: Do *not* include the "local" directory in this step, since
# that often has local development files.
COPY discussion ./discussion
COPY guidedmodules ./guidedmodules
COPY modules ./modules
COPY siteapp ./siteapp
COPY templates ./templates
COPY manage.py .
COPY deployment/docker/first_run.sh .

# Prepare the local environment.
COPY deployment/docker/environment.json ./local/

# Create a default Sqlite database so that if the container is run
# without any external state.
RUN python manage.py migrate
RUN python manage.py load_modules

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]