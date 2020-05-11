REPO?=tduek
IMAGE?=flask-http
TAG?=0.1
MULTIARCH_TAG?=m-0.1
PLATFORMS?=linux/amd64,linux/arm64

all: build build-multiarch

.PHONY: build
build: ## Build and 
	docker build -t $(REPO)/$(IMAGE):$(TAG) .

.PHONY: push
push: ## 
	docker push $(REPO)/$(IMAGE):$(TAG) 

.PHONY: build-multiarch
build-multiarch: ## 
	docker buildx build --platform $(PLATFORMS) -t $(REPO)/$(IMAGE):$(MULTIARCH_TAG) --push .

.PHONY: deploy-k8s
deploy-k8s: ## 
	docker buildx build --platform $(PLATFORMS) -t $(REPO)/$(IMAGE):$(MULTIARCH_TAG) --push .

