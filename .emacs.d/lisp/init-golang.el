;; Support for Go language -*- lexical-binding: t -*-

(unless (package-installed-p 'go-mode)
	(package-install 'go-mode))

(add-auto-mode 'go-mode '(cons "\\.go\\'" 'go-mode))

(require 'go-mode)
(require 'project)

(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

(with-eval-after-load 'eglot
	(add-hook 'go-mode-hook 'eglot-ensure))

(add-hook 'project-find-functions #'project-find-go-module)

(provide 'init-golang)
