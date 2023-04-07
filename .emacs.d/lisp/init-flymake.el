;; -*- lexical-binding: t -*-

(with-eval-after-load 'flymake-mode
    (define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
    (define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error))

(provide 'init-flymake)
