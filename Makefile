BaseProject = github.com/rochelitas/rally

# https://github.com/deepmap/oapi-codegen
.PHONY: tidy
tidy:
	go mod tidy

.PHONY: gen
gen: api/api.gen.go

# .PHONY: validate
# validate:
# 	# go run github.com/getkin/kin-openapi/cmd/validate@latest -- rally.yaml
# 	go run github.com/getkin/kin-openapi/cmd/validate@latest --defaults --examples --ext --patterns -- rally.yaml

api/api.gen.go: rally.yaml
	oapi-codegen -package api $< >$@ 2>$@.err

.PHONY: install-oapi-codegen
install-oapi-codegen:
	go install github.com/deepmap/oapi-codegen/cmd/oapi-codegen@latest

# core/api.go: rally.yaml
# 	go run github.com/ogen-go/ogen/cmd/ogen --target core -package api --clean rally.yaml

# .PHONY: install-ogen
# 	go install github.com/ogen-go/ogen@latest
