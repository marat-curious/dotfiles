;; Theme -*- lexical-binding: t -*-

(load-theme 'tsdh-dark t)

(defun load-tsdh-dark-theme (_frame)
  (enable-theme 'tsdh-dark))

(add-hook 'after-make-frame-function #'load-tsdh-dark-theme)

(provide 'init-theme)
