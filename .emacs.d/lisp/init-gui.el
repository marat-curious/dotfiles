;; Behaviour specific to non-TTY frames -*- lexical-binding: t -*-

(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(tool-bar-mode 0)

(setq
	use-file-dialog nil
	use-dialog-box nil
	inhibit-startup-screen t)

(setq-default
	window-resize-pixelwise t
	frame-resize-pixelwise t)

(provide 'init-gui)
