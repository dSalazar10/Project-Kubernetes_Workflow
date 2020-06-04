## Student instructions
# Dockerfile should pass hadolint
# app.py should pass pylint
# optional, but recommended, build a simple integration test

setup:
	# Create python virtualenv & source it
	# source ~/.udacity-devops/bin/activate
	python3 -m venv venv
	# You have to run the following command in the CLI
	#source venv/bin/activate

install:
	# This should be run from inside a virtualenv
	pip3 install --upgrade pip &&\
	pip3 install -r requirements.txt
	wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.17.6/hadolint-Linux-x86_64
	chmod +x /bin/hadolint
	
validate-circleci:
	circleci config process /.circleci/config.yml

run-circleci-local:
	# See https://circleci.com/docs/2.0/local-cli/#running-a-job
	circleci local execute

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203 app.py

all: install lint test
