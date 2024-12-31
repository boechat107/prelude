(require 'prelude-c)

;; Formatting code with "format-all"
;; https://github.com/lassik/emacs-format-all-the-code
;;
;; An example of a file ".clang-format"
;; ---
;; BasedOnStyle: LLVM
;; IndentWidth: 4
;; ---
(prelude-require-packages '(format-all))

(with-eval-after-load 'cc-mode
  (defun personal-c-mode-defaults ()
    (hs-minor-mode +1)
    (setq c-basic-offset 2)
    (setq c-indent-level 2))

  (add-hook 'prelude-c-mode-common-hook
            'personal-c-mode-defaults))
