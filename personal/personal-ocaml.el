(require 'prelude-ocaml)

(use-package merlin-eldoc
  :ensure t
  :hook ((reason-mode tuareg-mode caml-mode) . merlin-eldoc-setup))

(add-hook 'tuareg-mode-hook
          (lambda ()
            (whitespace-mode -1)))
