(require 'prelude-lsp)
(require 'use-package)
(prelude-require-packages '(kotlin-mode flycheck-kotlin))

(use-package kotlin-mode
  ; :after (lsp-mode)
  ; :hook (kotlin-mode . lsp)
  :hook (kotlin-mode . hs-minor-mode))
