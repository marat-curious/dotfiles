;;; init.el --- Main configuration file -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

;; Keywords: Emacs configuration
;; Homepage: https://github.com/marat-curious/dotfiles.git

;;; Commentary:
;; Emacs 30+ configuration.

;;; Code:

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(eval-and-compile
  (defsubst emacs-path (path)
    (expand-file-name path user-emacs-directory))

  (setq package-enable-at-startup nil
        load-path
        (append (list (emacs-path "use-package"))
                (delete-dups load-path)
                (list (emacs-path "lisp")))))

(require 'use-package)

(setq use-package-verbose t
      use-package-expand-minimally nil
      use-package-compute-statistics t
      debug-on-error init-file-debug
      debug-on-quit init-file-debug)

(use-package emacs
  :demand t
  :custom
  (auto-hscroll-mode 'current-line)
  (auto-save-interval 64)
  (auto-save-timeout 2)
  (create-lockfiles nil)
  (enable-recursive-minibuffers t)
  (fill-column 80)
  (global-display-fill-column-indicator-mode)
  (history-delete-duplicates t)
  (history-length 200)
  (load-prefer-newer t)
  (menu-bar-mode nil)
  (redisplay-dont-pause t)
  (tool-bar-mode nil)
  (visible-bell t)
  (x-stretch-cursor t)
  (case-fold-search nil)
  (fast-but-imprecise-scrolling t)
  (fido-mode t)
  (mark-even-if-inactive nil)
  (use-dialog-box nil)
  (use-file-dialog nil)
  (global-auto-revert-mode t)
  (ring-bell-function 'ignore)
  (transient-mark-mode t)
  (bidi-inhibit-bpa t)
  (bidi-paragraph-direction 'left-to-right)

  ;; startup.el
  (inhibit-startup-screen t)
  (initial-buffer-choice t)
  (initial-major-mode 'fundamental-mode)
  (initial-scratch-message "")

  ;; files.el
  (auto-save-default nil)
  (create-lockfiles nil)
  (large-file-warning-threshold nil)
  (make-backup-files nil)
  (version-control t)

  ;; paragraphs.el
  (sentence-end-double-space nil)

  ;; paren.el
  (show-paren-mode t)
  (show-paren-delay 0)

  ;; simple.el
  (backward-delete-char-untabify-method 'untabify)
  (column-number-mode t)
  (indent-tabs-mode nil)
  (kill-do-not-save-duplicates t)
  (kill-ring-max 500)
  (kill-whole-line t)
  (line-number-mode t)
  (mail-user-agent 'gnus-user-agent)
  (next-line-add-newlines nil)
  (save-interprogram-paste-before-kill t)

  ;; scroll-bar.el
  (scroll-bar-mode nil)

  ;; whitespace.el
  (show-trailing-whitespace t)

  :init
  (setq-default
   load-prefer-newer t
   truncate-lines t
   auto-window-vscroll nil
   disabled-command-function nil
   frame-resize-pixelwise t
   use-short-answers t
   window-resize-pixelwise t)

  (load-theme 'plain t)

  (prefer-coding-system 'utf-8-unix)
  (set-charset-priority 'unicode)
  (set-default-coding-systems 'utf-8-unix)
  (set-keyboard-coding-system 'utf-8-unix)
  (set-language-environment "utf-8")
  (set-terminal-coding-system 'utf-8-unix)

  :custom
  ;; (set-frame-font "Google Sans Code:size=14")
  ;; (set-frame-font "JetBrains Mono:size=14")
  (set-frame-font "Iosevka Extended:size=16")
  (set-frame-parameter nil 'fullscreen 'maximized)

  (global-set-key [?\C-h] 'delete-backward-char)
  (global-set-key [?\C-x ?h] 'help-command))

(use-package custom
  :custom
  (custom-file (locate-user-emacs-file "custom.el"))
  :init
  (load custom-file :noerror))

(use-package eldoc
  :delight eldoc-mode
  :defer t
  :init
  (global-eldoc-mode)
  :preface
  (setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
  :custom
  (eldoc-echo-area-use-multiline-p nil)
  (eldoc-echo-area-display-truncation-message nil)
  (eldoc-echo-area-prefer-doc-buffer t))

(use-package whitespace
  :config
  (global-whitespace-mode t)
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

(use-package flymake
  :defer t
  :preface
  (defvar flymake-prefix-map (make-sparse-keymap))
  (fset 'flymake-prefix-map flymake-prefix-map)
  :hook
  (prog-mode . flymake-mode)
  :bind (:map ctl-x-map
              ("!" . flymake-prefix-map)
              :map flymake-prefix-map
              ("l" . flymake-show-buffer-diagnostics)
              ("n" . flymake-goto-next-error)
              ("p" . flymake-goto-prev-error))
  :custom
  (flymake-fringe-indicator-position 'right-fringe)
  (flymake-mode-line-lighter "FlyM")
  :config
  (setq elisp-flymake-byte-compile-load-path (cons "./" load-path)))

(use-package eglot
  :hook ((typescript-mode . eglot-ensure))
  :bind (:map eglot-mode-map
              ("C-e M-x" . eglot-code-actions)
              ("C-e c" . completion-at-point)
              ("C-e m" . imenu)
              ("C-e h" . display-local-help)
              ("C-e ." . xref-find-definitions)
              ("C-e ," . xref-go-back)
              ("C-e ?" . xref-find-references)
              ("C-e r" . eglot-rename)
              ("C-e f" . eglot-format))
  :custom (eglot-autoshutdown t))

;;; Completion

(use-package vertico
  :ensure t
  :bind (:map vertico-map
              ("M-RET" . vertico-exit-input))
  :hook (after-init . vertico-mode)
  :custom
  (global-set-key (kbd "M-x") 'execute-extended-command))

(use-package vertico-directory
  :after vertico
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion))))
  (completion-pcm-leading-wildcard t))

(use-package marginalia
  :ensure t
  :hook (after-init . marginalia-mode))

(use-package consult
  :commands (consult-completion-in-region)
  :preface
  (defvar consult-prefix-map (make-sparse-keymap))
  (fset 'consult-prefix-map consult-prefix-map)
  :bind (;; C-c bindings in `mode-specific-map
         ("C-c M-x ". consult-mode-command)
         ("C-c h" . consult-history)
         ("C-c m" . consult-man)
         ("C-c i" . consult-info))
         ("C-c r" . consult-recent-file)
  :custom
  (consult-preview-key nil)
  :init
  (setq completion-in-region-function #'consult-completion-in-region))

(use-package corfu
  :ensure t
  :bind (:map corfu-map
              ("TAB" . corfu-next)
              ([tab] . corfu-next)
              ("S-TAB" . corfu-previous)
              ([backtab] . corfu-previous)
              ([remap completion-at-point] . corfu-complete)
              ("RET" . corfu-complete-and-quit)
              ("<return>" . corfu-complete-and-quit))
  :commands (corfu-quit)
  :custom
  (corfu-cycle t)
  (corfu-preselect-first t)
  (corfu-scroll-margin 4)
  (corfu-quit-no-match t)
  (corfu-quit-at-boundary t)
  (tab-always-indent 'complete)
  :config
  (defun corfu-complete-and-quit ()
    (interactive)
    (corfu-complete)
    (corfu-quit))
  :hook (after-init . global-corfu-mode))

(use-package corfu-popupinfo
  :bind (:map corfu-popupinfo-map
              ("M-p" . corfu-popupinfo-scroll-down)
              ("M-n" . corfu-popupinfo-scroll-up))
  :hook (corfu-mode . corfu-popupinfo-mode)
  :custom-face
  (corfu-popupinfo ((t :height 1.0))))

(use-package corfu-terminal
  :unless (display-graphic-p)
  :hook after-init)

(use-package cape
  :after corfu
  :bind ("C-c p" . cape-prefix-map)
  :init
  (add-hook 'completion-at-point-function #'cape-dabbrev)
  (add-hook 'completion-at-point-function #'cape-file)
  (add-hook 'completion-at-point-function #'cape-elisp-block)
  (add-hook 'completion-at-point-function #'cape-history)
  :config
  (setq completion-at-point-function '(cape-file))
  (setq completion-category-overrides '((eglot (styles orderless))
                                        (eglot-capf (styles orderless)))))

(use-package affe
  :ensure t
  :config
  (consult-customize affe-grep :preview-key "M-.")
  (defun affe-orderless-regexp-compiler (input _type _ignorecase)
    (setq input (cdr (orderless-compile input)))
    (cons input (apply-partially #'orderless--highlight input t)))
  (setq affe-regexp-compiler #'affe-orderless-regexp-compiler))

;;; Languages

(use-package cc-mode
  :hook (c-mode-common . cc-mode-setup)
  :custom
  (c-basic-offset 4)
  (c-default-style "linux")
  :config
  (defun cc-mode-setup ()
    (c-set-offset 'case-label '+)
    (setq-local comment-start "//"
                comment-end ""
                tab-width 4)))

(use-package elisp-mode
  :hook ((emacs-lisp-mode . eldoc-mode)
         (emacs-lisp-mode . common-lisp-modes-mode)))

(use-package js
  :defer t
  :custom
  (js-indent-level 2))

(use-package scala-mode
  :defer t)

(use-package clojure-mode
  :hook ((clojure-mode
          clojurec-mode
          clojurescript-mode) . clojure-mode-setup)
  :commands (clojure-project-dir)
  :bind (:map clojure-mode-map
              ("C-:" . nil))
  :preface
  (defun clojure-set-compile-command ()
    (let ((project-dir (clojure-project-dir)))
      (cond ((and (file-exists-p (expand-file-name "project.clj" project-dir))
                  (executable-find "lein"))
             (setq-local compile-command "lein"))
            ((and (file-exists-p (expand-file-name "deps.edn" project-dir))
                  (executable-find "clojure"))
             (setq-local compile-command "clojure")))))
  (defun clojure-mode-setup ()
    "Setup Clojure buffer."
    (common-lisp-modes-mode 1)
    (clojure-set-compile-command)))

(use-package lisp-mode
  :hook ((lisp-mode lisp-data-mode) . common-lisp-modes-mode))

;;; Tree-sitter mode

(use-package treesit
  :when (treesit-p)
  :functions (treesit-ready-p)
  :preface
  (defun treesit-p ()
    "Check if Emacs was built with treesitter in a protable way."
    (and (fboundp 'treesit-available-p)
         (treesit-available-p)))
  (cl-defun treesit-install-and-remap
      (lang url &key revision source-dir modes remap org-src)
    "Convenience function for installing and enabling a ts-* mode.

`lang` is the language symbol. `url` is the git repository url for the grammar.
`revision` is the git tag or branch of the desired version, defaulting to the
latest default branch. `source-dir` is the relative subdirectory in the
repository in which the grammar's parser.c file resides, defaulting to \"src\".
`modes` is a list of modes to remap to a symbol `remap`. `org-src` is a cons
specifying a source code block language name and a corresponding major mode."
    (when (and (fboundp 'treesit-available-p)
               (treesit-available-p))
      (unless (treesit-language-available-p lang)
        (add-to-list
         'treesit-language-source-alist
         (list lang url revision source-dir))
        (treesit-install-language-grammar lang))
      (when (and remap (treesit-ready-p lang))
        (dolist (mode modes)
          (add-to-list
           'major-mode-remap-alist
           (cons mode remap))))
      (when (and org-src (treesit-ready-p lang))
        (eval-after-load 'org
          (lambda ()
            (add-to-list 'org-src-lang-modes org-src))))))
  :custom
  (treesit-font-lock-level 2))

(use-package js
  :defer t
  :when (treesit-p)
  :init
  (treesit-install-and-remap
   'javascript "https://github.com/tree-sitter/tree-sitter-javascript"
   ;; :revision "master"
   :revision "v0.23.1"
   :source-dir "src"
   :modes '(js-mode javascript-mode)
   :remap 'js-ts-mode
   :org-src '("js" . js-ts)))

(use-package typescript
  :defer t
  :when (treesit-p)
  :init
  (treesit-install-and-remap
   'typescript "https://github.com/tree-sitter/tree-sitter-typescript"
   :revision "master"
   :source-dir "typescript"
   :modes '(typescript-mode)
   :remap 'typescript-ts-mode
   :org-src '("ts" . typescript-ts)))

(use-package tsx
  :defer t
  :when (treesit-p)
  :init
  (treesit-install-and-remap
   'tsx "https://github.com/tree-sitter/tree-sitter-typescript"
   :revision "master"
   :source-dir "tsx"
   :modes '(tsx-ts-mode)
   :remap 'tsx-ts-mode
   :org-src '("tsx" . tsx-ts)))

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

(use-package editorconfig
  :config
  (editorconfig-mode 1))

(provide 'init)
;;; init.el ends here
