(require 'prelude-go)

(with-eval-after-load 'go-mode

  (defun personal-go-mode-defaults ()
    (hs-minor-mode +1))

  (add-hook 'prelude-go-mode-hook
            'personal-go-mode-defaults))
