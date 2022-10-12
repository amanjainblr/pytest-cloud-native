install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv --cov=hello tests
	# python -m pytest --nbval notebook.ipynb

one-test:
	python -m pytest -vv tests/test_hello.py::test_more_hello

format:
	black *.py

lint:
	pylint --disable=R,C hello.py
	#lint Dockerfile
	#docker run --rm -i hadolint/hadolint < Dockerfile

	
all: install lint test format 
