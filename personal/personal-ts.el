(require 'prelude-ts)

(with-eval-after-load 'typescript-mode
  (defun personal-ts-mode-defaults ()
    (mise-mode +1)
    (setq lsp-clients-typescript-tls-path
          "/home/boechat/.local/share/mise/installs/node/20.18.0/bin/tsserver")
    (setq prelude-format-on-save nil))

  (add-hook 'typescript-mode-hook 'personal-ts-mode-defaults))
