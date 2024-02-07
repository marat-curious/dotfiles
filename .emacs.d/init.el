;;; package --- Emacs configuration

;;; Commentary: Configuration file

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
(require 'init-gui)

(fido-mode t)

(load-theme 'plain t)

(require 'init-elm)
(require 'init-golang)
(require 'init-ocaml)

(use-package flymake
  :defer t
  :hook
  (prog-mode . flymake-mode)
  :bind ("C-x h ." . display-local-help)
  :bind (:map flymake-mode-map
              ("M-n" . flymake-goto-next-error)
              ("M-p" . flymake-goto-prev-error)
              ("M-l" . flymake-show-buffer-diagnostics)))

;; to use in monorepo
(setq project-vc-extra-root-markers '("package.json"))

(use-package vc
  :defer t
  :bind (("C-x v d" . vc-dir)
         ("C-x v =" . vc-diff)
         ("C-x v D" . vc-root-diff)
         ("C-x v v" . vc-next-action))
  :custom
  (vc-command-messages t)
  (vc-follow-symlinks t)
  (vc-git-diff-switches '("-w" "-U3"))
  (vc-handled-backends '(Git Hg))
  (vc-make-backup-files t))

(use-package dabbrev
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :custom
  (dabbrev-ignored-buffer-regexps '("\\.\\(?:pdf\\|jpe?g\\|png\\)\\'")))

(use-package eldoc
  :init
  (global-eldoc-mode)
  :preface
  (setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
  :custom
  (eldoc-echo-area-use-multiline-p 3)
  (eldoc-echo-area-display-truncation-message nil))

(use-package editorconfig
  :config
  (editorconfig-mode 1))

;; M-x treesit-install-language-grammar [language]
(setq treesit-language-source-alist
      '((tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")))

(use-package tree-sitter)

(use-package typescript-mode
  :after tree-sitter
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode)))

(use-package eglot
  :bind (("M-TAB" . completion-at-point)
        ;;("C-M-i" . completion-at-point)
        ("M-g i" . imenu)
        ("C-x h ." . display-local-help)
        ("M-." . xref-find-definitions)
        ("M-," . xref-go-back)
        ("M-?" . xref-find-references))
  :bind (:map eglot-mode-map
              ("C-c e a" . eglot-code-actions)
              ("C-c e r" . eglot-rename)
              ("C-c e f" . eglot-format)))

(use-package whitespace
  :config
  (global-whitespace-mode 1)
  :custom
  (setq whitespace-line-column 80)
  (setq whitespace-style
      '(
        empty
        face
        indentation
        lines-tail
        newline
        newline-mark
        space-after-tab
        space-before-tab
        spaces
        space-mark
        tabs
        tab-mark
        trailing
        )))

(add-hook 'after-init-hook #'garbage-collect t)
