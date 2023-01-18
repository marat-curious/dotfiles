;; Load the configuration -*- lexical-binding: t -*-

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (locate-user-emacs-file "custom.el"))
(load-file custom-file)

(setq initial-major-mode 'fundamental-mode)

(require 'init-utils)
(require 'init-packages)
(require 'init-preferences)
(require 'init-exec-path)
(require 'init-macos-keys)
(require 'init-theme)
(require 'init-gui)
(require 'init-ido)
(require 'init-tree-sitter)

(require 'init-eglot)

(require 'init-golang)
(require 'init-typescript)
