;; Emacs LSP client -*- lexical-binding: t -*-

(use-package eglot
	:commands eglot
	:config
		(add-to-list 'eglot-server-programs '(go-mode . ("gopls"))))

(provide 'init-eglot)
