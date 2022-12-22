;; Load the configuration -*- lexical-binding: t -*-

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (locate-user-emacs-file "custom.el"))

(require 'init-utils)
(require 'init-packages)
(require 'init-preferences)
(require 'init-macos-keys)
(require 'init-theme)
(require 'init-gui)
(require 'init-ido)

(require 'init-eglot)

(require 'init-golang)
