API_PROTO_FILES=$(shell find examples -name *.proto)

.PHONY: install
# install proto-gen-go-errors plugin
install:
	go install github.com/lyouthzzz/protoc-gen-go-errors

.PHONY: errors
# generate errors code
errors:
	protoc --proto_path=. \
		   --go_out=paths=source_relative:. \
		   --go-errors_out=paths=source_relative:. \
		   $(API_PROTO_FILES)