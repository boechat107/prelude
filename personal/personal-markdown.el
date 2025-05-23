(require 'markdown-mode)
(require 'evil)

(with-eval-after-load 'markdown-mode
  (defun personal-gfm-mode-defaults ()
    (electric-pair-local-mode +1)
    (outline-minor-mode +1)
    (setq markdown-command
          '("pandoc" "--from=markdown" "--to=html5" "--standalone"
            "--metadata" "title=Untitled Document"))

    (evil-define-key '(normal visual) gfm-mode-map
      ",b" 'markdown-insert-bold
      ",i" 'markdown-insert-italic))

  (add-hook 'markdown-mode-hook 'personal-gfm-mode-defaults))
