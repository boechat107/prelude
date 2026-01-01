(require 'prelude-js)

(prelude-require-package 'nodejs-repl)

(add-hook 'prelude-js-mode-hook
          (lambda ()
            (require 'nodejs-repl)
            (mise-mode +1)
            (subword-mode -1)
            (hs-minor-mode +1)
            (message "Loaded personal JS config")))
(add-hook 'nodejs-repl-mode-hook
          (lambda ()
            ;; NOTE: The REPL mode doesn't support hs-minor-mode.
            (smartparens-mode +1)
            (message "Loaded personal JS REPL config")))

(use-package prettier-js
  :ensure t
  :hook (js2-mode . prettier-js-mode)
  :custom
  (prettier-js-use-modules-bin t))
