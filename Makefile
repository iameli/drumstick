
.PHONY: all push

all: .
	docker build -t iameli/drumstick .

push: .
	docker push iameli/drumstick
