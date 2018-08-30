.PHONY: init remove clean dist

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## creates a new python environment containing all dependencies
	pipenv install --dev

remove: ## remove the python environment
	pipenv --rm

run: ## runs the lambda
	pipenv run python dnvriend/mymodule.py

clean: ## removes all build artifacts
	rm -rf *.egg-info build dist .eggs output.txt .terraform

dist: ## create a lambda distribution
	pipenv run python setup.py ldist

apply:
	terraform apply -auto-approve

destroy:
	terraform destroy -auto-approve

plan:
	terraform plan

show:
	terraform show

refresh:
	terraform refresh

output:
	terraform output

invoke:
	aws lambda invoke --function-name helloworld output.txt

tinit:
	terraform init

deploy:
	make clean
	make dist
	make tinit
	make plan
	make apply
