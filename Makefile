# Hugo Blog Makefile
# ====================

.PHONY: dev new-post build clean help

# Default target
.DEFAULT_GOAL := help

# Development server with live reload
dev:
	hugo server -D --navigateToChanged

# Create a new blog post
# Usage: make new-post name="my-new-post-title"
new-post:
ifndef name
	$(error name is required. Usage: make new-post name="my-post-title")
endif
	hugo new posts/$(name).md

# Build the site for production
build:
	hugo --minify

# Clean the public directory
clean:
	rm -rf public/

# Show help
help:
	@echo "Available commands:"
	@echo "  make dev                        - Start development server with live reload (includes drafts)"
	@echo "  make new-post name=\"post-title\" - Create a new blog post"
	@echo "  make build                      - Build the site for production"
	@echo "  make clean                      - Remove the public directory"
	@echo "  make help                       - Show this help message"
