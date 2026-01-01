(require 'prelude-ts)

(with-eval-after-load 'typescript-mode
  (defun personal-ts-mode-defaults ()
    (hs-minor-mode +1)
    (mise-mode +1)
    (setq lsp-clients-typescript-tls-path
          "/home/boechat/.local/share/mise/installs/node/20.18.0/bin/tsserver")
    (setq prelude-format-on-save nil))

  (add-hook 'typescript-mode-hook 'personal-ts-mode-defaults))

(use-package prettier-js
  :ensure t
  :hook (typescript-mode . prettier-js-mode)
  :custom
  (prettier-js-use-modules-bin t))
