.PHONY: black-check
black-check:
	black --check .

.PHONY: black-fix
black-fix:
	black .

.PHONY: clean-chown
clean-chown:
	sudo chown -R $(USER):$(USER) ./apps ./django_conf ./manage.py ./requirements

.PHONY: isort-check
isort-check:
	isort --recursive --check-only .

.PHONY: isort-fix
isort-fix:
	isort --recursive .

.PHONY: run-tests
run-tests:
	docker-compose -f docker-compose.ci.yml build
	docker-compose -f docker-compose.ci.yml run kikeou-test pytest
