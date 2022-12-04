;; Support for Go language -*- lexical-binding: t -*-

(require 'project)
(require 'go-mode)

(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

(add-hook 'go-mode-hook 'eglot-ensure)
(add-hook 'project-find-functions #'project-find-go-module)

(provide 'init-golang)
