;; Load the configuration -*- lexical-binding: t -*-

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

(setq gc-cons-percentage 0.5
      gc-cons-threshold (* 128 1024 1024))

(eval-and-compile
  (defsubst emacs-path (path)
    (expand-file-name path user-emacs-directory))

  (setq package-enable-at-startup nil
        load-path
        (append (list (emacs-path "use-package"))
                (delete-dups load-path)
                (list (emacs-path "lisp")))))

(setq custom-file (locate-user-emacs-file "custom.el"))
(load-file custom-file)

(setq initial-major-mode 'fundamental-mode)

(require 'init-packages)
(require 'init-rc)
(require 'init-utils)
(require 'init-preferences)
(require 'init-exec-path)
(require 'init-macos-keys)
(require 'init-xclip)
(require 'init-theme)
(require 'init-gui)
(require 'init-ido)
(require 'init-tree-sitter)
(require 'init-whitespace)

(require 'init-eglot)
(require 'init-flymake)

(require 'init-elm)
(require 'init-golang)
(require 'init-ocaml)
(require 'init-typescript)

(use-package eldoc
  :preface
  (add-to-list 'display-buffer-alist
               '("^\\*eldoc for" display-buffer-at-bottom
                 (window-height . 4)))
  (setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(add-hook 'after-init-hook #'garbage-collect t)
