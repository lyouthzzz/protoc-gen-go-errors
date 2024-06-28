ERRORS_PROTO_FILES=$(shell find errors -name *.proto)
EXAMPLE_PROTO_FILES=$(shell find examples -name *.proto)

.PHONY: install
# install proto-gen-go-errors plugin
install:
	go install github.com/lyouthzzz/protoc-gen-go-errors

.PHONY: errors
# generate errors proto
errors:
	protoc --proto_path=. \
 	       --go_out=paths=source_relative:. \
 	       --go-http_out=paths=source_relative:. \
 	       --go-grpc_out=paths=source_relative:. \
	       $(ERRORS_PROTO_FILES)

.PHONY: example
# generate example errors code
example:
	protoc --proto_path=. \
		   --go_out=paths=source_relative:. \
		   --go-errors_out=paths=source_relative:. \
		   $(EXAMPLE_PROTO_FILES)