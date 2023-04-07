;; Tree-sitter -*- lexical-binding: t -*-

(rc/require 'tree-sitter)
(rc/require 'tree-sitter-langs)

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(provide 'init-tree-sitter)
