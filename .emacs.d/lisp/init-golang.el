;; Support for Go language -*- lexical-binding: t -*-

(use-package go-mode)

(add-hook 'go-mode-hook 'eglot-ensure)

(provide 'init-golang)
