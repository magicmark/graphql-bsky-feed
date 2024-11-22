deploy:
	caprover deploy -h https://graphql-bsky-feed.larah.dev -b master -a graphql-bksy-feeed --default

venv: requirements.txt
	virtualenv venv --python=python3
	venv/bin/pip install -U pip
	venv/bin/pip install -r requirements.txt
