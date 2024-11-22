deploy:
	caprover deploy -h https://captain.larah.dev -b main -a graphql-bsky-feed --default

venv: requirements.txt
	virtualenv venv --python=python3
	venv/bin/pip install -U pip
	venv/bin/pip install -r requirements.txt
