.PHONY: dev
dev:

	@if [ -z $$(docker network ls --filter name=permate_network -q) ]; then \
    		docker network create permate_network; \
    		echo "Network permate_network has been created successfully"; \
    	else \
    		echo "Network permate_network already exists"; \
	fi
	docker compose -f src/lander/docker-compose.yaml down
	docker compose -f src/lander/docker-compose.yaml build
	docker compose -f src/lander/docker-compose.yaml up -d

	docker compose -f src/offer/docker-compose.yaml down
	docker compose -f src/offer/docker-compose.yaml build
	docker compose -f src/offer/docker-compose.yaml up -d

	docker compose -f src/haproxy/docker-compose.yaml down
	docker compose -f src/haproxy/docker-compose.yaml build
	docker compose -f src/haproxy/docker-compose.yaml up -d

.PHONY: build
build:
	ansible all --module-name ansible.builtin.ping --user ubuntu --inventory src/ansible/build/inventory.yaml
	ansible-playbook --inventory src/ansible/build/inventory.yaml src/ansible/build/playbook.yaml

.PHONY: deploy
deploy:
	ansible all --module-name ansible.builtin.ping --user ubuntu --inventory src/ansible/deploy/inventory.yaml
	ansible-playbook --inventory src/ansible/deploy/inventory.yaml src/ansible/deploy/playbook.yaml
