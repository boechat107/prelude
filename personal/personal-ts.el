(require 'prelude-ts)

(with-eval-after-load 'typescript-mode
  (defun personal-ts-mode-defaults ()
    (setq prelude-format-on-save nil))

  (add-hook 'typescript-mode-hook 'personal-ts-mode-defaults))
