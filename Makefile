.PHONY: deploy_full
deploy_full:
	@if [ -z $$(docker network ls --filter name=permate_network -q) ]; then \
    		docker network create permate_network; \
    		echo "Network permate_network has been created successfully"; \
    	else \
    		echo "Network permate_network already exists"; \
	fi
	docker compose -f development/docker-compose.yaml down
	docker compose -f development/docker-compose.yaml build
	docker compose -f development/docker-compose.yaml up -d

	docker compose -f development/haproxy/docker-compose.yaml down
	docker compose -f development/haproxy/docker-compose.yaml up -d

.PHONY: ec2_build
ec2_build:
	ansible all --module-name ansible.builtin.ping --user ubuntu --inventory ansible/setup/inventory.yaml
	ansible-playbook --inventory ansible/setup/inventory.yaml ansible/setup/playbook.yaml

.PHONY: deploy
deploy:
	git add .
	git commit -am "Commit project"
	git push
	ansible all --module-name ansible.builtin.ping --user ubuntu --inventory ansible/deploy/inventory.yaml
	ansible-playbook --inventory ansible/setup/inventory.yaml ansible/deploy/playbook.yaml