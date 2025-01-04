;; Emacs 27+ pre-initialisation config

;; Emacs 27+ loads this file before (normally) calling
;; `package-initialize'.  We use this file to suppress that automatic
;; behaviour so that startup is consistent across Emacs versions.
(setq package-enable-at-startup nil)

;; So we can detect this having been loaded
(provide 'early-init)
