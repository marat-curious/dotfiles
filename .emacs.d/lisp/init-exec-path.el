;; Set up exec-path to help Emacs find programs  -*- lexical-binding: t -*-

(require 'exec-path-from-shell)

(with-eval-after-load 'exec-path-from-shell
    (dolist (var '("LANG" "LC_CTYPE"))
        (add-to-list 'exec-path-from-shell-variables var)))

(when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))

(provide 'init-exec-path)
