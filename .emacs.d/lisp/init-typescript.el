;; Support for TypeScript language -*- lexical-binding: t -*-

(require 'typescript-mode)

(define-derived-mode typescriptreact-mode typescript-mode "TypeScript TSX")

(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescriptreact-mode))
(add-to-list 'tree-sitter-major-mode-language-alist '(typescriptreact-mode . tsx))

(provide 'init-typescript)
