;;;;;;;;;;;;;;;;
;; How to use ;;
;;;;;;;;;;;;;;;;
;;
;; 1. Create an opam switch for the project.
;; 2. Install the dev packages.
;; 3. While editing a project file, use "opam-switch-set-switch".

(require 'prelude-ocaml)

(use-package merlin-eldoc
  :ensure t
  :hook ((reason-mode tuareg-mode caml-mode) . merlin-eldoc-setup))

(use-package opam-switch-mode
  :ensure t
  :hook ((coq-mode tuareg-mode) . opam-switch-mode))

(add-hook 'tuareg-mode-hook
          (lambda ()
            (whitespace-mode -1)))
